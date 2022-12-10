require 'rails_helper'

RSpec.describe Group, type: :model do
  describe 'Food model' do
    user = User.create(name: 'User1', email: 'user1@example.com', password: 'password')
    subject { Group.new(author_id: user.id, icon: 'icon', name: 'travel') }
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

    it 'check the icon is not blank' do
      subject.name = nil
      expect(subject).to_not be_valid
    end
  end
end
