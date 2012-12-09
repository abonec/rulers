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
    begin
      files.each{|name, file| FileUtils.rm_rf file}
    rescue
    end
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

  def in_fake_dir
    fake_dir = 'spec/fake_dir'
    old_dir = Dir.pwd
    FileUtils.mkdir_p fake_dir
    Dir.chdir fake_dir
    yield
  ensure
    Dir.chdir old_dir
    FileUtils.rm_rf fake_dir
  end

  def with_file text, path
    FileUtils.mkdir_p File.dirname path
    File.open(path, 'w'){|f|f.write text}
    yield
  ensure
    File.delete path
  end
end
