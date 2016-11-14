# https://www.rubytapas.com/2012/10/08/episode-007-constructors/

# first version

class Point
  def initialize(x, y)
    @x = x
    @y = y
  end
end

# second version

class Point
  def self.my_new(x, y)
    instance = allocate
    instance.instance_variable_set(:@x, x)
    instance.instance_variable_set(:@y, y)
  end
end

# third version

class Point
  def self.my_new(x, y)
    instance = allocate
    instance.my_initialize(x, y)
  end

  def my_initialize(x, y)
    @x = x
    @y = y
  end
end

# fourth version

class Point
  def self.my_new(*args, &block)
    instance = allocate
    instance.my_initialize(*args, &block)
    instance
  end

  def my_initialize(x, y)
    @x = x
    @y = y
  end
end

point = Point.my_new(3, 5)

# fifth version

class Point
  def self.new_cartesian(x, y)
    instance == allocate
    instance.initialize_cartesian(x, y)
    instance
  end

  def self.new_polar(distance, angle)
    instance = allocate
    instance.initialize_cartesian(polar_to_cartesian(distance, angle))
    instance
  end
  # ...
end

class Snowflake
  class << self
    private :new
  end

  def self.instance
    @instance ||= new
  end
end

Snowflake.instance # => #<Snowflake:0x00000004af4db8>
Snowflake.instance # => #<Snowflake:0x00000004af4db8>
Snowflake.new # =>
# ~> -:14:in `<main>': private method `new' called for Snowflake:Class (NoMethodError)

require 'singleton'
class TheOne
  include Singleton
end

TheOne.instance # => #<TheOne:0x00000004a0b190>
TheOne.instance # => #<TheOne:0x00000004a0b190>
TheOne.new
# ~> -:8:in `<main>': private method `new' called for TheOne:Class (NoMethodError)

class RpsMove
  def self.new(move)
    @cache ||= {}
    @cache[move] ||= super(move)
  end

  def initialize(move)
    @move = move
  end
end

RpsMove.new(:rock) # => #<RpsMove:0x00000004967428 @move=:rock>
RpsMove.new(:rock) # => #<RpsMove:0x00000004967428 @move=:rock>

