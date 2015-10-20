load 'tiles.rb'
@world = Hash.new(0)
@starting_position = [0, 0]

def load_tiles
	File.open('resources/map.txt', 'r') do |file|
      @rows = file.readlines
	end
	x_max = (@rows[0].split(' ')).length
	@rows.each_with_index do |row, y|
      @cols = row.split(' ')
      x_max.times do |x|
        tile_name = @cols[x].gsub("\r\n", '')
        if tile_name == 'StartingRoom'
          @starting_position = [x, y]
        end
        @world[x => y] = 
        if tile_name == ''
          nil
        else  
          eval "#{tile_name}.new(x, y)"
        end
      end
    end
end
