class DadoMock
	def initialize tirada1, tirada2
		@tirada1 = tirada1
		@tirada2 = tirada2
		@tirada_par = false
	end

	def tirar
		@tirada_par = ! @tirada_par
		if @tirada_par
			@tirada1
		else 
			@tirada2
		end
	end
end
