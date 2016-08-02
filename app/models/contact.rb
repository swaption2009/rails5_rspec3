class Contact < ApplicationRecord
  has_many :phones

  validates :firstname, :lastname, :email, presence: true
  validates :email, presence: true, uniqueness: true

  def fullname
    firstname + " " + lastname
  end
end
