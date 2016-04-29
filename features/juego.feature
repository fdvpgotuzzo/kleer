Feature: Juego

Scenario: Juego nuevo
	Given Entro en el juego
	Then Es el turno del "jugador 1"

Scenario: Realizar ataque
	Given Entro en el juego con el dado para tirar 2 y 5
	When ataca
	Then el resultado del ataque es 2 y 5

Scenario: Ganar juego
	Given Entro en el juego con el dado para tirar 5 y 2
	When ataca
	Then gana
