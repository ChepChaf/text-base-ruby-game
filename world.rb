
load 'tiles.rb'
@world = {}
@starting_position = [0, 0]

def load_tiles
	File.open('resources/map.txt', 'r') do |file|
      @rows = file.readlines
	end
	x_max = (@rows[0].split("\t")).length
	@rows.each_with_index do |row, y|
      @cols = @rows[y].split("\t")
      x_max.times do |x|
        tile_name = @cols[x].gsub("\n", '') #unless @cols[x] == nil
        if tile_name == 'StartingRoom'
          @starting_position = [x, y]
        end
        @world[x => y] = 
        if tile_name == '' #|| tile_name == nil
          nil
        else  
          eval "#{tile_name}.new(x, y)"
        end
      end
    end
end

def tile_exists?(x, y)
  @world[x => y] 
end
