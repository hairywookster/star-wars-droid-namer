require 'rdoc/task'
require "rake"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec) do |t|
  t.pattern = Dir.glob("spec/**/*_spec.rb")
  t.rspec_opts = "--format documentation"
end
task default: :spec

RDoc::Task.new do |rdoc|
  rdoc.main = "README.rdoc"
  rdoc.rdoc_files.include( "README.rdoc", "lib/**/*.rb")
end

desc "Run full build/spec/doc process"
task tests_and_docs: [:spec, :rdoc]

desc "Run specs"
task default: :spec
