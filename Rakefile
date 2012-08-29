require 'bundler/gem_tasks'
require 'rake/testtask'
require File.expand_path('../lib/tent-schemas', __FILE__)
require 'fileutils'
require 'json'
require 'yaml'

Rake::TestTask.new do |t|
  t.pattern = 'test/**/*_test.rb'
end

task :default => :test

desc "Generate schema json"
task :generate do
  FileUtils.mkdir_p('output')
  TentSchemas.each do |name,schema|
    File.open("output/#{name}.json", 'w') { |f| f.write(JSON.pretty_generate(schema)) }
  end
end
