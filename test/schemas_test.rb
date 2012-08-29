require 'bundler/setup'
require File.expand_path('../../lib/tent-schemas', __FILE__)
require 'test/unit'
require 'json-schema'
require 'yaml'
require 'json'

class SchemasTest < Test::Unit::TestCase
  TentSchemas.each do |name,schema|
    define_method "test_#{name}" do
      validate_schema(schema)
    end
  end

  def validate_schema(schema)
    errors = JSON::Validator.fully_validate_schema(schema)
    assert errors.empty?, errors.inspect
  end
end
