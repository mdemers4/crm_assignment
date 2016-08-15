require_relative 'crm_assignment'


class CRM

  def initialize

  end

  def main_menu
    while true # repeat indefinitely
      print_main_menu
      user_selected = gets.to_i
      call_option(user_selected)
    end
  end

  def print_main_menu
    puts '[1] Add a new contact'
    puts '[2] Modify an existing contact'
    puts '[3] Delete a contact'
    puts '[4] Display all the contacts'
    puts '[5] Search by attribute'
    puts '[6] Exit'
    puts 'Enter a number: '
  end

  def call_option(user_selected)
    case user_selected
    when 1 then add_new_contact
    when 2 then modify_existing_contact
    when 3 then delete_contact
    when 4 then display_all_contacts
    when 5 then search_by_attribute
    else  
      exit
    # Finish off the rest for 3 through 6
    # To be clear, the methods add_new_contact and modify_existing_contact
    # haven't been implemented yet
    end
  end

  def add_new_contact()
    print 'Enter First Name: '
    first_name = gets.chomp

    print 'Enter Last Name: '
    last_name = gets.chomp

    print 'Enter Email Address: '
    email = gets.chomp

    print 'Enter a Note: '
    note = gets.chomp

    Contact.create(first_name, last_name, email, note)
  end

  def modify_existing_contact()

    print 'what attribute would you want to modify: '
    attribute = gets.chomp
    print 'w '
    value = gets.chomp
    contact_info = Contact.find_by(attribute, value)

    if attribute == 'first name'
      print 'what would you want to change the first name to? '
      new_first_name = gets.chomp
      return contact_info.update('first name', new_first_name)

    elsif attribute == 'last name'
      print 'what would you like to change the lastname to? '
      new_last_name = gets.chomp
      return contact_info.update('last name', new_last_name)

    elsif attribute == 'email'
      print 'what would you like to change the email to? '
      new_email = gets.chomp
      return contact_info.update('email', new_email)

    end
  end

  def delete_contact()
    print 'whats the id of the contact to delete? '
    id = gets.chomp.to_i
    contact_info = Contact.find(id)
    contact_info.delete()

  end

  # This method should accept as an argument an array of contacts
  # and display each contact in that array
  def display_contacts(array_of_contents)
    array_of_contents.each do |content|
      puts content
    end
    # HINT: Make use of this method in the display_all_contacts and search_by_attribute methods to keep your code DRY
  end

  def display_all_contacts()
    all_contacts = Contact.all
    return display_contacts(all_contacts)

    # HINT: Make use of the display_contacts method to keep your code DRY
  end

  def search_by_attribute()
    puts "enter attribute: "
    attribute = gets.chomp
    puts "enter first name, last name, or email of contact"
    value = gets.chomp
    contact_info = Contact.find_by(attribute, value)
    return display_contacts([contact_info.first_name, contact_info.last_name, contact_info.email, contact_info.note])
    # HINT: Make use of the display_contacts method to keep your code DRY
  end

  # Add other methods here, if you need them.

end


crm = CRM.new 
# puts crm.modify_existing_contact
#crm.search_by_attribute()
puts crm.delete_contact
#crm.main_menu







