require 'rails_helper'

RSpec.describe Contact, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  it "is valid with firstname, lastname, and email" do
    contact = Contact.new(
                          firstname: "Joe",
                          lastname: "Black",
                          email: "joe.black@hollywood.com")
    contact.valid?
    expect(contact).to be_valid
  end

  it "is invalid without firstname" do
    contact = Contact.new(firstname: nil)
    contact.valid?
    expect(contact.errors[:firstname]).to include("can't be blank")
  end

  it "is invalid without lastname" do
    contact = Contact.new(lastname: nil)
    contact.valid?
    expect(contact.errors[:lastname]).to include("can't be blank")
  end

  it "is invalid without email" do
    contact = Contact.new(email: nil)
    contact.valid?
    expect(contact.errors[:email]).to include("can't be blank")
  end

  it "is invalid with duplicate email" do
    Contact.create(
                  firstname: "Joe",
                  lastname: "Black",
                  email: "joe.black@hollywood.com")
    contact = Contact.new(
                  firstname: "Jim",
                  lastname: "Beam",
                  email: "joe.black@hollywood.com")
    contact.valid?
    expect(contact.errors[:email]).to include("has already been taken")
  end

  it "return contact's fullname as a string" do
    contact = Contact.create(
                  firstname: "Joe",
                  lastname: "Black",
                  email: "joe.black@hollywood.com")
    contact.valid?
    expect(contact.fullname).to eq("Joe Black")
  end

end
