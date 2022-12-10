require 'rails_helper'

RSpec.describe Entity, type: :model do
  describe 'Food model' do
    user = User.create(name: 'User1', email: 'user1@example.com', password: 'password')
    subject { Entity.new(author_id: user.id, amount: 2, name: 'travel') }
    before { subject.save }

    it 'check the name is not blank' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'fails if the name is exceeding 50 characters' do
      subject.name = 'hello world hello world hello world hello world hello world hello world hello world hello world
      hello world hello world hello world hello world hello world hello world hello world hello world
      hello world hello world hello world hello world hello world hello world hello world hello world'
      expect(subject).to_not be_valid
    end

    it 'check if amount is numeric' do
      subject.amount = 'not-numeric'
      expect(subject).to_not be_valid
    end

    it 'check if amount is equal or greater than one' do
      expect(subject.amount).to be >= 1
    end
  end
end
