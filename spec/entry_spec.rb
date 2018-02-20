require_relative '../models/entry'

RSpec.describe Entry do

  describe "attributes" do

    let(:entry) {Entry.new('Stormy Daniels', '800-555-1212', 'stormy.daniels@trumptower.com')}

    it "responds to name" do
      expect(entry).to respond_to(:name)
    end

    it "reports its name" do
      expect(entry.name).to eq('Stormy Daniels')
    end

    it "responds to phone number" do
      expect(entry).to respond_to(:phone_number)
    end

    it "reports its phone_number" do
      expect(entry.phone_number).to eq('800-555-1212')
    end

    it "responds to email" do
      expect(entry).to respond_to(:email)
    end

    it "reports its email" do
      expect(entry.email).to eq('stormy.daniels@trumptower.com')
    end

    describe "#to_s" do
      it "prints an entry as a string" do
        entry = Entry.new('Stormy Daniels', '800-555-1212', 'stormy.daniels@xxx.com')
        expected_string = "Name: Stormy Daniels\nPhone Number: 800-555-1212\nEmail: stormy.daniels@xxx.com"
        expect(entry.to_s).to eq(expected_string)

      end
    end
  end
end