require_relative '../models/address_book'

RSpec.describe AddressBook do
  describe "attributes" do
    it "responds to entries" do
      book = AddressBook.new
      expect(book).to respond_to(:entries)
    end

    it "initializes entries as an array" do
      book = AddressBook.new
      expect(book.entries).to be_an(Array)
    end

    it "initializes entries as empty" do
      book = AddressBook.new
      expect(book.entries.size).to eq(0)
    end
  end

  describe "#add_entry" do
    it "adds only one entry to the address book" do
      book = AddressBook.new
      book.add_entry('Stormy Daniels', '800-555-1212', 'stormy.daniels@trumptower.com')

      expect(book.entries.size).to eq(1)
    end

    it "adds the correct information to entries" do
      book = AddressBook.new
      book.add_entry('Stormy Daniels', '800-555-1212', 'stormy.daniels@trumptower.com')
      new_entry = book.entries[0]

      expect(new_entry.name).to eq('Stormy Daniels')
      expect(new_entry.phone_number).to eq('800-555-1212')
      expect(new_entry.email).to eq('stormy.daniels@trumptower.com')
    end
  end

  describe "#remove_entry" do
    it "deletes only one entry from the address book" do
      book = AddressBook.new
      book.add_entry('Stormy Daniels', '800-555-1212', 'stormy.daniels@trumptower.com')
      expect(book.entries.size).to eq(1)
      book.remove_entry('Stormy Daniels', '800-555-1212', 'stormy.daniels@trumptower.com')
      expect(book.entries.size).to eq(0)
    end

    it "does not delete when all data passed does not fully match" do
      book = AddressBook.new
      book.add_entry('Stormy Daniels', '800-555-1212', 'stormy.daniels@trumptower.com')
      expect(book.entries.size).to eq(1)
      book.remove_entry('Stormy Daniels', '800-xxx-yyyy', 'stormy.daniels@trumptower.com')
      expect(book.entries.size).to eq(1)
      book.remove_entry('Stormy Daniels', '800-555-1212', 'stormy.nights@trumptower.com')
      expect(book.entries.size).to eq(1)
    end

  end

end