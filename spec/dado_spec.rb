require_relative('../lib/dado.rb')


describe "Dado" do
	it "tirar el dado da un numero mayor a 0" do
		dado = Dado.new
		dado.tirar.should > 0
	end

	it "tirar el dado da un numero menor a 7" do
		dado = Dado.new
		dado.tirar.should < 7 
	end
end
