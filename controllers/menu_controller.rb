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
        puts "7 - Destroy all"
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
        when 7
            system "clear"
            destroy_all
            main_menu
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

# selection 2  this has a problem ?? the counter only counts what you inpur manually from 3 create entryu
    def view_entry_number
        system "clear"
        print "Enter the number of the entry you want to view: "
        index = gets.chomp.to_i - 1
        #if index > @count - 1
         if index > @address_book.entries.count - 1   
            #puts "Invalid Number - there are only #{@count} entries"
            puts "Invalid Number - there are only #{@address_book.entries.count} entries"
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
    #    @count = @count + 1     # counter for "entry by number"
        system "clear"
        puts "New entry created"
    end

# selection 4  cp 25
    def search_entries
       print "Search by names: "
       name = gets.chomp
       match = @address_book.binary_search(name) # @address_book is an attribute of menu_controller of class AddressBook
       system "clear"
       
       if match
           puts match.to_s
           search_submenu(match)
       else
           puts "No match found for #{name}"
       end
    end
     
# from cp 25
    def search_submenu(entry)
        puts "\nd -delete entry"
        puts "e - edit this entry"
        puts "m - return to main menu"
        selection = gets.chomp
        
        case selection
        when "d"
            system "clear"
            delete_entry(entry)
            main_menu
        when "e"
            edit_entry(entry)
            system "clear"
            main_menu
        when "m"
            system "clear"
            main_menu
        else
            system "clear"
            puts "#{selection} is not a valid input"
            puts entry.to_s
            search_submenu(entry)
        end
    end
     
       
       
       


# selection 5  cp - 25
    def read_csv
        print "Enter CSV file to import: "
        file_name = gets.chomp
        if file_name.empty?
            system "clear"
            puts "No CSV file read"
            main_menu
        end
        
        begin
            entry_count = @address_book.import_from_csv(file_name).count    # explain what this is doing?
            system "clear"
            puts "#{entry_count} new entries added from #{file_name}"
        rescue
            puts "#{file_name} is not a valid CSV file, please enter the name of a valid CSV file"
            read_csv    # starts read_csv again
        end
    end  
    
    
    
    def entry_submenu (entry)
        puts "\nn - next entry"
        puts "d - delete entry"
        puts "e - edit this entry"
        puts "m - return to main menu"
        selection = gets.chomp
        case selection
            when "n"
            when "d"
                delete_entry(entry)
            when "e"
                edit_entry(entry)
                entry_submenu(entry)
            when "m"
                system "clear"
                main_menu
            else
                system "clear"
                puts "#{selection} is not a valid input"
                entries_submenu(entry)
            end
        end
  
 # from cp 25       
    def delete_entry(entry)
        @address_book.entries.delete(entry) # explain this; removes this entry from
        puts "#{entry.name} has been deleted"
    end

# from cp 25      
    def edit_entry(entry)
        print "Updated name: "
        name = gets.chomp
        print "Updated phone number: "
        phone_number = gets.chomp
        print "Updated email: "
        email = gets.chomp
 #
        entry.name = name if !name.empty?   # set or writes the attribute name to entry.name if? only when empty?
        entry.phone_number = phone_number if !phone_number.empty?
        entry.email = email if !email.empty?
        system "clear"
 # 
        puts "Updated entry:"
        puts entry
    end
    
    def destroy_all
        
       #@address_book.entries.each do |item|
        #   @address_book.entries.delete(item)
        #end
    #return @address_book
        @address_book.entries.clear
    end
        
end

