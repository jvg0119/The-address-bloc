require_relative '../models/address_book.rb'


RSpec.describe AddressBook do
    let(:book) {AddressBook.new}
    
    def check_entry(entry, expected_name, expected_number, expected_email)
        expect(entry.name).to eql expected_name
        expect(entry.phone_number).to eql expected_number
        expect(entry.email).to eql expected_email
    end
    
    
    context "attributes" do
        it "shouldn respond to entries" do
#           book = AddressBook.new
            expect(book).to respond_to(:entries)
        end
        
       it "should initialize entries as an array" do
#            book = AddressBook.new
            expect(book.entries).to be_a(Array)
        end
 
       it "should initialize entries as empty" do
#           book = AddressBook.new
            expect(book.entries.size).to eq 0
        end
        
    end
    
    # start here
    context "#add_entry" do
        it "adds only one entry to the address book" do
#            book = AddressBook.new
            book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
            expect(book.entries.size).to eq 1
        end
        it "adds the correct information to entries" do
#            book = AddressBook.new
            book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
            new_entry = book.entries[0]
 
            expect(new_entry.name).to eq 'Ada Lovelace'
            expect(new_entry.phone_number).to eq '010.012.1815'
            expect(new_entry.email).to eq 'augusta.king@lovelace.com'
        end
    end

#removes entry   
    context "#remove_entry" do
        it "removes one entry from the address book" do
#            book = AddressBook.new
            book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
            book.remove_entry('Ada Lovelace','010.012.1815', 'augusta.king@lovelace.com')
            expect(book.entries.size).to eq 0
        end
    end

 # Test that AddressBook's .import_from_csv() method is working as expected
    context "#import_from_csv" do
        it "imports the correct number of entries" do
            book.import_from_csv("entries.csv")
            book_size = book.entries.size
            expect(book_size).to eql 5
        end
        
        it "imports the 1st entry" do
            book.import_from_csv("entries.csv")
            # check the first entry
            entry_one = book.entries[0]
            check_entry(entry_one,"Bill", "555-555-4854", "bill@blocmail.com")
            #expect(entry_one.name).to eql "Bill"
            #expect(entry_one.phone_number).to eql "555-555-4854"
            #expect(entry_one.email).to eql "bill@blocmail.com"
        end
    
    
        it "imports the 2nd entry" do
            book.import_from_csv("entries.csv")
            # check the second entry
            entry_two = book.entries[1]
            check_entry(entry_two,"Bob", "555-555-5415", "bob@blocmail.com")
            #expect(entry_two.name).to eql "Bob"
            #expect(entry_two.phone_number).to eql "555-555-5415"
            #expect(entry_tow.email).to eql "bob@blocmail.com"
        end
        
        it "imports the 3rd entry" do
            book.import_from_csv("entries.csv")
            # check the third entry
            entry_three = book.entries[2]
            check_entry(entry_three,"Joe", "555-555-3660", "joe@blocmail.com")
            #expect(entry_three).to eql "Joe"
            #expect(entry_three).to eql "555-555-3660"
            #expect(entry_three).to eql "joe@blocmail.com"
        end
        
        it "imports the 4th entry" do
            book.import_from_csv("entries.csv")
            # check the fourth entry
            entry_four = book.entries[3]
            check_entry(entry_four,"Sally", "555-555-4646","sally@blocmail.com")
            #expect(entry_four).to eql "Sally"
            #expect(entry_four).to eql "555-555-4646"
            #expect(entry_four).to eql "sally@blocmail.com"
        end
        
        it "imports the 5th entry" do
            book.import_from_csv("entries.csv")
            # Check the fifth entry
            entry_five = book.entries[4]
            check_entry(entry_five,"Sussie", "555-555-2036", "sussie@blocmail.com")
            #expect(entry_five.name).to eql "Sussie"
            #expect(entry_five.phone_number).to eql "555-555-2036"
            #expect(entry.email).to eql "sussie@blocmail.com"
        end
 
 
# new 3 more addresses        
    end

    context "#import_from_csv" do
        it "imports the correct number of entries" do
            book.import_from_csv("entries_2.csv")
            book_size = book.entries.size
            expect(book_size).to eql 3
        end
        
        it "imports the 1st entry" do
            book.import_from_csv("entries_2.csv")
            entry_one = book.entries[0]
            check_entry(entry_one,"Jerry","555-555-5415","jerry@blocmail.com")
        end
        
         it "imports the 2nd entry" do
            book.import_from_csv("entries_2.csv")
            entry_two = book.entries[1]
            check_entry(entry_two,"Mary","555-555-3660","mary@blocmail.com")
        end
        
         it "imports the 3rd entry" do
            book.import_from_csv("entries_2.csv")
            entry_three = book.entries[2]
            check_entry(entry_three,"Tim","555-555-4854","tim@blocmail.com")
        end
    end
    


    
end




            