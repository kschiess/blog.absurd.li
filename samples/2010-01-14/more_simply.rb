require 'rake'

task :build_rocket do
  p :build_rocket # rocket building here
end

task :launch_rocket => :build_rocket do
  p :launch_rocket # launching here - only works if you build it first
end

Rake::Task[:launch_rocket].invoke
