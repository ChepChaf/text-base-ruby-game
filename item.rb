class Item
  attr_accessor :name, :description, :value
  def initialize(name, description, value)
    @name = name
    @description = description
    @value = value
  end
  def to_s
    "%s\n=====\n%s\nValue: %d\n" %[@name, @description, @value]
  end
end

# Test #sword = Item.new("Sword", "An old sword, it would be incredible if i can really kill something with this.", 5)
# Test #puts sword

class Gold < Item
  def initialize(amount)
  	@amount = amount
  	super("Gold", "A round coint with %d stamped on the front." % @amount, @amount)
  end
end

# Test #gold = Gold.new(500)
# Test #puts gold

class Weapon < Item
  attr_accessor :damage
  def initialize(name, description, value, damage)
  	@damage = damage
  	super(name, description, value)
  end
  def to_s
    "%s\n=====\n%s\nValue: %d\nDamage: %d" %[@name, @description, @value, @damage]
  end
end

class Rock < Weapon
  def initialize
    super("Rock", "A fist-sized rock, suitable for bludgeoning.", 0, 5)
  end
end

class Dagger < Weapon
  def initialize
    super("Dagger", "A small dagger with some rust. Somewhat more dangerous than a rock.", 10, 10)
  end
end
# Test #rock = Weapon.new("Rock", "A fist-sized rock, suitable for bludgeoning.", 0, 5)
# Test #puts rock
# Test #dagger = Weapon.new("Dagger", "A small dagger with some rust. Somewhat more dangerous than a rock.", 10, 10)
# Test #puts dagger