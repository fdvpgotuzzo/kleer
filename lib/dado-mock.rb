class DadoMock
	def initialize tirada
		@tirada = tirada
		@index = 0
	end

	def tirar
		if @index >= @tirada.length
			@index = 0
		end
		value = @tirada[@index]
		@index += 1
		value
	end
end
