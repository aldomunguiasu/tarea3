class Node
	def initialize (dato,ref = nil)
		@dato = dato
		@ref = ref
	end

	def get_dato
		return @dato
	end

	def set_dato(newdato)
		@dato = newdato
	end

	def get_ref
		return @ref
	end

	def set_ref(newref)
		@ref = newref
	end
end

class Linkedlist
	def initialize 
		@tamano = 0
		@header = nil
	end

	def add_elem(a)
		@tamano = @tamano + 1
		if @header == nil
				@header = Node.new(a)
		else
		nowNode = @header
			while nowNode.get_ref!= nil
				  nowNode = nowNode.get_ref
			end
		nowNode.set_ref(Node.new(a))
		end
	end

	def  print_l
		nowNode = @header
		acumulador = []
		while nowNode.get_ref != nil
			acumulador += [nowNode.get_dato]
			nowNode = nowNode.get_ref
		end
		acumulador += [nowNode.get_dato]
		puts acumulador.join(",") #esto encadena todo y te ahorra todo lo de abajo
	end

	def erase_elem(datoELiminar)
		nowNode = @header

		if nowNode.get_dato == datoELiminar
			@header = @header.get_ref
		else
			nowNode = @header
			while (nowNode.get_ref != nil) && ((nowNode.get_ref).get_dato != datoELiminar)
				nowNode = nowNode.get_ref
			end
			if (nowNode != nil) && (nowNode.get_ref != nil)
				nowNode.set_ref((nowNode.get_ref).get_ref)
			end
		end

	end

end

list = Linkedlist.new

stop = 1

while stop != -1
	a = gets.chomp 
	if a.to_i == -1
		stop = -1
	else
		list.add_elem(a)
	end
end

list.print_l

=begin
puts "Dame elemento a borrar"
b=gets.chomp
list.erase_elem(b)
list.print_l
=end


