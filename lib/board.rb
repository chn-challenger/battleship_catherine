require_relative 'ship'



class Board

	attr_reader :ships, :misses, :hits, :ocean

	def initialize(size=10)
		@size = size 
		@ships = []
		@ship_coords = []
		@hits = []
		@misses = []
		@ocean = []
		(0..@size-1).each do |x|
			(0..@size-1).each do |y|
				#p [x,y]
				@ocean << [x,y]
				#p @ocean
			end
		end
	end



	def ship_coords
		@ship_coords = []
		@ships.each do |ship|
			ship.body_parts.each do |part|
					@ship_coords << part[:coords]
			end
		end
		return @ship_coords
	end

	def overlap?(ship, x, y, orientation)
		all_coords = ship_coords
		new_ship_coords = pending_ship_coords(ship, x, y, orientation)
		common_coords = all_coords & new_ship_coords
		if common_coords == []
			return false
		else
			return true
		end
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
	overlap = overlap?(ship, x, y, orientation)
	fail 'overlap' if overlap == true
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

# p board1.ships
# puts ''
# p board1.ships[0]
# puts ''
# p board1.ships[0].body_parts[0]
# puts ''
# p board1.ships[0].body_parts[0][:coords]




def fire_missile(x,y) 
		@ships.each do |ship|
			ship.body_parts.each do |part|
					if part[:coords] == [x, y]
							part[:hit] = true
							@hits << [x,y]
							return 'hit'
					end
			end
		end
		@misses << [x,y]
			return 'miss'
end

end 

ship1 = Ship.new(2)

ship2 = Ship.new(3)
board1 = Board.new(4)

board1.place(ship1, 0, 0, 'south')
board1.place(ship2,0,1,'south')


p board1.fire_missile(0,0)
p board1.fire_missile(1,1)

p board1.fire_missile(1,0)
p board1.fire_missile(2,3)
p board1.fire_missile(1,3)
p board1.fire_missile(3,2)
p board1.misses
p board1.hits
p board1.ship_coords - board1.hits
p (board1.ocean - board1.ship_coords) - board1.misses



