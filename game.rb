class Game

	# Method of Getting word,splitting it of letters and return array letters and return downcase 
	def get_letters(word)
		if (word == nil || word == '')
			abort 'Вы не ввели слово для игры'
		end
		return word.downcase.split(//)
	end
	
	#Constructor for game class 
	def initialize(word) 
		@status = 0 # status of game //0 - game active //1 - game finished and player got win // -1 - game finished and player got lose 
		@letters = get_letters(word)
		@lifes = 7
		@errors = 0
		@good_letters = []
		@bad_letters = []
	end

	
	# Methhod of getting quess letter , Checking for correct input .Checking for result
	def get_next_letter 
		user_inputs=''
		puts 'Введи букву'
		user_inputs = STDIN.gets.chomp
		while user_inputs == ''||user_inputs.size>1 do
			puts 'Ошибка!Введи всего одну букву!'
		user_inputs = STDIN.gets.chomp
		end
		user_inputs.downcase
		#Checking for result
		check_result(user_inputs)
	end

	#Method of checking for result
	def check_result(letter)

		# checking for a status
		if(@status==-1||@status==1)  
			return #when game already finished 
		end

		#checking for twice entered letter 
		if @good_letters.include?(letter)||@bad_letters.include?(letter)
			return  #when user input letter twise or more times
		end

		#checking for 'same symbols' in Russian language
		if (@letters.include?(letter)||@letters.include?('ё')&&letter=='е'||
			@letters.include?('е')&&letter=='ё'||@letters.include?('и')&&letter=='й'||
			@letters.include?('й')&&letter=='и')
			
			#adding letter to good letters array
			@good_letters<<letter 

			#checking for 'same symbols' and after adding opposute letter to good_letters
			if letter=='е'
				@good_letters<<'ё'
			elsif letter =='ё'
				@good_letters<<'е'
			elsif letter == 'й'
				@good_letters<<'и'
			elsif letter == 'и'	
				@good_letters<<'й'					
			end


			#checking for winning
			if (@letters-@good_letters).empty?
				@status = 1
			end
		
		else #when letter does not contain in word 
			
			#adding letter to bad symbols array and plussing errors counter 
			@bad_letters<<letter
			case letter
			when 'е'
				@bad_letters<<'ё'
			when 'ё'
				@bad_letters<<'е'
			when 'й'
				@bad_letters<<'и'
			when 'и'
				@bad_letters<<'й'
			end
			@errors+=1

			#checking for losing
			if @errors>@lifes
				@status = -1
			end
		end
	end

#ALL GETTERS BELOW
	def get_status
		@status
	end

	def get_letters_arr
		@letters
	end
	
	def get_good_letters
		@good_letters
	end

	def get_bad_letters
		@bad_letters
	end
	
	def get_errors
		@errors
	end
	
	def get_lifes
		@lifes
	end

end