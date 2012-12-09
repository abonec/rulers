require 'erubis'
module Rulers
  class Controller
    attr_reader :env
    def initialize(env)
      @env = env
    end


    private
    def render(view_name, locals={})
      filename = "app/views/#{controller_name}/#{view_name}.html.erb"
      template = File.read filename
      eruby = Erubis::Eruby.new template
      eruby.result locals.merge env: @env
    end

    def controller_name
      name = self.class.to_s.gsub /Controller\z/, ''
      Rulers.to_underscore name
    end

  end
end
