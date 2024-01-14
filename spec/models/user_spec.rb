require 'rails_helper'

describe User do
  describe '#user_email', type: :model do
    fixtures :users

    it 'returns the email of the user' do
      user = users(:john)
      expect(user.email).to eq 'john@example.com'
    end
  end
end
