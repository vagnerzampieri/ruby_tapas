# https://www.rubytapas.com/2012/10/05/episode-006-forwardable/

# first version

class User
  attr_reader :account

  def initialize(account)
    @account = account
  end

  def first_name
    account.first_name
  end

  def last_name
    account.last_name
  end

  def full_name
    "#{account.first_name} #{account.last_name}"
  end

  def email_address
    account.email_address
  end
end

GithubAccount = Struct.new(:uid, :email_address, :first_name, :last_name)
FacebookAccount = Struct.new(:login, :email_address, :first_name, :last_name)

user = User.new(GithubAccount.new("vagnerzampieri", "vgzampieri@gmail.com", "Vagner", "Zampieri"))
user.full_name # => "Vagner Zampieri"

# second version

require "forwardable"

class User
  attr_reader :account

  extend Forwardable

  def_delegators :account, :email_address, :first_name, :last_name

  def initialize(account)
    @account = account
  end

  def full_name
    "#{account.first_name} #{account.last_name}"
  end
end

# third version

require "forwardable"

class User
  extend Forwardable

  def_delegators :@account, :email_address, :first_name, :last_name

  def initialize(account)
    @account = account
  end

  def full_name
    "#{account.first_name} #{account.last_name}"
  end
end

class Store
  extend Forwardable

  def_delegator '@owner.account', :email_address, :owner_email

  def initialize(owner)
    @owner = owner
  end
end

user = User.new(GithubAccount.new("vagnerzampieri", "vgzampieri@gmail.com", "Vagner", "Zampieri"))
store = Store.new(user)
store.owner_email # => "vgzampieri@gmail.com"
