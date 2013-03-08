
require 'rake/clean'

# Clean _site so that everything we look at is new
CLEAN << '_site'

desc "Runs the site through jekyll, producing _site"
task :compile_site do
  sh "jekyll"
end

task :synch do
  sh "rsync -a -e ssh --delete _site/ kschiess@absurd.li:blog.absurd.li"
end

task :default => :compile_site

desc "Publish to blog.absurd.li."
task :publish => [:clean, :compile_site, :synch]

