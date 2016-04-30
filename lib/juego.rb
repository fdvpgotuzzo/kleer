require_relative './dado.rb'
require_relative './pais.rb'

class Juego
	def initialize dado, cant_paises
		@dado = dado
		@turno = 1
        @valor_dado_1 = nil
		@valor_dado_2 = nil
		@paises_jugador_1 = []
		@paises_jugador_2 = []
		cant_paises.times {
				@paises_jugador_1.push(Pais.new)
				@paises_jugador_2.push(Pais.new)
		}
		@ataques_x_turno = cant_paises
	end


	def atacar
        @valor_dado_1 = @dado.tirar
        @valor_dado_2 = @dado.tirar
		gano = @valor_dado_1 > @valor_dado_2
		if gano
			if @turno == 1
				@paises_jugador_1.push(@paises_jugador_2.pop)
			else
				@paises_jugador_2.push(@paises_jugador_1.pop)
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
			@ataques_x_turno = @paises_jugador_2.length
		else
			@turno = 1
			@ataques_x_turno = @paises_jugador_1.length
		end			
	end

	def paises_jugador1	
		@paises_jugador_1.length
	end

	def paises_jugador2	
		@paises_jugador_2.length
	end

	def gano?
		@paises_jugador_1.empty? || @paises_jugador_2.empty?
	end	

	def ataques_de_turno
		@ataques_x_turno
	end

end
