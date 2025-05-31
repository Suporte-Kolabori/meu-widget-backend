require 'sinatra'
require 'rackup'
require 'puma'
require 'json'

# Configurações principais
configure do
  set :server, :puma
  set :port, ENV.fetch('PORT', 9292)  # Usa .fetch para segurança
  set :bind, '0.0.0.0'
  set :environment, ENV.fetch('RACK_ENV', 'production').to_sym
end

# Rotas
get '/courses' do
  content_type :json
  { completed: 5, total: 10 }.to_json
end

get '/health' do
  status 200
  { status: 'online' }.to_json
end

# Log de inicialização (opcional mas útil)
before do
  puts "[#{Time.now}] Acessando: #{request.path}"
end

# Mensagem ao iniciar (aparece após o servidor estar pronto)
Sinatra::Application.run! do |server|
  puts "✅ Servidor rodando em http://#{settings.bind}:#{settings.port}"
end