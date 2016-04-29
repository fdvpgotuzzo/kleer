require_relative('../lib/juego.rb')
require_relative('../lib/dado-mock.rb')


describe "Juego" do
	
	it "jugador 1 tira dado 1 y jugador 2 tira dado 6, jugador 1 pierde" do
		juego = Juego.new (DadoMock.new(1, 6)) 
		juego.atacar
	end

	it "jugador 1 tira dado 6 y jugador 2 tira dado 1, jugador 2 pierde" do
		juego = Juego.new (DadoMock.new(6, 1)) 
		juego.atacar
	end

	it "jugador 1 tira dado 6 y jugador 2 tira dado 6, jugador 1 pierde" do
		juego = Juego.new (DadoMock.new(6, 6)) 
		juego.atacar
	end
end
