
require 'rspec/core/rake_task'
 
RSpec::Core::RakeTask.new :spec do |task|
  task.pattern = Dir['spec/**/*_spec.rb']
end
 
task :default => ['spec']

task :reset do
  system "dropdb acceptance-testing"
  system "createdb acceptance-testing"
  system "psql acceptance-testing < schema.sql"
end
