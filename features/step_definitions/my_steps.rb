Given(/^Entro en el juego$/) do
	visit "/"
end

Then(/^Es el turno del "(.*?)"$/) do |jugador|
  	last_response.body.should =~ /#{jugador}/m
end

