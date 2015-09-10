class Ship

	attr_accessor :body_parts 
	attr_reader :size

	def initialize(size=2)
		@size = size
		@body_parts = []
			size.times do 
				@body_parts << { coords: [] , hit: false}
			end
		@sunk = false
	end 

	def sunk
		@body_parts.each do |part|
			if part[:hit] == false
				@sunk = false
				return @sunk
			end 
		end
		@sunk = true
		return @sunk 
  end 
end

# p Ship.new(5)