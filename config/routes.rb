Rails.application.routes.draw do
  root to: 'high_voltage/pages#show', id: 'home'

  get 'pricing', to: 'high_voltage/pages#show', id: 'pricing/wadsl'
  get 'pricing/wadsl', to: 'high_voltage/pages#show', id: 'pricing/wadsl'
  get 'pricing/whdsl', to: 'high_voltage/pages#show', id: 'pricing/whdsl'
  get 'pricing/voip', to: 'high_voltage/pages#show', id: 'pricing/voip'

  get 'coverage', to: 'high_voltage/pages#show', id: 'coverage'

  get 'contact', to: 'contacts#new'
  post 'contact', to: 'contacts#create'

  get 'faq', to: 'high_voltage/pages#show', id: 'faq/terms'
  get 'faq/terms', to: 'high_voltage/pages#show', id: 'faq/terms'
  get 'faq/tech', to: 'high_voltage/pages#show', id: 'faq/tech'
  get 'faq/voip', to: 'high_voltage/pages#show', id: 'faq/voip'
  get 'faq/condos', to: 'high_voltage/pages#show', id: 'faq/condos'
end
