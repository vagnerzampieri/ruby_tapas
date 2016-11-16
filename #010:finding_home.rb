# https://www.rubytapas.com/2012/10/15/episode-010-finding-home/

# first version

config_file = File.join(Dir.home, ".rubytapas")
# => "/home/zampieri/.rubytapas"

# second version

ENV.delete('HOME')
config_file = File.join(Dir.home, ".rubytapas")
# ~> -:2:in `home': couldn't find HOME environment -- expanding `~' (ArgumentError)
# ~>    from -:2:in `<main>

# third version

ENV.delete('HOME')
config_file = File.join(Dir.home("zampieri"), ".rubytapas")
# => "/home/zampieri/.rubytapas"

# fourth version

require 'etc'

user = Etc.getlogin # => "zampieri"
config_file = File.join(Dr.home(user), ".rubytapas")
# => "/home/zampieri/.rubytapas"
