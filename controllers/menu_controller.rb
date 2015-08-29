require_relative "../models/address_book"

class MenuController
    
    attr_accessor :address_book
    attr_writer :count
    
    
    def initialize
        @address_book = AddressBook.new
        @count = 0
    end
    
    def main_menu
       
       puts "Main Menu - #{@address_book.entries.count} entries"
        puts "1 - View all entries"
        puts "2 - View Entry Number"
        puts "3 - Create an entry"
        puts "4 - Search for an entry"
        puts "5 - Import entries from a CSV"
        puts "6 - Exit"
        print "Enter your selection: "
        
        selection = gets.to_i
        #puts "You picked #{selection}"
        case selection
        when 1
            system "clear"
            view_all_entries
            main_menu
        when 2
            system "clear"
            view_entry_number
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
    
# selection 1  
    def view_all_entries
        @address_book.entries.each do |entry|
        system "clear"
        puts entry.to_s
        entry_submenu(entry)
        
    end
        system "clear"
        puts "End of entries"
        
    end

# selection 2
    def view_entry_number
        system "clear"
        print "Enter the number of the entry you want to view: "
        index = gets.chomp.to_i - 1
        if index > @count - 1
            puts "Invalid Number - there are only #{@count} entries"
        else
            puts @address_book.entries[index]
        end
     end

# selection 3 
    def create_entry
        system "clear"
        puts "New AddressBloc Entry"
        print "Name: "
        name = gets.chomp
        print "Phone number: "
        phone = gets.chomp
        print "Email: "
        email = gets.chomp
        @address_book.add_entry(name,phone,email)
        @count = @count + 1     # counter for "entry by number"
        system "clear"
        puts "New entry created"
    end

# selection 4 
    def search_entries
       
    end

# selection 5 
    def read_csv
       
    end  
    
    def entry_submenu (entry)
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
       main_menu
       else
       system "clear"
       puts "#{selection} is not a valid input"
       entries_submenu(entry)
    end
    end
end
