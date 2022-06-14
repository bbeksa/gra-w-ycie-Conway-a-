require 'ruby2d'

set background: '#570861'

SQUARE_SIZE = 32
set width: SQUARE_SIZE * 22
set height: SQUARE_SIZE * 20

class Grid
	def initialize
		@grid = {}
		@playing = false
	end

	def play_pause
		@playing = !@playing
	end

	def draw_lines
		(Window.width / SQUARE_SIZE).times do |x|
			Line.new(
				width: 1,
				color: Color.new('black'),
				y1: 0,
				y2: Window.height,
				x1: x * SQUARE_SIZE,
				x2: x * SQUARE_SIZE,
			)

			(Window.height / SQUARE_SIZE).times do |y|
				Line.new(
					width: 1,
					color: Color.new('black'),
					x1: 0,
					x2: Window.width,
					y1: y * SQUARE_SIZE,
					y2: y * SQUARE_SIZE,
				)
			end
		end

		def switch(x, y)
			if @grid.has_key?([x, y])
				@grid.delete([x, y])
			else
				@grid[[x, y]] = true
			end
		end

		def draw_alive_squares
			@grid.keys.each do |x, y|
				Square.new(
					color: Color.new('fuchsia'),
					x: x * SQUARE_SIZE,
					y: y * SQUARE_SIZE,
					size: SQUARE_SIZE
				)
			end
		end

		def calculate_frame
			if @playing
				new_grid = {}

				(Window.width / SQUARE_SIZE).times do |x|
					(Window.height / SQUARE_SIZE).times do |y|
						alive = @grid.has_key?([x, y])

						alive_neighbours = [
							@grid.has_key?([x - 1, y - 1]),
							@grid.has_key?([x, y - 1]),
							@grid.has_key?([x + 1, y - 1]),
							@grid.has_key?([x + 1, y]),
							@grid.has_key?([x + 1, y + 1]),
							@grid.has_key?([x, y + 1]),
							@grid.has_key?([x - 1, y + 1]),
							@grid.has_key?([x - 1, y]),
						].count(true)

						if (alive && alive_neighbours.between?(2, 3)) || (!alive && alive_neighbours == 3)
							new_grid[[x, y]] = true
						end
					end
				end

				@grid = new_grid
			end
		end
	end

	def clear
		@grid = { }
	end
end

def sl1(grid)
	grid.draw_lines
	grid.draw_alive_squares

	grid.switch(3, 3)
	grid.switch(4, 3)
	grid.switch(3, 4)
	grid.switch(4, 4)
end

def sl2(grid)
	grid.draw_lines
	grid.draw_alive_squares

	grid.switch(5, 2)
	grid.switch(6, 2)
	grid.switch(5, 4)
	grid.switch(6, 4)
	grid.switch(4, 3)
	grid.switch(7, 3)
end

def sl3(grid)
	grid.draw_lines
	grid.draw_alive_squares

	grid.switch(3, 3)
	grid.switch(4, 3)
	grid.switch(3, 4)
	grid.switch(5, 4)
	grid.switch(4, 5)
end

def sl4(grid)
	grid.draw_lines
	grid.draw_alive_squares

	grid.switch(4, 3)
	grid.switch(3, 4)
	grid.switch(5, 4)
	grid.switch(4, 5)
end

def osc1(grid)
	grid.draw_lines
	grid.draw_alive_squares

	grid.switch(3, 3)
	grid.switch(4, 3)
	grid.switch(5, 3)
end

def osc2(grid)
	grid.draw_lines
	grid.draw_alive_squares

	grid.switch(4, 3)
	grid.switch(5, 3)
	grid.switch(6, 3)
	grid.switch(3, 4)
	grid.switch(4, 4)
	grid.switch(5, 4)
end

def osc3(grid)
	grid.draw_lines
	grid.draw_alive_squares

	grid.switch(3, 2)
	grid.switch(4, 2)
	grid.switch(3, 3)
	grid.switch(6, 4)
	grid.switch(5, 5)
	grid.switch(6, 5)
end

