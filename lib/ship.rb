class Ship

	attr_accessor :body_parts 
	attr_reader :size

	def initialize(size=2)
		@size = size
		@body_parts = []
			size.times do 
				@body_parts << { coords: [] , hit: false}
			end
		
	end 

end

# p Ship.new(5)