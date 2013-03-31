require 'yaml'

module TentSchemas
  extend self

  def schema_files
    Dir.glob(File.expand_path('../../schemas/**/*.yaml', __FILE__))
  end

  def schemas
    @schemas ||= schema_files.inject(Hash.new { |h,k| h.has_key?(k.to_s) ? h[k.to_s] : nil }) { |hash,schema|
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

  def inject_refs!(hash)
    hash.each_pair do |key, val|
      if Hash === val
        if val["$ref"]
          hash[key] = schemas[val["$ref"].sub(/\A#\/schemas\//, '')]
        else
          inject_refs!(val)
        end
      end
    end
  end
end
