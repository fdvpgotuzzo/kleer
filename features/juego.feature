Feature: Juego

Scenario: Juego nuevo
	Given Entro en el juego
	Then Es el turno del "Jugador 1"

Scenario: Realizar ataque
	Given Entro en el juego con el dado para tirar 2 y 5
	When ataca
	Then el resultado del ataque es 2 y 5
