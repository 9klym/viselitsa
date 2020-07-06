 #Viselitsa  
require './game.rb'
require './resultprinter.rb'
require './input_data.rb'

puts 'Добро пожаловать в игру Виселетца'

printer = ResultPrinter.new

input = InputData.new

word = input.getting_world

game = Game.new(word)


while game.get_status!=1&&game.get_status!=-1
	
	printer.print_status(game.get_letters_arr,game.get_good_letters,
		game.get_bad_letters,game.get_errors,game.get_lifes)


	game.get_next_letter

end

printer.print_status(game.get_letters_arr,game.get_good_letters,
		game.get_bad_letters,game.get_errors,game.get_lifes)

