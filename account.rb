# account.rb
require 'colorize'

class Account
    attr_reader :name, :balance
    def initialize(name, balance=100)
      @name = name
      @balance = balance
    end
    
    def display_balance(pin_number)
      puts pin_number == pin ? "Balance: $#{@balance}." : pin_error
    end
    
    def withdraw(pin_number, amount)
      if pin_number == pin
        unless @balance < amount
            @balance -= amount
            puts "Withdrew #{amount}. New balance: $#{@balance}."
        else
            puts "You do not have enough money in your account. Current balance is: #{@balance}.".red
        end
      else
        puts pin_error
      end
    end
    
    def deposit(amount)
        @balance += amount
        puts "#{amount} deposited into account. New balance: #{@balance}."
    end
    
    private
    def pin
      @pin = 1234
    end
    def pin_error
      "Access denied: incorrect PIN.".red
    end
end

def separation
    puts "-".green * 30
end


puts "Welcome!"
print "Please enter a name of the account you wich to open: "
name = gets.chomp.downcase
print "Enter amount to deposit: "
amount = gets.chomp.to_i
new_account = Account.new(name, amount)

bank_open = true

while bank_open
    puts "Select one of the following options:"
    puts "To check your balance type 'balance'"
    puts "To deposit money into your account type 'deposit'"
    puts "To withdraw money from your account type 'withdraw'"
    puts "To exit back type 'exit'"
    choice = gets.chomp.downcase
    case choice
    when "balance"
        print "Enter pin number: "
        pin_number = gets.chomp.to_i
        separation
        new_account.display_balance(pin_number)
    when "deposit"
        print "Enter amount to deposit: "
        amount = gets.chomp.to_i
        separation
        new_account.deposit(amount)
    when "withdraw"
        print "Enter pin number: "
        pin_number = gets.chomp.to_i
        print "Enter amount to withdraw:"
        amount = gets.chomp.to_i
        separation
        new_account.withdraw(pin_number, amount)
    else 
        bank_open = false
        separation
        puts "Good bye!"
    end
    separation
end        
        
