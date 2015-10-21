require '.\player'

class Action
  attr_reader :method, :hotkey, :name, :kwargs
  def initialize(method, name, hotkey, *kwargs)
    @method = method
    @hotkey = hotkey
    @name = name
    @kwargs = kwargs
  end

  def to_s
    "%s: %s" % [@hotkey, @name]	
  end
end

class MoveNorth < Action
  def initialize
	super(move_north, "Move north", 'n')
  end
end

class MoveSouth < Action
  def initialize
	super(move_south, "Move south", 's')
  end
end

class MoveEast < Action
  def initialize
    super(move_east, "Move east", 'e')
  end
end

class MoveWest < Action
  def initialize
  	super(move_west, "Move west", 'w')
  end
end

class ViewInventory < Action
  def initialize
  	super(print_inventory, "View inventory", 'i')
  end
end

class Attack < Action
  def initialize(enemy)
    super(attack, "Attack", 'a', enemy)
  end
end

class Flee < Action
  def initialize(tile)
  	super(flee, "Flee", 'f', tile)
  end
end