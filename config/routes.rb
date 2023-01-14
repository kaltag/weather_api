Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/weather/current', to: 'weathers#current'
  get '/weather/historical', to: 'weathers#historical'
  get '/weather/historical/max', to: 'weathers#max'
  get '/weather/historical/min', to: 'weathers#min'
  get '/weather/historical/avg', to: 'weathers#avg'

  get '/health', to: 'weathers#health'


end
