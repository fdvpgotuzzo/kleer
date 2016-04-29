class Juego
	
	def initialize dado
		@dado = dado
	end

	def atacar
		@dado.tirar > @dado.tirar
	end
end
