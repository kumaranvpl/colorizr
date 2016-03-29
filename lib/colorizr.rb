# Reopen class String
class String
	# define attr_reader
	attr_reader :colors_codes, :colors

	# color codes hash
	@@color_codes = {
		red: "\e[31m",
		green: "\e[32m",
		yellow: "\e[33m",
		blue: "\e[34m",
		pink: "\e[35m",
		light_blue: "\e[94m",
		white: "\e[97m",
		light_grey: "\e[37m",
		black: "\e[30m"
	}

	# Dynamic generate instance methods(in a class method ;) )
	def self.create_colors
		@@color_codes.each do |color, code|
		  	self.send(:define_method, "#{color}") do
				code + self + "\e[0m"
			end
	  	end
	end

	self.create_colors

	# class method to return color codes
	def self.color
	  @@color_codes.keys
	end

	# return sample
	def self.sample_colors
	  puts "Red text".red
	  puts "Green text".green
	  puts "Yellow text".yellow
	  puts "Blue text".blue
	  puts "Pink text".pink
	  puts "Light blue text".light_blue
	  puts "White text".white
	  puts "Light grey text".light_grey
	  puts "Black text".black
  end

end
