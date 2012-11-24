class Object
  def self.const_missing(c)
    # prevent stacklevel too deep when in required
    # file not exists needed file
    return nil if @calling_const_missing
    @calling_const_missing = true
    filename = Rulers.to_underscore c
    require filename
    klass = Object.const_get c
    @calling_const_missing = false

    klass
  end
end
