role :app,  "s-1"
role :db,   "s-1", :primary => true

set :app_role, "#{app}"
set :app_dir, File.join(base_dir, app_role)
set :deploy_to, app_dir
set :settings_path, "#{deploy_to}/current/main/settings/"
set :local_settings_repo, "production.py"
set :branch, "master"
set :branch, ENV['BRANCH'] || "master"
set :keep_releases, 20