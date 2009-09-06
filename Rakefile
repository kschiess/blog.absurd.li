
require 'rake/clean'

CLEAN << '_site'

desc "Runs the site through jekyll, producing _site"
task :compile_site do
  sh "jekyll"
end

task :synch => :compile_site do
  sh "rsync ..."
end

task :default => :compile_site

desc "Publish to blog.absurd.li."
task :publish => [:clean, :synch]

