class Enemy
  attr_accessor :name, :hp, :damage
  def initialize(name, hp, damage)
    @name = name
    @hp = hp
    @damage = damage
  end
  def is_alive?
  	@hp > 0
  end
end

class GiantSpider < Enemy
  def initialize
    super("Giant Spider", 10, 2)
  end
end

class Ogre < Enemy
  def initialize
    super("Ogre", 30, 15)
  end
end
