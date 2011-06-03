# Création des rôles par défaut :
{:admin => 256, :user => 32}.each do |name, rights|
  Role.create! do |r|
    r.name = name.to_s
    r.rights = rights.to_s
  end
end
  

# Ajoute de l'utilisateur admin :
User.create! do |u|
  u.email = 'admin@test.com'
  u.password = 'admin123'
  u.role = Role.get :admin
  u.confirm!
end