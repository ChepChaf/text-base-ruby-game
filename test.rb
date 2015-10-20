# Test !! 
require_relative "item"
require_relative "world"
require_relative "player"
require_relative "actions"
require_relative "enemy"
require_relative "tiles"

require "test/unit"

class TestWorld
  def test_load_tile
  	load_tiles
  end
end


class TestPlayer < Test::Unit::TestCase
  def test_initialization
  	assert_not_nil(PLayer.new, "The player must be created.")
  end
end	

