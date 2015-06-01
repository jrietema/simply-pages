# Authenticable User Mock
class User

  def name=(str)
    @name = str
  end

  def name
    @name
  end

  def admin?
    @admin === true
  end

  def admin(admin)
    @admin = admin
  end

  def to_hash
    {name: name, admin: admin?}
  end

  def self.from_hash(hash)
    case hash
      when nil
        nil
      else
        user = User.new
        user.name = hash['name']
        user.admin(hash['admin'])
        user
    end
  end
end