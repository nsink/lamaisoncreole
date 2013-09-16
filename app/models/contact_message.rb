class ContactMessage < ActiveRecord::Base
  attr_accessible :email, :message, :nom, :telephone
  validates :email, :email_format => {:message => 'est incorrect'}
end
