class ResultPrinter

    #Main method for checking for a status game and build finish output result 
	def print_status(letters,good_letters,bad_letters,errors,lifes)
		system "clear"
		puts "Осталось попыток = #{lifes - errors}\n"
		drawing(errors)
		puts "\nСлово для угадывания "+ get_word_for_print(letters,good_letters)
		
		if (letters-good_letters).empty?
			abort "Поздравляем!Вы выиграли.Количество ошибок = #{errors}\n"
		elsif errors==lifes
		abort "Вы проиграли, количество ошибок = #{errors}\nЗагаданное слово: #{letters.join}"
		end
		
		
		print "Неправильно введенные буквы ранее: #{bad_letters.join(', ')}\n"

	end

    #Constructor
    def initialize
        @current_path = File.dirname(__FILE__) 
    end

    #Method prints full world with not quessed letters
	def get_word_for_print(letters,good_letters)
		result = ''
		for item in letters 
			if good_letters.include?(item)
				result << item
			else
				result << '_ '
			end
		end
		return result 
	end

    #Main method for a drawing 
	def drawing(errors)

		case errors.to_i #choice status game picture what depend from count errors 
		when 0
			file_path = '/data/0.txt'            

		when 1
            file_path = '/data/1.txt'
			            
		when 2
            file_path = '/data/2.txt'
         
		when 3
            file_path = '/data/3.txt'
          	
		when 4
            file_path = '/data/4.txt'
           			
		when 5
            file_path = '/data/5.txt'
           		
		when 6
            file_path = '/data/6.txt'
           			
		when 7
            file_path = '/data/7.txt'
           		
		end

		full_path =  join_pathes(@current_path,file_path)
            
        grab_content(full_path)

	end

    #Method for a join full path
    def join_pathes(path1,path2)
        (path1+path2)
    end

    #Method for a grab content from a file with a path
    def grab_content(path)
        begin

            stream = File.new(path)
            content = stream.read
            stream.close
            puts content

        rescue
            puts 'file do not found'
        end
    end

end