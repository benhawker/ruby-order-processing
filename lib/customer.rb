class Customer

  VALID_TYPES = [:web, :company]

  attr_reader :type

  def initialize(type)
    @type = type

    validate!
  end

  private

  def validate!
    raise "This is not a valid type of customer" unless VALID_TYPES.include? self.type
  end

end