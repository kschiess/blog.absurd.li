require 'rake'
class RocketScience
  include Rake::TaskManager
  def task(*args, &block)
    define_task(Rake::Task, *args, &block)
  end

  def init
    task :build_rocket do
      p :build_rocket # rocket building here
    end

    task :launch_rocket => :build_rocket do
      p :launch_rocket # launching here - only works if you build it first
    end
    self
  end
end

class RocketScience   # reopen the class
  def run
    self[:launch_rocket].invoke
  end

  def options
    options = OpenStruct.new
    options.trace = false
    options.dryrun = false
    options
  end
end

RocketScience.new.init.run