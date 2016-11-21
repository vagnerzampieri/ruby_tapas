# https://www.rubytapas.com/2012/10/26/episode-015-advanced-fetch/


#######################################################################################
# #fetch beyond Hash

a = [:x, :y, :z]
a.fetch(3)
# => IndexError: index 3 outside of array bounds: -3...3

port = ENV.fetch('PORT') { 8080 }.to_i
port # => 8080

#######################################################################################
# Defaults for nested hashes

config1 = {
  database: {
    type: 'mysql',
    host: 'localhost'
  }
}

config2 = {} # => empty!

config2.fetch(:database){{}}.fetch(:type){'sqlite'}
# => "sqlite"

#######################################################################################
# Generalized default blocks

{}.fetch(:foo) do |key|
  puts "Missing key: #{key}"
end
# => Missing key: foo

default = ->(key) do
  puts "#{key} not found, please enter it: "
  gets
end

h = {}

name = h.fetch(:name, &default)
email = h.fetch(:email, &default)

#######################################################################################
# Two-argument form of #fetch

{}.fetch(:threads, 4) # => 4
