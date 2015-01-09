# Authenticable User Mock
class User

  def name=(str)
    @name = str
  end

  def name
    @str
  end

  def admin?
    @admin === true
  end

  def admin(admin)
    @admin = admin
  end
end