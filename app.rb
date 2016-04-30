require 'sinatra'
require_relative './lib/juego.rb'
require_relative './lib/dado.rb'
require_relative './lib/dado-mock.rb'

get '/' do
	if params[:mock] == "true"
        paises = params[:paises].to_i
        tirada_string = params[:tirada]
		tirada_i =[]
 		tirada_string.each do |val|
			tirada_i.push val.to_i
		end
		@@juego = Juego.new DadoMock.new(tirada_i), paises
	else
		@@juego = Juego.new Dado.new, 4
	end
	erb :juego
end

post '/atacar' do
    @@juego.atacar params[:pais].to_i
	if @@juego.gano?
		erb :ganador
	else 
		erb :juego
	end
end
