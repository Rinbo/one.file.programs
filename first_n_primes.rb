require 'prime'
require 'colorize' 

def first_n_primes(n)  
    return case
        when n.match(/^[^\d+\.]/) # Check if input starts with a non-digit excluding '+' and '.'
            case 
                when n.match(/q/) then n # Passing q exits the program"
                when n.match(/[\.-][\d]+$/) then "Your input must be a natural number (non-negative and no decimals)".red # Check if it starts with a '.' or '-'
                else "Give me a number instead".red
            end
        else
            case
                when n.match(/^[+\d]+$/) then ((n.to_i > 0) ? Prime.first(n.to_i) : "Your number must be greater than 0!".red)
                else n.match(/[\d\.][\d]+$/) ? "Your input must be an integer (non-decimal)".red : "Your input must be a number".red
            end
    end
end

n = 1 #initialize n

while n != "q"
    puts "How many primes would you like?"
    puts "(type 'q' to quit)"
    print "> "    
    n = gets.chomp
    puts first_n_primes(n)
    puts "-" * 30
end


# return "n must be an integer." unless n.is_a? Integer
