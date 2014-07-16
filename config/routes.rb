Rails.application.routes.draw do
  root to: 'high_voltage/pages#show', id: 'home'

  get 'pricing', to: 'high_voltage/pages#show', id: 'pricing/wadsl'
  get 'pricing/wadsl', to: 'high_voltage/pages#show', id: 'pricing/wadsl'
  get 'pricing/whdsl', to: 'high_voltage/pages#show', id: 'pricing/whdsl'
  get 'pricing/voip', to: 'high_voltage/pages#show', id: 'pricing/voip'

  get 'coverage', to: 'high_voltage/pages#show', id: 'coverage'
  get 'contact', to: 'high_voltage/pages#show', id: 'contact'
end
