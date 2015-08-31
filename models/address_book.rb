require_relative "entry.rb"
require "csv"

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

    def import_from_csv(file_name) # please explain this method?
        csv_text = File.read(file_name)
        csv = CSV.parse(csv_text, headers: true, skip_blanks: true)
        csv.each do |row|
            row_hash = row.to_hash
            add_entry(row_hash["name"], row_hash["phone_number"], row_hash["email"])
        end
    end
 
    def binary_search(name) # passing the name "Bill" or ...
 # 1
        lower = 0
        upper = entries.length - 1  # entries is your array?

 # 2
    while lower <= upper
 # 3
        mid = (lower + upper) / 2
        mid_name = entries[mid].name # mid name is a local var; entries[].name is some name
 
 # 4
        if name == mid_name
            return entries[mid]
        elsif name < mid_name
            upper = mid - 1
        elsif name > mid_name
            lower = mid + 1
        end
    end
     
        return nil
    end
 
 # assignment 24 
    def iterative_search(name)  # passing "nil", "Bill" etx...
        
       # couldn't get this part; I have a lot of questions before
       
        @entries.each do |entry| # @entries my array of names, phone, email
            if entry.name == name                         
                return entry.name
            end
          
        end
    return nil  

    end
               
       
       
        
    
 
 
 
 
 
    
end