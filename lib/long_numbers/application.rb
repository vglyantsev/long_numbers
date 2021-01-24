module LongNumbers
  class Application
    DIGIT_CHARS = ('0'..'9').freeze

    attr_reader :io_text, :limit

    def initialize(io_text, limit)
      LongNumbers::Validations.io(io_text)
      LongNumbers::Validations.integer(limit)

      @io_text = io_text
      @limit = limit.to_i
    end

    def call
      store = Storage.new
      number_buffer = ''
      io_text.each_char do |char|
        unless DIGIT_CHARS.cover?(char)
          store << number_buffer unless number_buffer.empty?
          number_buffer = ''
          next
        end
        number_buffer << char
      end

      puts store.sort.first(limit)
    end
  end
end
