require_relative '../models/address_book'

class MenuController
  attr_reader :address_book

  def initialize
    @address_book = AddressBook.new
  end

  def main_menu
    puts "Main Menu - #{address_book.entries.count} entries"
    puts "1 - View all entries"
    puts "2 - View entry number n"
    puts "3 - Create an entry"
    puts "4 - Search for an entry"
    puts "5 - Import entries from a CSV"
    puts "6 - Exit"
    print "Enter your selection: "
    selection = gets.to_i
    case selection
      when 1
        system "clear"
        view_all_entries
        main_menu
      when 2
        system "clear"
        view_specific_entry
        main_menu
      when 3
        system "clear"
        create_entry
        main_menu
      when 4
        system "clear"
        search_entries
        main_menu
      when 5
        system "clear"
        read_csv
        main_menu
      when 6
        puts "Good-bye!"
        exit(0)
      else
        system "clear"
        puts "Sorry, that is not a valid input"
        main_menu
    end
  end

  def view_all_entries
    address_book.entries.each do |entry|
      system "clear"
      puts entry.to_s
      entry_submenu(entry)
    end
    system "clear"
    puts "End of entries"
  end

  def view_specific_entry
    system "clear"
    entry_num = 0
    addr_count = address_book.entries.count
    if addr_count > 0
      until entry_num > 0 && entry_num <= addr_count do
        print "Enter the specific number for the address entry you want to view: "
        entry_num = gets.chomp.to_i
        puts "Invalid input. Please enter a number between 1 and #{addr_count}." if (entry_num == 0 || entry_num > addr_count)
      end
      puts address_book.entries[entry_num-1].to_s
    else
      puts "There are no entries in the address book."
    end
    puts "\nPress Enter to continue . . ."
    gets
    system "clear"
  end

  def create_entry
    system "clear"
    puts "New AddressBloc Entry"
    print "Name: "
    name = gets.chomp
    print "Phone number: "
    phone = gets.chomp
    print "Email: "
    email = gets.chomp
    address_book.add_entry(name, phone, email)
    system "clear"
    puts "New entry created"
  end

  def search_entries

  end
  def read_csv

  end

  def entry_submenu(entry)
    puts "n - next entry"
    puts "d - delete entry"
    puts "e - edit this entry"
    puts "m - return to main menu"
    selection = gets.chomp
    case selection
      when "n"
      when "d"
      when "e"
      when "m"
        system "clear"
      else
        system "clear"
        puts "#{selection} is not a valid input"
        entry_submenu(entry)
    end
  end


end