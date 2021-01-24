RSpec.describe LongNumbers::Application do
  describe '#initialize' do
    let(:app) { described_class.new(text, limit) }
    context 'when args is valid ' do
      let(:text) { File.open('spec/fixtures/test_data.txt') }
      let(:limit) { 10 }

      it do
        expect(app.io_text).to eq text
        expect(app.limit).to eq limit
      end
    end

    context 'when limit is invalid' do
      let(:text) { File.open('spec/fixtures/test_data.txt') }
      let(:limit) { 0 }

      it { expect { app }.to raise_error(LongNumbers::IntegerValueError) }
    end

    context 'when io is invalid' do
      let(:text) { 'someone text' }
      let(:limit) { 10 }

      it { expect { app }.to raise_error(LongNumbers::IOValueError) }
    end
  end

  describe '#call' do
    let(:app) { described_class.new(text, limit) }
    let(:limit) { 4 }
    after { app.call }

    context 'when file is empty' do
      let(:text) { File.open('spec/fixtures/empty_file.txt') }

      it { expect(app).to receive(:puts).with([]) }
    end

    context 'when file has not numbers' do
      let(:text) { File.open('spec/fixtures/without_number.txt') }

      it { expect(app).to receive(:puts).with([]) }
    end

    context 'when file inclide numbers' do
      let(:text) { File.open('spec/fixtures/test_data.txt') }

      it { expect(app).to receive(:puts).with(%w(423432432 3323231 3323 2323)) }
    end
  end
end
