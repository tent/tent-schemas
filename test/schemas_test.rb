require 'bundler/setup'
require 'test/unit'
require 'json-schema'
require 'yaml'
require 'json'

class SchemaTest < Test::Unit::TestCase
  Dir.glob(File.expand_path('../../schemas/*', __FILE__)).each do |schema|
    define_method "test_#{File.basename(schema, '.yaml')}" do
      validate_schema(schema)
    end
  end

  def validate_schema(schema_file)
    errors = JSON::Validator.fully_validate_schema(YAML.load(File.read(schema_file)))
    assert errors.empty?, errors.inspect
  end
end
