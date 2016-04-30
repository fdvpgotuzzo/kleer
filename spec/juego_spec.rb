require_relative('../lib/juego.rb')
require_relative('../lib/dado-mock.rb')


describe "Juego" do
	
	it "jugador 1 tira dado 1 y jugador 2 tira dado 6, jugador 1 pierde" do
		juego = Juego.new DadoMock.new([1, 6]), 1
		juego.atacar(2).should == false
	end

	it "jugador 1 tira dado 6 y jugador 2 tira dado 1, jugador 2 pierde" do
		juego = Juego.new DadoMock.new([6, 1]), 1
		juego.atacar(2).should == true
	end

	it "jugador 1 tira dado 6 y jugador 2 tira dado 6, jugador 1 pierde" do
		juego = Juego.new DadoMock.new([6, 6]), 1
		juego.atacar(2).should == false
	end

	it "jugador 1 tira dado 4 y jugador 2 tira dado 3 los ultimos dados son 4 y 3" do
		juego = Juego.new DadoMock.new([4, 3]), 1
		juego.atacar(2)
        juego.ultimos_dados.should == [4, 3]
	end
    
    it "jugador 1 ataco siguiente turno es de jugador 2" do
		juego = Juego.new Dado.new(), 1
		juego.atacar(2)
        juego.turno.should == 2
	end
    
    it "Se empieza el juego con 2 paises por jugador, jugador 1 tiene 2 paises y jugador 2 tiene 2 paises" do
		juego = Juego.new Dado.new(), 2
        juego.cant_paises_jugador_1.should == 2
        juego.cant_paises_jugador_2.should == 2
	end

	it "Comienza el juego con 2 paises por jugador, gana el jugador 1" do
		dado = DadoMock.new([4, 1])
		juego = Juego.new dado, 2
		juego.atacar(3)
		juego.atacar(4)
		juego.gano?.should == true
	end	

	it "Comienza el juego con 2 paises por jugador, el jugador 1 ataca 2 veces seguidas y pasa turno al jugador 2" do
		dado = Dado.new()
		juego = Juego.new dado, 2
		juego.atacar(3)
		juego.atacar(4)
		juego.turno.should == 2
	end	

	it "Comienza el juego con 2 paises por jugador, al jugardor 1 le quedan 2 ataques" do
		juego = Juego.new Dado.new(), 2
		juego.ataques_de_turno.should == 2
	end	

	it "Comienza el juego con 2 paises por jugador, el jugador 1 ataca, al jugardor 1 le queda 1 ataque" do
		juego = Juego.new Dado.new(), 2
		juego.atacar(3)
		juego.ataques_de_turno.should == 1
	end	

	it "Comienza el juego, el jugador 1 tiene pais 1, el jugardor 2 tiene pais 2" do
		juego = Juego.new Dado.new(), 1
		paises = juego.paises_jugador_1
		paises[0].nombre.should == 1
		paises2 = juego.paises_jugador_2
		paises2[0].nombre.should == 2
	end	

	it "Comienza el juego con 2 paises, el jugador 1 tiene el pais 1 y 2, el jugardor 2 tiene el pais 3 y 4" do
		juego = Juego.new Dado.new(), 2
		paises = juego.paises_jugador_1
		paises[0].nombre.should == 1
		paises[1].nombre.should == 2
		paises2 = juego.paises_jugador_2
		paises2[0].nombre.should == 3
		paises2[1].nombre.should == 4
	end	

	it "Comienza el juego, cada pais tiene una ficha" do
		juego = Juego.new Dado.new(), 2
		paises = juego.paises_jugador_1
		paises[0].fichas.should == 1
	end	

	it "Comienza el juego, cada pais tiene una ficha" do
		juego = Juego.new Dado.new(), 2
		paises = juego.paises_jugador_1
		paises[0].fichas.should == 1
	end	

	it "Comienza el juego con 2 paises por jugador, jugador 1 ataca a pais 3 y conquista, ahora tiene el pais 3" do
		dado = DadoMock.new([4, 1])
		juego = Juego.new dado, 2
		juego.atacar 3
		paises = juego.paises_jugador_1
		paises2 = juego.paises_jugador_2
		paises.any?{|p| p.nombre == 3}.should == true
		paises2.any?{|p| p.nombre == 3}.should == false
	end	

end
