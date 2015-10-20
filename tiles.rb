
load 'item.rb'
load 'enemy.rb'

class MapTile
  def initialize(x, y)
  	@x = x
  	@y = y
  end
end

class StartingRoom < MapTile
  def intro_text
  	puts "You find yourself in a cave with a flickering torch on the wall.
    \rYou can make out four paths, each equally as dark and foreboding."
  end
end

class LootRoom < MapTile
  def initialize(x, y, item)
  	@item = item
  	super(x, y)
  end

  def add_loot(player)
  	player.inventory << @item
  end

  def modify_player(player)
  	add_loot(player)
  end
end

class EnemyRoom < MapTile
  def initialize(x, y, enemy)
  	@enemy = enemy
  	super(x, y)
  end
  def modify_player(the_player)
  	if @enemy.is_alive?
  		the_player.hp = the_player - @enemy.damage
  		puts("Enemy does %d damage. You have %d HP remaining." %[@enemy.damage, the_player.hp])
  	end
  end
end

class EmptyCavePath < MapTile
  def intro_text
    puts "Another unremarkable part of the cave. You must forge onwards."
  end
end

class GiantSpiderRoom < EnemyRoom
  def initialize(x, y)
  	super(x, y, GiantSpider.new)
  end

  def intro_text
  	if @enemy.is_alive?
  	  puts "A giant spider jumps down from its web in front of you!"
    else
      puts "The corpse of a dead spider rots on the ground."
    end
  end
end

class FindDaggerRoom < LootRoom
  def initialize(x, y)
  	super(x, y, Dagger.new)
  end
  def intro_text
  	puts "You notive something shiny in the corner.
  	\rIt's a dagger! You pick it up."
  end
end

class Find5GoldRoom < LootRoom
	def initialize(x, y)
		super(x, y, Gold.new(5))
	end
	def intro_text
		puts "You see a shiny coin half buried.
		\rYou are now 5 coins richer."
	end
end
