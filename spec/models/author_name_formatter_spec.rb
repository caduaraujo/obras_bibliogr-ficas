require 'rails_helper'

RSpec.describe AuthorNameFormatter, type: :model do
  describe '#formatted_name' do
    context 'when has only first name and last name' do
      let(:full_name) { 'João Silva' }

      it { expect(described_class.formatted_name(full_name)).to eq('SILVA, João') }
    end

    context 'when has an article between first name and last name' do
      let(:full_name) { 'João da Silva' }

      xit { expect(described_class.formatted_name(full_name)).to eq('SILVA, João da') }
    end

    context 'when has upcase and dowcase' do
      let(:full_name) { 'JoãO DA SilVa' }

      xit { expect(described_class.formatted_name(full_name)).to eq('SILVA, João da') }
    end

    context 'when the last name is a nickname and has other last name' do
      let(:full_name) { 'João Silva Neto' }

      xit { expect(described_class.formatted_name(full_name)).to eq('SILVA NETO, João') }
    end

    context 'when the last name is only a nickname' do
      let(:full_name) { 'João Neto' }

      xit { expect(described_class.formatted_name(full_name)).to eq('NETO, João') }
    end
  end
end
