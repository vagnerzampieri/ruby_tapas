# https://www.rubytapas.com/2012/09/24/episode-001-binary-literals/
require 'fileutils'
include FileUtils

chmod 755, 'somefile'

# U  G  O
# # rwxrwxrwx
# 0b111101101

perms = 0b111101101
perms.to_s(8) # => '755'

chmod perms, 'somefile'
