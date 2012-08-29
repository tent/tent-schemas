require 'bundler/setup'
require 'rake/testtask'
require 'fileutils'
require 'json'
require 'yaml'

Rake::TestTask.new do |t|
  t.pattern = 'test/**/*_test.rb'
end

task :default => :test

desc "Generate schema json"
task :generate do
  FileUtils.mkdir('output')
  Dir.glob('schemas/*').each do |schema|
    json = JSON.pretty_generate(YAML.load(File.read(schema)))
    File.open("output/#{File.basename(schema, '.yaml')}.json", 'w') { |f| f.write(json) }
  end
end
