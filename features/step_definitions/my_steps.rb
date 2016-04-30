Given(/^Entro en el juego$/) do
	visit "/"
end

Given(/^Entro en el juego con el dado para tirar (\d+) y (\d+)$/) do |valor1, valor2|
	visit "/?mock=true&tirada[]=#{valor1}&tirada[]=#{valor2}&paises=1"
end

When(/^ataca al pais (\d+)$/) do |pais|
  	fill_in("pais", :with => pais)
     click_button("Atacar")
end

Then(/^Es el turno del "(.*?)"$/) do |jugador|
  	last_response.body.should =~ /#{jugador}/m
end

When(/^ataca$/) do
  	fill_in("pais", :with => 2)
     click_button("Atacar")
end

Then(/^el resultado del ataque es (\d+) y (\d+)$/) do |valor1, valor2|
  	last_response.body.should =~ /#{valor1}/m
  	last_response.body.should =~ /#{valor2}/m
end

Then(/^gana$/) do
	last_response.body.should =~ /Ganaste/m
end

Given(/^Entro en el juego con (\d+) paises por jugador$/) do |cant_paises|
	visit "/?mock=true&tirada[]=1&tirada[]=3&paises=#{cant_paises}"
end

Then(/^Veo (\d+) ataques restantes$/) do |ataques|  
	last_response.body.should =~ /Ataques restantes: #{ataques}/m
end

When(/^Ataco (\d+) veces$/) do |veces|
  	fill_in("pais", :with => 4)
		click_button("Atacar")
  	fill_in("pais", :with => 5)
		click_button("Atacar")
  	fill_in("pais", :with => 6)
		click_button("Atacar")
end

Then(/^Veo turno de jugador (\d+)$/) do |jugador|
	last_response.body.should =~ /Turno: Jugador #{jugador}/m
end

Then(/^Veo jugador (\d+) tiene los paises (\d+) ,(\d+) ,(\d+)$/) do |jugador, pais1, pais2, pais3|
  last_response.body.should =~ /Jugador #{jugador}: #{pais1}, #{pais2}, #{pais3}/m
end



