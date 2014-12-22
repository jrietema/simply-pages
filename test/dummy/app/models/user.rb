# Authenticable User Mock
class User

  def admin?
    @admin === true
  end

  def admin(admin)
    @admin = admin
  end
end