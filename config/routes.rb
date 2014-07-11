Rails.application.routes.draw do
  root to: 'high_voltage/pages#show', id: 'home'
  get 'pricing', to: 'high_voltage/pages#show', id: 'pricing'
end
