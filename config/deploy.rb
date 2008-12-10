set :application, "ynfb"
set :repository,  "git@github.com:philnash/ynfb.git"

# If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:
# set :deploy_to, "/var/www/#{application}"

# If you aren't using Subversion to manage your source code, specify
# your SCM below:
set :scm, :git
set :scm_passphrase, "MDSJE520" #This is your custom users password
set :branch, "master"
set :scm_verbose, true

set :user, "nashville"
set :domain, 'gobstopper.dreamhost.com' # Dreamhost servername where your account is located
set :project, 'ynfb' # Your application as its called in the repository
set :application, 'merb.philnash.co.uk' # Your app's location (domain or sub-domain name as setup in panel)
set :applicationdir, "/home/#{user}/#{application}" # The standard Dreamhost setup

set :deploy_to, applicationdir
set :deploy_via, :remote_cache

role :app, domain
role :web, domain
role :db,  domain, :primary => true

set :use_sudo, false

desc "Link shared files"
task :before_symlink do
  def use_shared_dir(path_to_file)
    run "rm -rf #{release_path}/#{path_to_file}"
    run "ln -nfs #{deploy_to}/#{shared_dir}/#{path_to_file} #{release_path}/#{path_to_file}"
  end
  shared_dirs = ['log']
  shared_dirs.each{|p| use_shared_dir p }
end

namespace :deploy do   
  desc "Restart"  
  task :restart do  
    run "touch #{release_path}/tmp/restart.txt" 
  end  
end