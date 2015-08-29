require_relative "entry.rb"

class AddressBook
    attr_accessor :entries
    
    def initialize
        @entries = []
    end
    # entries = ["Amanda", "Charlie"]
    def add_entry(name, phone, email)
        
        index = 0
        @entries.each do |entry|
            
            if name < entry.name
                break
            end
            index += 1
        end
        
        @entries.insert(index, Entry.new(name, phone, email))
        
    end
   
  
   # remove entry`
    def remove_entry(name, phone, email)
       # index = 0
        @entries.each do |entry|
            if name < entry.name
                break
            end
        @entries.delete_if { entry.email == email}
        end
    end

    
end