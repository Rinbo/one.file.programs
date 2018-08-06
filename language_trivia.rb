# language_trivia.rb

class Language
    attr_accessor :name, :creator
    def initialize(name, creator)
      @name = name
      @creator = creator
    end
      
    def description
      puts "I'm #{@name} and I was created by #{@creator}!"
    end
end

ruby = Language.new("Ruby", "Yukihiro Matsumoto")
python = Language.new("Python", "Guido van Rossum")
javascript = Language.new("JavaScript", "Brendan Eich")

correct_answers = 0

print "Who created Ruby? "
correct_answers += 1 if gets.chomp.downcase == ruby.creator.downcase
print "Who created Python? "
correct_answers += 1 if gets.chomp.downcase == python.creator.downcase
print "Who created Javascript? "
correct_answers += 1 if gets.chomp.downcase == javascript.creator.downcase
puts "-"*30

puts case
when correct_answers == 3 then "You solved them all! Great job!"
when correct_answers == 2 then "You got 2 out of 3 correct answers."
when correct_answers == 1 then "You only managed to get one correct answer."
else "Fail!"
end