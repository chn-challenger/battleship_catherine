require_relative 'ship'



class Board
	def initialize 
		@ships = []
	end

	def place(ship, x, y, orientation)

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
board1 = Board.new
p board1
board1.place(ship1, 1, 3, 'east')
p board1