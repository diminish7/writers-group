# frozen_string_literal: true

RSpec.describe Mutations::SignOut, type: :graphql do
  include_context 'with GraphQL Result'

  subject(:result) do
    GraphQL::Query.new(WritersGroupSchema, mutation, context: { current_user: user }).result
  end

  let(:mutation) do
    <<~GQL
      mutation signOut {
        signOut(input: {}) {
          success
          errors
        }
      }
    GQL
  end

  let!(:user) { create(:user) }
  let!(:initial_token) { user.authentication_token }

  it 'resets the token' do
    expect(result_success).to be true
    expect(result_errors).to be_blank
    expect(initial_token).to be_present
    expect(user.reload.authentication_token).not_to eq(initial_token)
  end
end
