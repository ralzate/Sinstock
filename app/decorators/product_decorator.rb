module ProductDecorator

	def select_state_product
	    [
	        ['Excelente', 1],
	        ['Bueno', 2],
	        ['Regular', 3],
	    	['Malo', 4],
	    	['Pesimo', 5]
	    ]
	end

	def label_state_product
	    if select_state_product.flatten.include?(state_product.to_i)
	      select_state_product.each { |nombre, id| return nombre if state_product.to_i == id }
	    end
	end

  	def select_new_used
    	[
	        ['Nuevo', 1],
	        ['Usado', 2]
    	]
  	end

	def label_new_used
	    if select_new_used.flatten.include?(new_used.to_i)
	      select_new_used.each { |nombre, id| return nombre if new_used.to_i == id }
	    end
	end

end