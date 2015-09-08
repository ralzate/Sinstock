module ProductDecorator

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