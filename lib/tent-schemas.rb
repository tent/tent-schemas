require 'yaml'

module TentSchemas
  extend self

  def schema_files
    Dir.glob(File.expand_path('../../schemas/**/*.yaml', __FILE__))
  end

  def schemas
    @schemas ||= schema_files.inject(Hash.new { |h,k| h[k.to_s] }) { |hash,schema|
      schema_name = File.basename(schema, '.yaml')
      schema_directory = File.basename(File.dirname(schema))
      schema_name = [schema_directory, schema_name].join('_') if schema_directory != 'schemas'
      hash.merge( schema_name => YAML.load(File.read(schema)))
    }
  end

  def each(&block)
    schemas.each(&block)
  end

  def [](k)
    schemas[k]
  end

  def schema
    { 'schemas' => schemas }
  end
end
