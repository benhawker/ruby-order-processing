class Customer

  VALID_TYPES = [:web, :company]

  attr_reader :name, :type

  def initialize(name, type)
    @name = name.to_s
    @type = type.to_sym

    validate!
  end

  private

  def validate!
    raise "This is not a valid type of customer" unless VALID_TYPES.include? self.type
  end

end