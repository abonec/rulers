class Object
  def self.const_missing(const_name)
    # prevent stacklevel too deep when in required
    # file not exists needed file
    return nil if @calling_const_missing
    @calling_const_missing = true
    filename = Rulers.to_underscore const_name
    require filename
    klass = Object.const_get const_name
    @calling_const_missing = false

    klass
  end
end
