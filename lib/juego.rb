require_relative './dado.rb'

class Juego
	def initialize dado, paises
		@dado = dado
		@turno = 1
        @valor_dado_1 = nil
		@valor_dado_2 = nil
		@paises_jugador_1 = paises
		@paises_jugador_2 = paises
		@ataques_x_turno = paises
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
		@ataques_x_turno -=1
		if @ataques_x_turno == 0
			siguiente_turno
		end
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
			@ataques_x_turno = @paises_jugador_2
		else
			@turno = 1
			@ataques_x_turno = @paises_jugador_1
		end			
	end

	def paises_jugador1	
		@paises_jugador_1
	end

	def paises_jugador2	
		@paises_jugador_2
	end

	def gano?
		@paises_jugador_1 == 0 || @paises_jugador_2 == 0
	end	

	def ataques_de_turno
		@ataques_x_turno
	end

end
