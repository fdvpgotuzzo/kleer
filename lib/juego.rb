require_relative './dado.rb'

class Juego
	def initialize dado, paises
		@dado = dado
		@turno = 1
        @valor_dado_1 = nil
		@valor_dado_2 = nil
		@paises_jugador_1 = paises
		@paises_jugador_2 = paises
	end


	def atacar
        @valor_dado_1 = @dado.tirar
        @valor_dado_2 = @dado.tirar
		gano = @valor_dado_1 > @valor_dado_2
		if gano
			if @turno == 1
				@paises_jugador_1 +=1
				@paises_jugador_2 -=1
			else
				@paises_jugador_1 -=1
				@paises_jugador_2 +=1
			end
		end
		siguiente_turno
		gano
	end

    def ultimos_dados
		[@valor_dado_1, @valor_dado_2]
	end

	def turno
		@turno
	end

	def siguiente_turno
		if @turno == 1
			@turno = 2
		else
			@turno = 1
		end			
	end

	def paises_jugador1	
		@paises_jugador_1
	end

	def paises_jugador2	
		@paises_jugador_2
	end
end
