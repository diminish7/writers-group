# frozen_string_literal: true

Rails.application.routes.draw do
  mount GraphiQL::Rails::Engine, at: '/graphiql', graphql_path: '/graphql' if Rails.env.development?
  post '/graphql', to: 'graphql#execute'

  devise_for :users, skip: :sessions

  root to: 'home#show'

  # Catch all for HTML 5 history routing
  get '/*path', to: 'home#show'
end
