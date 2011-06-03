class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  #:lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :token_authenticatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  
  belongs_to :role
  
  
  def method_missing sym, *args, &block
    
    # Check si rôle ?
    role = mm_has_role? sym
    return role if role
    
    # Super final sinon
    super
    
  end
  
  protected
  
    # Check si la méthode correspond à un rôle
    def mm_has_role? method 
      existing_role = Role.get method.to_s.gsub(/\?$/, '')
      if existing_role
        if existing_role == role
          true
        else
          false
        end
      else
        nil
      end
    end
  
end
