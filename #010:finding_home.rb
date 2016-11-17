# https://www.rubytapas.com/2012/10/15/episode-010-finding-home/

#######################################################################################

config_file = File.join(Dir.home, ".rubytapas")
# => "/home/zampieri/.rubytapas"

#######################################################################################

ENV.delete('HOME')
config_file = File.join(Dir.home, ".rubytapas")
# ~> -:2:in `home': couldn't find HOME environment -- expanding `~' (ArgumentError)
# ~>    from -:2:in `<main>

#######################################################################################

ENV.delete('HOME')
config_file = File.join(Dir.home("zampieri"), ".rubytapas")
# => "/home/zampieri/.rubytapas"

#######################################################################################

require 'etc'

user = Etc.getlogin # => "zampieri"
config_file = File.join(Dr.home(user), ".rubytapas")
# => "/home/zampieri/.rubytapas"
