# frozen_string_literal: true

RSpec.describe Mutations::SignIn do
  include_context 'with GraphQL Result'

  subject(:result) do
    GraphQL::Query.new(WritersGroupSchema, mutation, variables: variables).result
  end

  let(:user_email) { Faker::Internet.email }
  let(:user_password) { 'password1' }

  let(:variables) { { 'email' => email, 'password' => password } }
  let(:mutation) do
    <<~GQL
      mutation signIn($email: String!, $password: String!) {
        signIn(input: { email: $email, password: $password }) {
          user {
            id
            name
            authenticationToken
          }
          success
          errors
        }
      }
    GQL
  end

  let!(:user) { create(:user, email: user_email, password: user_password) }

  let(:result_user) { result_object['user'] || {} }

  context 'with valid credentials' do
    let(:email) { user_email }
    let(:password) { user_password }

    it 'is successful' do
      expect(result_success).to be true
      expect(result_errors).to be_blank

      expect(result_user['id']).to eq(user.uuid)
      expect(result_user['name']).to eq(user.name)
      expect(result_user['authenticationToken']).to eq(user.authentication_token)
    end
  end

  shared_examples_for 'invalid credentials' do
    it 'is not successful' do
      expect(result_error_message).to eq('Email or password is invalid')
    end
  end

  context 'with a bad email' do
    let(:email) { 'invalid.user@example.com' }
    let(:password) { user_password }

    it_behaves_like 'invalid credentials'
  end

  context 'with a bad password' do
    let(:email) { user_email }
    let(:password) { 'invalid-password' }

    it_behaves_like 'invalid credentials'
  end
end
