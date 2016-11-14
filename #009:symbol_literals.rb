# https://www.rubytapas.com/2012/10/12/episode-009-symbol-literals/

:foo

"foo-bar (baz)".to_sym # => :"foo-bar (baz)"

:"foo-bar (baz)" # => :"foo-bar (baz)"

post_id = 123
:"post-#{post_id}" # => :"post-123"

:'hello, "world"' # => :"hello, \"world\""

%s{foo:bar} # => :"foo:bar"
