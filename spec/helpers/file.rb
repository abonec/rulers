require 'fileutils'
module Helpers
  def create_constant_file(name, dir)
    files = get_modules Rulers.to_underscore(name), dir
    files.each do |name, filename|
      File.open(filename, 'w') do |file|
        file.write "module #{name}; end"
      end
    end
    yield
    files.each{|name, file| File.delete file}
  end
  def get_modules(path, dir)
    result = {}
    modules = path.split('/')
    0.upto(modules.size - 1) do |i|
      path = modules[0..i].join('/')
      result[Rulers.camelize(path)] = "#{dir}/#{path}.rb"
    end
    result
  end

end
