require 'yaml'

module TentSchemas
  extend self

  def schema_files
    Dir.glob(File.expand_path('../../schemas/*', __FILE__))
  end

  def schemas
    @schemas ||= schema_files.inject(Hash.new { |h,k| h[k.to_s] }) { |hash,schema|
      hash.merge(File.basename(schema, '.yaml') => YAML.load(File.read(schema)))
    }
  end

  def each(&block)
    schemas.each(&block)
  end

  def [](k)
    schemas[k]
  end
end
