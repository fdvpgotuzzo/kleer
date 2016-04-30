require 'sinatra'
require_relative './lib/juego.rb'
require_relative './lib/dado.rb'
require_relative './lib/dado-mock.rb'

get '/' do
	if params[:mock] == "true"
		@@juego = Juego.new DadoMock.new([params[:tirada1].to_i,params[:tirada2].to_i]), 1
	else
		@@juego = Juego.new Dado.new, 4
	end
	erb :juego
end

post '/atacar' do
    @@juego.atacar
	if @@juego.gano?
		erb :ganador
	else 
		erb :juego
	end
end
