# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  role                   :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
require 'rails_helper'

RSpec.describe User, type: :model do
  context 'is valid with valid attributes' do
    it 'creates a user with valid attributes' do
      user = FactoryBot.build(:user)
      expect(user).to be_valid
    end
  end
  context 'is invalid with invalid attributes' do
    it 'is invalid without an email' do
      user = FactoryBot.build(:user, email: nil)
      expect(user).to_not be_valid
    end

    it 'is invalid without a password' do
      user = FactoryBot.build(:user, password: nil)
      expect(user).to_not be_valid
    end

    it 'is invalid with a short password' do
      user = FactoryBot.build(:user, password: 'sho')
      expect(user).to_not be_valid
    end

    it 'is invalid with a duplicate email' do
      user = FactoryBot.create(:user, email: 'email@email.com')
      duplicate_user = FactoryBot.build(:user, email: user.email)
      expect(duplicate_user).to_not be_valid
    end
  end
end
