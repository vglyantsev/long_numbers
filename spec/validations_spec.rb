RSpec.describe LongNumbers::Validations do
  describe '#integer' do
    context 'when not call exception' do
      it 'where value is integer' do
        expect(described_class.integer(10)). to be_nil
      end

      it 'where value converted to integer' do
        expect(described_class.integer('10')). to be_nil
      end
    end

    context 'when invalid' do
      it 'where value is zero' do
        expect { described_class.integer(0) }.to raise_error(LongNumbers::IntegerValueError)
      end

      it 'where value is negative' do
        expect { described_class.integer(-10) }.to raise_error(LongNumbers::IntegerValueError)
      end

      it 'where value is not converted to integer' do
        expect { described_class.integer('foo') }.to raise_error(LongNumbers::IntegerValueError)
      end
    end
  end

  describe '#io' do
    context 'when not call exception' do
      let(:text) { File.open('spec/fixtures/test_data.txt') }

      it 'where value is integer' do
        expect(described_class.io(text)). to be_nil
      end
    end

    context 'when invalid' do
      it 'where value text' do
        expect { described_class.io('text') }.to raise_error(LongNumbers::IOValueError)
      end
    end
  end
end
