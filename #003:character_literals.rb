# https://www.rubytapas.com/2012/09/28/episode-003-character-literals/
?c # => "c"
?q # => "q"

case $stdin.getc.downcase
when ?y then puts "Proceeding ..."
when ?n then puts "Aborting."
else puts "I don't understand."
end
