class Juego
	
	def initialize dado
		@dado = dado
		@turno = "jugador 1"
        @valor_dado_1 = nil
		@valor_dado_2 = nil

	end

	def atacar
        @valor_dado_1 = @dado.tirar
        @valor_dado_2 = @dado.tirar
		@valor_dado_1 > @valor_dado_2
         
	end

    def ultimos_dados
		[@valor_dado_1, @valor_dado_2]
	end

	def siguiente_turno
		if @turno == "jugador 1"
			@turno = "jugador 2"
		else
			@turno = "jugador 1"
		end			
	end
end
