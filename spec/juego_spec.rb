require_relative('../lib/juego.rb')
require_relative('../lib/dado-mock.rb')


describe "Juego" do
	
	it "jugador 1 tira dado 1 y jugador 2 tira dado 6, jugador 1 pierde" do
		juego = Juego.new DadoMock.new([1, 6]), 1
		juego.atacar.should == false
	end

	it "jugador 1 tira dado 6 y jugador 2 tira dado 1, jugador 2 pierde" do
		juego = Juego.new DadoMock.new([6, 1]), 1
		juego.atacar.should == true
	end

	it "jugador 1 tira dado 6 y jugador 2 tira dado 6, jugador 1 pierde" do
		juego = Juego.new DadoMock.new([6, 6]), 1
		juego.atacar.should == false
	end

	it "jugador 1 tira dado 4 y jugador 2 tira dado 3 los ultimos dados son 4 y 3" do
		juego = Juego.new DadoMock.new([4, 3]), 1
		juego.atacar
        juego.ultimos_dados.should == [4, 3]
	end
    
    it "jugador 1 ataco siguiente turno es de jugador 2" do
		juego = Juego.new Dado.new(), 1
		juego.atacar
        juego.turno.should == 2
	end
    
    it "Se empieza el juego con 2 paises por jugador, jugador 1 tiene 2 paises y jugador 2 tiene 2 paises" do
		juego = Juego.new Dado.new(), 2
        juego.paises_jugador1.should == 2
        juego.paises_jugador2.should == 2
	end

	it "Comienza el juego con 2 paises por jugador, gana el jugador 1" do
		dado = DadoMock.new([4, 1])
		juego = Juego.new dado, 2
		juego.atacar
		juego.atacar
		juego.gano?.should == true
	end	

	it "Comienza el juego con 2 paises por jugador, el jugador 1 ataca 2 veces seguidas y pasa turno al jugador 2" do
		dado = Dado.new()
		juego = Juego.new dado, 2
		juego.atacar
		juego.atacar
		juego.turno.should == 2
	end	

end
