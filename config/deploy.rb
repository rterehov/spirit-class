# Global app deploy settings
set :app, "class"
set :user, "class"
set :base_dir, "/home/#{user}/projects/"
set :local_settings, "local.py"

# Stagings
require 'capistrano/ext/multistage'
set :default_stage, "dev"
set :stages, %w(production staging dev)

set :normalize_asset_timestamps, false

# Repo settings
set :scm, :git
set :git_enable_submodules, 1

# Что и как деплоим
set :repository, "git@bitbucket.org:rterehov/class.git"
set :deploy_via, :remote_cache

# Для выката с локальной машины
set :repository,  "."
set :deploy_via, :copy

ssh_options[:forward_agent] = true
default_run_options[:pty] = true

# Servers settings
set :use_sudo, false

before 'deploy', 'deploy:stop_file'

after "deploy:update", "deploy:cleanup", "deploy:set_local_settings",
      "deploy:pip_install", "deploy:collectstatic", "deploy:static_simlink", 
      "deploy:migrate"

after "deploy:migrate", "deploy:restart", 'deploy:stop_file_del'

namespace :deploy do
  desc 'Создает стоп-файл, чтобы другие процессы не начали обновление репо'
  task :stop_file do
    run "touch #{app_dir}/.stop.file"
  end

  desc 'Удаляет стоп-файл'
  task :stop_file_del do
    run "rm #{app_dir}/.stop.file"
  end

  # app
  desc "Создает симлинк на локальные настройки"
  task :set_local_settings, :roles => :app do
    run "cd #{settings_path} && ln -s #{local_settings_repo}  #{local_settings}"      
    run "cd #{deploy_to}/current/ && ln -s #{deploy_to}/shared/media && ln -s #{deploy_to}/shared/static"
  end

  desc "Установка зависимостей"
  task :pip_install, :roles => :app do
    run "cd #{deploy_to}/current/ && mkdir -p media && mkdir -p static"
    run "cd #{deploy_to}/current && ./scripts/deploy_make.sh #{app_role} req"
  end

  desc "collectstatic all"
  task :collectstatic, :roles => :app do
    run "cd #{deploy_to}/current && ./scripts/deploy_make.sh #{app_role} collectstatic"
  end

  desc "Создает симлинк на каталог со статикой"
  task :static_simlink, :roles => :app do
    run "cd #{deploy_to}/current/public && ln -s ../static && ln -s ../media"
  end

  desc "Меняет ветку с master на актуальную для текущего окружения"
  task :change_branch, :roles => :app do
      run "cd #{deploy_to}/current && git checkout #{branch}"
  end

  desc "Рестарт uwsgi сервера"
  task :restart, :roles => :app do
    run "touch #{app_dir}/restart.uwsgi"
  end

  desc "Релод uwsgi сервера"
  task :reload, :roles => :app do
    run "touch #{app_dir}/reload.uwsgi"
  end

  # db
  desc "compress"
  task :compress, :roles => :db do
    run "cd #{deploy_to}/current && ./scripts/deploy_make.sh #{app_role} compress"
  end

  desc "Запускает syncdb и migrate"
  task :migrate, :roles => :db do
    run "cd #{deploy_to}/current && ./scripts/deploy_make.sh #{app_role} db"
  end

  desc "Выполнение management-комманды"
  task :management, :roles => :db do
    # cap deploy:management -s data=<command>
    run "cd #{deploy_to}/current && bash ./scripts/management.sh #{app_role} #{data}"
  end

  desc "Загрузка фикстур"
  task :loaddata, :roles => :db do
    # cap deploy:loaddata -s data=<path to fixture>
    run "cd #{deploy_to}/current/ && bash ./scripts/loaddata.sh #{app_role} #{data}"
  end

  namespace :chats do
    desc "Рестарт tornado-чатов"
    task :restart, :roles => :app do
      run "touch #{app_dir}/restart.chats"
    end
  end
end


namespace :info do
  task :lastcommit do
    run "cd #{app_dir}/current && git log --name-status HEAD^..HEAD | head -n3 && echo"
  end
end