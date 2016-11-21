# https://www.rubytapas.com/2012/10/24/episode-014-super/

#######################################################################################

class Parent
  def hello(subject="World")
    puts "Hello, #{subject}"
  end
end

class Child < Parent
  def hello(subject)
    super # super(subject)
    puts "How are you today?"
  end
end

Child.new.hello("Zampieri")
# => Hello, Zampieri
# => How are you today?

#######################################################################################

class Child < Parent
  def hello(subject=:default)
    if subject == :default
      super()
    else
      super(subject)
    end
    puts "How are you today?"
  end
end

Child.new.hello(:default)
# => Hello, World
# => How are you today?

#######################################################################################

class Parent
  def hello(subject="World")
    puts "Hello, #{subject}"

    if block_given?
      yield
      puts "Well, nice seeing you!"
    end
  end
end

class Child < Parent
  def hello(subject=:default)
    if subject == :default
      super()
    else
      super(subject)
    end
    puts "How are you today?"
  end
end

Child.new.hello(:default) do
  puts "Hi there, Child!"
end
# => Hello, World
# => Hi there, Child!
# => Well, nice seeing you!
# => How are you today?

#######################################################################################

class Child < Parent
  def hello(subject=:default)
    if subject == :default
      super(&nil)
    else
      super(subject, &nil)
    end
    puts "How are you today?"
  end
end

Child.new.hello(:default) do
  puts "Hi there, Child!"
end
# => Hello, World
# => How are you today?
