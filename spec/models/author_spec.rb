require 'rails_helper'

RSpec.describe Author, type: :model do
  subject { Author.new(full_name: 'Joao da Silva') }

  describe 'specifications' do
    it { should have_db_column(:full_name).of_type(:string) }
  end

  describe 'validations' do
    it { should validate_presence_of(:full_name).on(:create) }
  end
end
