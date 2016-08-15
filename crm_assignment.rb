=begin 
As a user, upon starting the CRM, I am presented with a prompt to add, modify, delete, display all, search by attribute, and exit.
As a user, if I select add I am prompted to enter a 'first name', 'last name', 'email' and 'note'.
As a user, if I select modify I am prompted to enter an id for the contact to be modified.
As a user, when I enter the id of the user I want to modify I am then prompted to select which attribute I want to change from the list 'first name', 'last name', 'email', or 'note'.
As a user, when I enter the attribute I want to change I am then prompted to enter a new value for the attribute.
As a user, if I select delete I am then prompted to enter the id of the contact I want to delete.
As a user, if I select display all I am then shown all of the contacts that exist.
As a user, if search by attribute is selected, I am prompted to select which attribute I want to search by.
As a user, when I choose which attribute I want to search by, I am then prompted to enter the search term.
As a user, when I enter the search term I am then presented with the first contact who matches my search.
As a user, if I select exit I am returned to the command line.
=end



class Contact


	attr_accessor(:first_name, :last_name, :email, :note, :id)


	@@contacts = []
	@@id = 0

	def initialize(first_name, last_name, email, note = "N/A")
		@first_name = first_name
		@last_name = last_name
		@email = email
		@note = note
		@id = @@id
		@@id += 1

		@@contacts << self
	end

	def self.all
		return @@contacts
	end
	# remember, we preface the method name with 'self.' if it is a class method
	def self.create(first_name, last_name, email, note)
		new_contact = Contact.new(first_name, last_name, email, note)
		@@contacts << new_contact
		return new_contact
	end



	def self.find(id)
		@@contacts.each do |contact|
			if contact.id == id
				return [contact.first_name, contact.last_name, contact.email, contact.note, contact.id]
			end
		end
		return "This id does not exist"
	end



	def self.find_by()
		puts "what attribute are you searching for?"
		attribute = gets.chomp
		if attribute == "first name"
			puts "what is their first name?"
			f_name = gets.chomp
			@@contacts.each do |contact|
				if f_name == contact.first_name
					return [contact.first_name, contact.last_name, contact.email, contact.note, contact.id]
				end
			end
			
		elsif attribute == "last name"
			puts "what is their last name?"
			l_name = gets.chomp
			@@contacts.each do |contact|
				if l_name == contact.last_name
					return [contact.first_name, contact.last_name, contact.email, contact.note, contact.id]
				end
			end


		elsif attribute == "email"
			puts "what is their email?"
			email = gets.chomp
			@@contacts.each do |contact|
				if email == contact.email
					return [contact.first_name, contact.last_name, contact.email, contact.note, contact.id]
				end
			end
		else
			"the attribute #{attribute} is not searchable, try again"
			self.find_by()

		end
	end

	def self.remove_all()
		return @@contacts = []
	end

	def full_name()
		return "#{@first_name} #{@last_name}"
	end

	def update(attribute, change)
		if attribute == "first name"
			@first_name = change
		elsif attribute == "last name"
			@last_name = change
		elsif attribute == "email"
			@email = change
		elsif attribute == "note"
			@note = change
		else
			"attribute does not exist"
		end
	end

	def delete()
		return @@contacts.delete(self)
	end
end

contact = Contact.new("mitch", "demers", "m@gmail.com")
contact.update ("first_name", "timmy")
contact2 = Contact.new("john", "smith", "ms@gmail.com")
contact3 = Contact.new("jonny", "smither", "mss@gmail.com")
contact4 = Contact.new("jonnyy", "smithera", "mssa@gmail.com")
puts contact2.delete()
#puts Contact.create("first_name", "last_name", "msms@m", "note")
#puts Contact.all
#contact.first_name = "john"
puts Contact.find(2) 
#puts Contact.find_by()


