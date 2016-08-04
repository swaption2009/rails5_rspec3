require 'rails_helper'

RSpec.describe Phone, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  it "does not allow duplicate phone numbers per contact" do
    contact = create(:contact)
    create(:phone,
            phone_type: 'home',
            phone: '785-555-1234',
            contact: contact)
    mobile_phone = build(:mobile_phone,
            phone: '785-555-1234',
            contact: contact)
    mobile_phone.valid?
    expect(mobile_phone.errors[:phone]).to include('has already been taken')
  end

  it "allows two contacts to share a phone number" do
    create(:phone,
        phone_type: 'home',
        phone: '785-555-1234'
    )
    expect(build(:phone, phone: '785-555-1234', phone_type: 'home')).to be_valid
  end
end