def osc4(grid)
	grid.draw_lines
	grid.draw_alive_squares

	grid.switch(5, 2)
	grid.switch(6, 2)
	grid.switch(7, 2)
	grid.switch(3, 4)
	grid.switch(3, 5)
	grid.switch(3, 6)
	grid.switch(8, 4)
	grid.switch(8, 5)
	grid.switch(8, 6)
	grid.switch(5, 7)
	grid.switch(6, 7)
	grid.switch(7, 7)
	grid.switch(11, 2)
	grid.switch(12, 2)
	grid.switch(13, 2)
	grid.switch(10, 4)
	grid.switch(10, 5)
	grid.switch(10, 6)
	grid.switch(15, 4)
	grid.switch(15, 5)
	grid.switch(15, 6)
	grid.switch(11, 7)
	grid.switch(12, 7)
	grid.switch(13, 7)
	grid.switch(5, 9)
	grid.switch(6, 9)
	grid.switch(7, 9)
	grid.switch(3, 10)
	grid.switch(3, 11)
	grid.switch(3, 12)
	grid.switch(8, 10)
	grid.switch(8, 11)
	grid.switch(8, 12)
	grid.switch(5, 14)
	grid.switch(6, 14)
	grid.switch(7, 14)
	grid.switch(11, 9)
	grid.switch(12, 9)
	grid.switch(13, 9)
	grid.switch(10, 10)
	grid.switch(10, 11)
	grid.switch(10, 12)
	grid.switch(15, 10)
	grid.switch(15, 11)
	grid.switch(15, 12)
	grid.switch(11, 14)
	grid.switch(12, 14)
	grid.switch(13, 14)
end

def osc5(grid)
	grid.draw_lines
	grid.draw_alive_squares

	grid.switch(9, 5)
	grid.switch(10, 5)
	grid.switch(11, 5)
	grid.switch(9, 6)
	grid.switch(11, 6)
	grid.switch(9, 7)
	grid.switch(10, 7)
	grid.switch(11, 7)
	grid.switch(9, 8)
	grid.switch(10, 8)
	grid.switch(11, 8)
	grid.switch(9, 9)
	grid.switch(10, 9)
	grid.switch(11, 9)
	grid.switch(9, 10)
	grid.switch(10, 10)
	grid.switch(11, 10)
	grid.switch(9, 11)
	grid.switch(11, 11)
	grid.switch(9, 12)
	grid.switch(10, 12)
	grid.switch(11, 12)
end

def gl(grid)
	grid.draw_lines
	grid.draw_alive_squares

	grid.switch(1, 2)
	grid.switch(2, 3)
	grid.switch(3, 1)
	grid.switch(3, 2)
	grid.switch(3, 3)
end

grid = Grid.new

if ARGV[0] == "sl1"
	set width: SQUARE_SIZE * 8
	set height: SQUARE_SIZE * 8

   sl1(grid)
end

if ARGV[0] == "sl2"
	set width: SQUARE_SIZE * 12
	set height: SQUARE_SIZE * 8

	sl2(grid)
end

if ARGV[0] == "sl3"
	set width: SQUARE_SIZE * 9
	set height: SQUARE_SIZE * 9

	sl3(grid)
end

if ARGV[0] == "sl4"
	set width: SQUARE_SIZE * 9
	set height: SQUARE_SIZE * 9

	sl4(grid)
end

if ARGV[0] == "osc1"
	set width: SQUARE_SIZE * 9
	set height: SQUARE_SIZE * 7

   osc1(grid)
end

if ARGV[0] == "osc2"
	set width: SQUARE_SIZE * 10
	set height: SQUARE_SIZE * 9

   osc2(grid)
end

if ARGV[0] == "osc3"
	set width: SQUARE_SIZE * 10
	set height: SQUARE_SIZE * 9

   osc3(grid)
end

if ARGV[0] == "osc4"
	set width: SQUARE_SIZE * 19
	set height: SQUARE_SIZE * 17

   osc4(grid)
end

if ARGV[0] == "osc5"
   osc5(grid)
end

if ARGV[0] == "gl"
	set width: SQUARE_SIZE * 22
	set height: SQUARE_SIZE * 20

   gl(grid)
end

update do
	clear
	grid.draw_lines
	grid.draw_alive_squares

	if Window.frames % 20 == 0
		grid.calculate_frame
	end
end

on :mouse_down do |event|
	grid.switch(event.x / SQUARE_SIZE, event.y / SQUARE_SIZE)
end

on :key_down do |event|
	if event.key == 'space'
		grid.play_pause
   end
	if event.key == 'q'
		exit
   end
	if event.key == 'c'
		grid.clear
	end

	if event.key == '1'
		grid = Grid.new
      sl1(grid)
   end
	if event.key == '2'
		grid = Grid.new
		sl2(grid)
   end
	if event.key == '3'
		grid = Grid.new
		sl3(grid)
   end
	if event.key == '4'
		grid = Grid.new
		sl4(grid)
   end
	if event.key == '5'
		grid = Grid.new
      osc1(grid)
   end
	if event.key == '6'
		grid = Grid.new
		osc2(grid)
   end
	if event.key == '7'
		grid = Grid.new
		osc3(grid)
   end
	if event.key == '8'
		grid = Grid.new
		osc4(grid)
   end
	if event.key == '9'
		grid = Grid.new
		osc5(grid)
   end
	if event.key == '0'
		grid = Grid.new
      gl(grid)
	end
end

show
