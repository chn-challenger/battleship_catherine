require_relative 'ship'



class Board

	def initialize(size=10)
		@size = size 
		@ships = []
	end

	def pending_ship_coords(ship, x, y, orientation)
		result = []
		if orientation == 'south'
			(0..ship.size - 1).each do |i|
				result  << [x,y]
				x = x + 1
			end
		end
		if orientation == 'north'
			(0..ship.size - 1).each do |i|
				result  << [x,y]
				x = x - 1
			end
		end
		if orientation == 'east'
			(0..ship.size - 1).each do |i|
				result  << [x,y]
				y = y + 1
			end
		end
		if orientation == 'west'
			(0..ship.size - 1).each do |i|
				result  << [x,y]
				y = y - 1
			end
		end
		return result
	end

	def outside?(ship, x, y, orientation)
		pending_coords = pending_ship_coords(ship,x,y,orientation)
		pending_coords = pending_coords.flatten
		p pending_coords
		pending_coords.each do |num|
			if num < 0 || num >= @size
				return true
			end
		end
		return false
	end



	def place(ship, x, y, orientation)
	outside = outside?(ship, x, y, orientation)
	fail 'outside of grid' if outside == true
#check outside??? if yes, then raise error

		if orientation == 'south'
			(0..ship.size - 1).each do |i|
				ship.body_parts[i][:coords] = [x,y]
				x = x + 1
			end
			@ships << ship
			return nil
		end

		if orientation == 'north'
			(0..ship.size - 1).each do |i|
				ship.body_parts[i][:coords] = [x,y]
				x = x - 1
			end
			@ships << ship
			return nil
		end

		if orientation == 'west'
			(0..ship.size - 1).each do |i|
				ship.body_parts[i][:coords] = [x,y]
				y = y + 1
			end
			@ships << ship
			return nil
		end

		if orientation == 'east'
			(0..ship.size - 1).each do |i|
				ship.body_parts[i][:coords] = [x,y]
				y = y - 1
			end
			@ships << ship
			return nil
		end
	
	end

end 

ship1 = Ship.new(5)
ship2 = Ship.new(4)
board1 = Board.new

# board1.place(ship1, 1, 3, 'east')
# board1.place(ship2,2,4,'west')
# p board1
board1.place(ship1,2,2,'west')
p board1

