require 'spec_helper'
require 'helpers/file'

class FakeController < Rulers::Controller
  def action_with_renderer
    render :fake_view, variable_name: :variable
  end
end
describe Rulers::Controller do
  it 'should render from file' do
    view = 'template with <%= variable_name %>'
    in_fake_dir do
      with_file view, 'app/views/fake/fake_view.html.erb' do
        FakeController.new({}).action_with_renderer.should ==
          'template with variable'
      end
    end
  end
  
end
