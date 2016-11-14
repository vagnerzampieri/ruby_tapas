# https://www.rubytapas.com/2012/10/10/episode-008-fetch-as-an-assertion/

# first version

auth = {
  'uid'  => 12345,
  'info' => {
    'email'      => 'avdi@avdi.org'
    'first_name' => 'avdi',
    'last_name'  => 'grimm'
  },
  'credentials' => {
    'token' => "TOKEN123"
  }
}

User = Struct.new(:email_address, :first_name, :last_name, :token)

u = User.new
u.email_address = auth['info']['email']
u.first_name    = auth['info']['first_name']
u.last_name     = auth['info']['last_name']
u.token         = auth['credentials']['token']

greeting = "Good morning, #{u.first_name.capitalize}"
greeting # =>
# ~> -:4:in `<main>': undefined method `capitalize' for nil:NilClass (NoMethodError)

# second version

u.email_address = auth['info']['email'] or raise ArgumentError

# third version

u.email_address = auth['info'].fetch('email'])
u.first_name    = auth['info'].fetch('first_name')
u.last_name     = auth['info'].fetch('last_name')
u.token         = auth.fetch('credentials').fetch('token')

# fourth version

auth = {
    'uid'  => 12345,
      'info' => {
        }
}

# ...

u.email_address = auth['info'].fetch('email')
# # ~> -:11:in `fetch': key not found: "email" (KeyError)
# # ~>    from -:11:in `<main>'
