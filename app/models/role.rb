class Role < ActiveRecord::Base
  
  has_many :users
  
  def self.get wanted
    roles = self.where :name => wanted.to_s
    roles.length == 0 ? nil : roles.first
  end
  
end
