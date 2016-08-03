class Contact < ApplicationRecord
  has_many :phones

  validates :firstname, :lastname, :email, presence: true
  validates :email, presence: true, uniqueness: true

  def fullname
    firstname + " " + lastname
  end

  def self.by_letter(letter)
    where("lastname LIKE ?", "#{letter}%").order(:lastname)
  end
end
