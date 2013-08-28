class ContactMessage < ActiveRecord::Base
  attr_accessible :email, :message, :nom, :telephone
end
