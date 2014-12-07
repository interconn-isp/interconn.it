Rails.application.routes.draw do
  root to: 'home#show'

  get 'coverage', to: 'high_voltage/pages#show', id: 'coverage'
  get 'contract', to: 'high_voltage/pages#show', id: 'contract'
  get 'careers', to: 'high_voltage/pages#show', id: 'careers'
  get 'about', to: 'high_voltage/pages#show', id: 'about'
  get 'press-kit', to: 'high_voltage/pages#show', id: 'press_kit'
  get 'projects', to: 'high_voltage/pages#show', id: 'projects'
  get 'privacy', to: 'high_voltage/pages#show', id: 'privacy/privacy'

  get 'contact', to: 'tickets#new'
  post 'contact', to: 'tickets#create'

  get 'pricing', to: 'high_voltage/pages#show', id: 'pricing/wadsl'
  get 'pricing/wadsl', to: 'high_voltage/pages#show', id: 'pricing/wadsl'
  get 'pricing/whdsl', to: 'high_voltage/pages#show', id: 'pricing/whdsl'
  get 'pricing/voip', to: 'high_voltage/pages#show', id: 'pricing/voip'

  get 'faq', to: 'high_voltage/pages#show', id: 'faq/terms'
  get 'faq/terms', to: 'high_voltage/pages#show', id: 'faq/terms'
  get 'faq/tech', to: 'high_voltage/pages#show', id: 'faq/tech'
  get 'faq/voip', to: 'high_voltage/pages#show', id: 'faq/voip'
  get 'faq/condos', to: 'high_voltage/pages#show', id: 'faq/condos'

  resources :inquiries, only: [:new, :create]

  resources :call_rates, only: [:index], path: 'call-rates', defaults: { format: 'json' }
end
