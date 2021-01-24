RSpec.describe LongNumbers::Storage do
  describe '#sort' do
    context 'when array is empty' do
      it { expect(described_class.new.sort).to be_empty }
    end

    context 'when array is not empty' do
      it { expect(described_class.new(%w(10 200 15)).sort).to eq %w(200 15 10) }
    end
  end
end
