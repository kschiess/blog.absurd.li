require 'rake'
require 'rake_remote_task'

role :server, 'server1'
role :server, 'server2'

remote_task :ls, :roles => :server do 
  run 'ls'
end

Rake::Task[:ls].invoke