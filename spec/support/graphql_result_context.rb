# frozen_string_literal: true

RSpec.shared_context 'with GraphQL Result' do
  let(:query_name) { described_class.graphql_name.camelcase(:lower) }
  let(:result_errors) { result['errors'] }
  let(:result_error) { result_errors&.first || {} }
  let(:result_error_message) { result_error['message'] }
  let(:result_data) { result['data'] || {} }
  let(:result_object) { result_data[query_name] || {} }
  let(:result_success) { result_object['success'] }
end
