# Test !! 
require_relative "item"
require_relative 'world'
require_relative "player"
require_relative "actions"
require_relative "enemy"
require_relative "tiles"

require "test/unit"

class TestWorld < Test::Unit::TestCase
  def test_load_tiles
  	assert_nothing_raised do
  	  World.load_tiles
  	end
  end

  def test_world_not_nil
    World.load_tiles
    assert_not_nil(World.world, "The world must be initialized.")
    assert_not_nil(World.starting_position, "The starting position must be initialized.")
  end
end


class TestPlayer < Test::Unit::TestCase
  def setup
    World.load_tiles
  end
  def test_initialization
  	assert_not_nil(Player.new, "The player must be created.")
  end
  def test_respond_to
  	assert_respond_to(Player.new, :is_alive?)
  	assert_respond_to(Player.new, :print_inventory)
  	assert_respond_to(Player.new, :move)
  	assert_respond_to(Player.new, :move_north)
  	assert_respond_to(Player.new, :move_south)
  	assert_respond_to(Player.new, :move_east)
  	assert_respond_to(Player.new, :move_west)
  	assert_respond_to(Player.new, :attack)
  	assert_respond_to(Player.new, :do_action)
  	assert_respond_to(Player.new, :flee)
  end
end	

class TestItem < Test::Unit::TestCase
  def test_initialization
  	assert_not_nil(Item.new("Item", "This is a item", 10), "The item must be created.")
  end
end

class TestAction < Test::Unit::TestCase
  def test_initialization
    assert_not_nil(Action.new("action", "Action", "a"), "The action must be created.")
  end
end

class TestGame < Test::Unit::TestCase
  def setup
    World.load_tiles
    player = Player.new
  end
  
  def test_player_location
    assert_not_nil(player.location_x, "The location x can't be nil")
    assert_not_nil(player.location_y, "The location y can't be nil")
  end
end