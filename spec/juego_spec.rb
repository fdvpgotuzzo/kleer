require_relative('../lib/juego.rb')


describe "Juego" do
	
	it "atacante tira dado 1 y defensor tira dado 6, atacante pierde" do
		juego = Juego.new
		juego.atacar(1,6).should == "defensor"
	end

end
