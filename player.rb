require'.\item'
require '.\world'
class Player
  def initialize
  	@inventory = [Gold.new(15), Rock.new]
  	@hp = 100
  	@location_x = @@starting_position[0]
  	@location_y = @@starting_position[1]
  	@not_won = true
  end

  def is_alive?
  	@hp > 0
  end

  def print_inventory
  	@inventory.each do |item|
  	  puts "#{item}\n"	
  	end
  end

  def move(dx, dy)
  	@location_x += dx
  	@location_y += dy
    puts(tile.exists?(@location_x, @location_y).intro_text)
  end

  def move_north
  	move(0, -1)
  end

  def move_south
    move(0, 1)
  end

  def move_east
    move(1, 0)
  end

  def move_west
  	move(-1, 0)
  end

  def attack(enemy)
  	best_weapon = nil
  	max_dmg = 0
  	@inventory.each do |item|
      if item.is_a? Weapon
      	if item.damage > max_dmg
      	  max_dmg = item.damage
      	  best_weapon = item
      	end
      end	
    end
    puts "You use %s against %s!" % [best_weapon.name, enemy.name]
    enemy.hp -= best_weapon.damage
    unless enemy.is_alive?
    	puts "You killed %s!" % enemy.name
    else
    	puts "%s HP is %d." % [enemy.name, enemy.hp] 
    end
  end

  def do_action(action, *kwargs)
  	action_method = action.method.to_s
  	if action_method
  		send(action_method, *kwargs)
  	end
  end

  def flee(tile)
  	available_moves = adjacent_moves
  	r = rand(0, available_moves.length)
  	do_action(available_moves[r])
  end
end