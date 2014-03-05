# encoding: UTF-8
class ContactMessage < ActiveRecord::Base
  attr_accessible :email, :message, :nom, :telephone
  validates :email, :email_format => {:message => 'est incorrect'}
  validate do 
    if email.blank? && nom.blank? && telephone.blank?
      errors.add(:email, 'renseignez au moins une information')
    end
    if email == nom
      errors.add(:email, 'Ne peut pas être similaire au nom')
    elsif email == telephone
      errors.add(:email, 'Ne peut pas être similaire au telephone')
    end
  end
end
