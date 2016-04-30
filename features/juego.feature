Feature: Juego

Scenario: Juego nuevo
	Given Entro en el juego
	Then Es el turno del "Jugador 1"

Scenario: Realizar ataque
	Given Entro en el juego con el dado para tirar 2 y 5
	When ataca
	Then el resultado del ataque es 2 y 5

Scenario: Ganar juego
	Given Entro en el juego con el dado para tirar 5 y 2
	When ataca
	Then gana

Scenario: Cantidad de Ataques por turno
	Given Entro en el juego con 3 paises por jugador
 	Then Veo 3 ataques restantes

Scenario: Cambio de turno
	Given Entro en el juego con 3 paises por jugador
	When Ataco 3 veces 	
	Then Veo turno de jugador 2

Scenario: Visualizar paises
	Given Entro en el juego con 3 paises por jugador
	Then Veo jugador 1 tiene los paises 1 ,2 ,3

