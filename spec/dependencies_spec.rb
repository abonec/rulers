require 'helpers/file'
require 'spec_helper'

$LOAD_PATH.unshift File.dirname __FILE__
describe 'rulers/dependencies' do
  before :all do
    @dir = File.dirname __FILE__
  end
  describe 'should load missing constant' do
    it 'without module' do
      create_constant_file 'FakeConstant', @dir do
        FakeConstant.should_not be_nil
      end
    end
    # it "with modules" do
    #   create_constant_file "FakeModule::FakeOtherConstant", @dir do
    #     FakeModule::FakeOtherConstant.should_not be_nil
    #   end
    # end
  end
end
