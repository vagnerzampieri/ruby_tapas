# https://www.rubytapas.com/2012/10/01/episode-004-barewords/

#######################################################################################

salutation  = "Most agreeable to see you"
title       = "Commander"
full_name   = "Sam Vimes"
progname    = "Dis-organizer"
version     = "Mark 7"
designation = "Seeree"
service_inquiry = "order you a coffee"

puts "#{salutation}, #{title} #{full_name}. ",
     "Welcome to #{progname} version #{version}. ",
     "My name is #{designation}.",
     "May I #{service_inquiry}?"
# >> Most agreeable to see you, Commander Sam Vimes.
# >> Welcome to Dis-organizer version Mark 7.
# >> My name is Seeree.
# >> May I order you a coffee?

#######################################################################################

$progname = "Dis-organizer"

module DisOrganizer
  VERSION = "Mark 7"
end

class CoffeeEnabled
  def service_inquiry
    "order you a coffee"
  end
end

class ObsequiousImp
  SALUTATION = "Most agreeable to see you"

  attr_accessor :special_feature

  def initialize(designation)
    @designation = designation
  end

  def greet(title, first_name, last_name)
    puts "#{SALUTATION}, #{title} #{first_name} #{last_name}. ",
         "Welcome to #{$progname} version #{DisOrganizer::VERSION}. ",
         "My name is #{@designation}.",
         "May I #{special_feature.service_inquiry}?"
  end
end

imp = ObsequiousImp.new("Seeree")
imp.special_feature = CoffeeEnabled.new
imp.greet "Commander", "Sam", "Vimes"
# >> Most agreeable to see you, Commander Sam Vimes.
# >> Welcome to Dis-organizer version Mark 7.
# >> My name is Seeree.
# >> May I order you a coffee?

#######################################################################################

def progname; "Dis-organizer"; end

module DisOrganizer
  def version; "Mark 7"; end
end

class CoffeeEnabled
  def service_inquiry
    "order you a coffee"
  end
end

class ObsequiousImp
  include DisOrganizer
  attr_reader :designation
  attr_accessor :special_feature

  def initialize(designation)
    @designation = designation
  end

  def salutation
    "Most agreeable to see you"
  end

  def service_inquiry
    special_feature.service_inquiry
  end

  def greet(title, first_name, last_name)
    full_name   = "#{first_name} #{last_name}"

    puts "#{salutation}, #{title} #{full_name}. ",
         "Welcome to #{progname} version #{version}. ",
         "My name is #{designation}.",
         "May I #{service_inquiry}?"
  end
end

imp = ObsequiousImp.new("Seeree")
imp.special_feature = CoffeeEnabled.new
imp.greet "Commander", "Sam", "Vimes"
# >> Most agreeable to see you, Commander Sam Vimes.
# >> Welcome to Dis-organizer version Mark 7.
# >> My name is Seeree.
# >> May I order you a coffee?
