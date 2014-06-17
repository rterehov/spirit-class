role :app,  "s-1"
role :db,   "s-1", :primary => true

set :app_role, "st.#{app}"
set :app_dir, File.join(base_dir, app_role)
set :deploy_to, app_dir
set :settings_path, "#{deploy_to}/current/main/settings/"
set :local_settings_repo, "staging.py"
# set :branch, ENV['BRANCH'] || "release/1.7.0"
set :branch, ENV['BRANCH'] || "master"
set :keep_releases, 5
