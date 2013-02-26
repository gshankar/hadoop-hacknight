set :application, "hadoop-hacknight"
set :repository,  "git@github.com:mootpointer/hadoop-hacknight.git"
set :user, "user"
set :ssh_options, { :forward_agent => true }

set :deploy_via, :remote_cache
# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

set :deploy_to, "/home/user/#{application}"
role :hadoop_node, '103.7.164.85'


namespace :deploy do
  task :finalize_update do ; end
  task :restart do ; end
end

namespace :hadoop do

end

namespace :wukong do
  task :run do
    run "wu-hadoop #{current_path}/jobs/#{job}.rb --mode=hadoop -input=#{input}\
    --output=#{output} --hadoop_runner=/usr/bin/hadoop\
    --hadoop_home=/opt/cloudera/parcels/CDH-4.1.3-1.cdh4.1.3.p0.23/lib/hadoop-0.20-mapreduce"
  end
end

