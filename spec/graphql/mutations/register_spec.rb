# frozen_string_literal: true

RSpec.describe Mutations::Register, type: :graphql do
  include_context 'with GraphQL Result'

  subject(:result) do
    GraphQL::Query.new(WritersGroupSchema, mutation, variables: variables).result
  end

  let(:name) { Faker::Name.name }
  let(:email) { Faker::Internet.email }
  let(:password) { 'password1' }
  let(:password_confirmation) { password }

  let(:variables) do
    {
      'name' => name,
      'email' => email,
      'password' => password,
      'passwordConfirmation' => password_confirmation
    }
  end

  let(:mutation) do
    <<~GQL
      mutation register($name: String!, $email: String!, $password: String!, $passwordConfirmation: String!) {
        register(input: { name: $name, email: $email, password: $password, passwordConfirmation: $passwordConfirmation }) {
          user {
            id
            name
            email
            authenticationToken
          }
          success
          errors
        }
      }
    GQL
  end

  let(:result_user) { result_object['user'] || {} }

  context 'with valid args' do
    let(:created) { User.find_by!(email: email) }

    it 'is successful' do
      expect(result_success).to be true
      expect(result_errors).to be_blank

      expect(result_user['name']).to eq(name)
      expect(result_user['email']).to eq(email)

      expect(result_user['id']).to eq(created.uuid)
      expect(result_user['authenticationToken']).to eq(created.authentication_token)
    end
  end

  context 'with a validation error' do
    let(:password_confirmation) { 'something-that-does-not-match' }

    it 'is not successful' do
      expect(result_errors).to be_present
      expect(result_errors.first['message']).to eq("Password confirmation doesn't match Password")
      expect(User.find_by(email: email)).to be_blank
    end
  end
end
