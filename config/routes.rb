Rails.application.routes.draw do
  root to: 'home#show'

  get 'coverage', to: 'high_voltage/pages#show', id: 'coverage'
  get 'contract', to: 'high_voltage/pages#show', id: 'contract'
  get 'about', to: 'high_voltage/pages#show', id: 'about'
  get 'press-kit', to: 'high_voltage/pages#show', id: 'press_kit'

  get 'contact', to: 'tickets#new'
  post 'contact', to: 'tickets#create'

  resources :inquiries, only: [:new, :create]

  resources :call_rates, only: [:index], path: 'call-rates', defaults: { format: 'json' }

  get 'privacy', to: 'privacy_policy#show', as: 'privacy_policy'

  resources :faq_categories, path: 'faqs', only: [:index, :show]
  resources :plan_categories, path: 'pricing', only: [:index, :show]
  resources :projects, only: :index
end
