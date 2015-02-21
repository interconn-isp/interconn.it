Rails.application.routes.draw do
  root to: 'home#show'

  get 'coverage', to: 'high_voltage/pages#show', id: 'coverage'
  get 'contract', to: 'high_voltage/pages#show', id: 'contract'
  get 'about', to: 'high_voltage/pages#show', id: 'about'
  get 'press-kit', to: 'high_voltage/pages#show', id: 'press_kit'
  get 'projects', to: 'high_voltage/pages#show', id: 'projects'

  get 'contact', to: 'tickets#new'
  post 'contact', to: 'tickets#create'

  get 'plans', to: 'high_voltage/pages#show', id: 'plans/wadsl'
  get 'plans/wadsl', to: 'high_voltage/pages#show', id: 'plans/wadsl'
  get 'plans/whdsl', to: 'high_voltage/pages#show', id: 'plans/whdsl'
  get 'plans/voip', to: 'high_voltage/pages#show', id: 'plans/voip'

  get 'suspended', to: 'high_voltage/pages#show', id: 'suspended'

  resources :inquiries, only: [:new, :create]

  resources :call_rates, only: [:index], path: 'call-rates', defaults: { format: 'json' }

  get 'privacy', to: 'privacy_policy#show', as: 'privacy_policy'

  resources :faq_categories, path: 'faqs', only: [:index, :show]
end
