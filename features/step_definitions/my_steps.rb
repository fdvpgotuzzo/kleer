Given(/^Entro en el juego$/) do
	visit "/"
end

Given(/^Entro en el juego con el dado para tirar (\d+) y (\d+)$/) do |valor1, valor2|
	visit "/?mock=true&tirada1=#{valor1}&tirada2=#{valor2}"
end

Then(/^Es el turno del "(.*?)"$/) do |jugador|
  	last_response.body.should =~ /#{jugador}/m
end

When(/^ataca$/) do
     click_button("Atacar")
end

Then(/^el resultado del ataque es (\d+) y (\d+)$/) do |valor1, valor2|
  	last_response.body.should =~ /#{valor1}/m
  	last_response.body.should =~ /#{valor2}/m
end

Then(/^gana$/) do
	last_response.body.should =~ /Ganaste/m
end


