require 'sinatra'
require 'json'

get '/courses' do
  content_type :json
  { completed: 5, total: 10 }.to_json
end
