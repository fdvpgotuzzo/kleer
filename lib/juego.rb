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
		cant_paises.times do |i|
				@paises_jugador_1.push(Pais.new (i+1))
				@paises_jugador_2.push(Pais.new (i+1+cant_paises))
		end		
		@ataques_x_turno = cant_paises
	end


	def atacar nombre_pais
        @valor_dado_1 = @dado.tirar
        @valor_dado_2 = @dado.tirar
		gano = @valor_dado_1 > @valor_dado_2
		if gano
			if @turno == 1
				@paises_jugador_1.push(@paises_jugador_2.delete_at(@paises_jugador_2.index{|p| p.nombre == nombre_pais}))
			else
				@paises_jugador_2.push(@paises_jugador_1.delete_at(@paises_jugador_1.index{|p| p.nombre == nombre_pais}))
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

	def cant_paises_jugador_1	
		@paises_jugador_1.length
	end

	def cant_paises_jugador_2	
		@paises_jugador_2.length
	end

	def gano?
		@paises_jugador_1.empty? || @paises_jugador_2.empty?
	end	

	def ataques_de_turno
		@ataques_x_turno
	end

	def paises_jugador_1	
		@paises_jugador_1
	end

	def paises_jugador_2	
		@paises_jugador_2
	end

end
