# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'home#show'

  # Catch all for HTML 5 history routing
  get '/*path', to: 'home#show'
end
