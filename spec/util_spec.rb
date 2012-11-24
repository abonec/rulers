require 'rulers'

describe 'rulers/util' do
  describe 'should recognize' do
    it 'modules' do
      Rulers.to_underscore("Module::Submodule::Class").
        should == 'module/submodule/class'
    end
    it 'CamelCase' do
      Rulers.to_underscore("CamelCase").
        should == 'camel_case'
    end
    it 'abbreviation' do
      Rulers.to_underscore('APBaronec').
        should == 'ap_baronec'
    end
  end
end
