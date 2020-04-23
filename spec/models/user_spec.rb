# frozen_string_literal: true

RSpec.describe User, type: :model do
  subject(:user) { build(:user) }

  it { is_expected.to validate_presence_of :name }

  it 'generates a token' do
    expect(user.authentication_token).to be_blank
    user.save!
    expect(user.authentication_token).to be_present
  end

  it 'generates a uuid' do
    expect(user.uuid).to be_blank
    user.save!
    expect(user.uuid).to be_present
  end
end
