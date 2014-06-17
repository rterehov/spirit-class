role :app,  "s-1"
role :db,   "s-1", :primary => true

set :app_role, "dev.#{app}"
set :app_dir, File.join(base_dir, app_role)
set :deploy_to, app_dir
set :settings_path, "#{deploy_to}/current/main/settings/"
set :local_settings_repo, "development.py"
set :branch, "develop"
set :branch, ENV['BRANCH'] || "develop"
set :keep_releases, 10