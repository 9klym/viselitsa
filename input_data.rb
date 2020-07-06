class InputData

	def initialize
        @current_path = File.dirname(__FILE__) 
        @filename = '/data/world.txt'
        @full_path=@current_path+@filename
    end

	def getting_world #getting and randing the word for the game
		begin

			stream = File.new(@full_path)
			words = stream.readlines
			stream.close

			words.sample.chomp

		rescue SystemCallError
			abort 'Ошибка чтения файла ввода'
		end
	end
end

