module LongNumbers
  class Validations
    def self.integer(value)
      raise IntegerValueError unless value.to_i.positive?
    end

    def self.io(value)
      raise IOValueError unless value.is_a?(IO)
    end
  end

  class IntegerValueError < StandardError
    def initialize(msg = 'Invalin limit value')
      super
    end
  end

  class IOValueError < StandardError
    def initialize(msg = 'Invalid IO data')
      super
    end
  end
end
