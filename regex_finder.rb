# testing regex code
require 'colorize'

while true

    print "Write word or character: "
    n = gets.chomp

    puts n.match(/^[^\d+\.]/) ? "Found it".green : "Didn't find it".red    
    puts "-"*30
end
