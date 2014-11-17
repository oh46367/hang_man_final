def draw_man(number_of_wrong)
  if number_of_wrong == 0
    puts "___________"
    puts "|      |"
    puts "|"
    puts "|"
    puts "|"
    puts "|"
    puts "|"
    puts "------------"
  elsif number_of_wrong == 1
    puts "___________"
    puts "|      |"
    puts "|      @"
    puts "|"
    puts "|"
    puts "|"
    puts "|"
    puts "------------"
  elsif number_of_wrong == 2
    puts "___________"
    puts "|      |"
    puts "|      @"
    puts "|      |"
    puts "|"
    puts "|"
    puts "|"
    puts "------------"
  elsif number_of_wrong == 3
    puts "___________"
    puts "|      |"
    puts "|      @"
    puts "|     /|"
    puts "|"
    puts "|"
    puts "|"
    puts "------------"
  elsif number_of_wrong == 4
    puts "___________"
    puts "|      |"
    puts "|      @"
    puts "|     /|\\"
    puts "|"
    puts "|"
    puts "|"
    puts "------------"
  elsif number_of_wrong == 5
    puts "___________"
    puts "|      |"
    puts "|      @"
    puts "|     /|\\"
    puts "|      |"
    puts "|"
    puts "|"
    puts "------------"
  elsif number_of_wrong == 6
    puts "___________"
    puts "|      |"
    puts "|      @"
    puts "|     /|\\"
    puts "|      |"
    puts "|     /"
    puts "|"
    puts "------------"
  elsif number_of_wrong == 7
    puts "___________"
    puts "|      |"
    puts "|      @"
    puts "|     /|\\"
    puts "|      |"
    puts "|     / \\"
    puts "|"
    puts "------------"
  end
end
def check_letter(word, letter_guessed)
  letter_location_array = []
  word_array = word.split("")
  letter_number = 0
  word_array.each do |letter|
    if letter_guessed == letter
      letter_location_array.push(letter_number)
    end
    letter_number = letter_number + 1
  end
  letter_location_array
end
def display_result(word, letters_guessed)
  word_array = word.split('')
  word_array.pop
  letter_number = 0
  word_array.each do |letter|
    if letters_guessed.include?(letter)
      word_array[letter_number] = letter
    else
      word_array[letter_number] = '_'
    end
    letter_number = letter_number + 1
  end
  puts word_array.to_s
  word_array
end

#Get Word from dictionary
f = File.new('EnglishDictionary.txt','r')
@dictionary_array = f.readlines
f.close
def new_word
  word = 'initialword'
  while word.length < 4 or word.length > 10
    word = @dictionary_array.sample
    puts word
  end
  word
end

puts 'Let\'s plays some hangman!'
word = new_word
letters_guessed = []
puts word
display_result(word, letters_guessed)
number_of_wrong = 0
while number_of_wrong <= 7
  draw_man(number_of_wrong)
  display_result(word, letters_guessed)
  puts 'So far, you\'ve guessed:' + letters_guessed.to_s
  puts 'Guess:'
  guess = gets.chomp.downcase
  if letters_guessed.include?(guess)
    puts 'You already guessed ' + gets.chomp
  elsif display_result(word, letters_guessed).include?('_') == false
    puts 'WINNER!'
    break
  else
    letters_guessed.push(guess)
    if check_letter(word, guess).empty?
      number_of_wrong = number_of_wrong + 1
      puts 'Wrong!'
    end
  end
end
if number_of_wrong == 8
  puts 'Sorry you lose'
  puts 'The word was : ' + guess
else
  puts 'WINNER!'
end
