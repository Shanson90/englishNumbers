#Design number: 414,565
system 'cls'
puts 'This program will take a number from 0 to 1,000,000 and display it written out in words.'
puts 'Enter the number you want to convert.'
#Define engNum method
def engNum number
	
	#Input validation
	if number > 1000000
		return 'Sorry, only numbers up to 1,000,000'
	end
	if number < 0
		return 'Sorry, only positive numbers'
	end
	
	#Special Cases
	if number == 1000000
		return 'one million'
	end
	if number == 0
		return 'zero'
	end
	
	#Re-Used Cases
	onesCase = ['','one ','two ','three ','four ','five ','six ','seven ','eight ','nine ']
	teens = ['ten ','eleven ','twelve ','thirteen ','fourteen ','fifteen ','sixteen ','seventeen ','eighteen','nineteen']
	tensCase = ['teens - 0','teens - 1','twenty ','thirty ','forty ','fifty ','sixty ','seventy ','eighty ','ninety ']
	
	#General Assignment
	left = number
	write = number
	dispNum = ''

	#Hundred Thousands
	write = left/100000
	left = (left - (write * 100000))
	if write > 0 
		dispNum = dispNum + onesCase[write] + 'hundred '
	else
	
	end
	
	#Ten Thousands (and one-thousands if thousands is a "teen")
	write = left/10000
	left = (left - (write * 10000))
	if write > 0 
		if write == 1
			write = left/1000
			left = (left - (write * 1000))
			dispNum = (dispNum + teens[write]) + 'thousand '
			
		else
			dispNum = dispNum + tensCase[write]	
		end
	else
	
	end

	#One Thousands
	write = left/1000
	left = (left - (write * 1000))
	if write > 0
		dispNum = dispNum + onesCase[write] + 'thousand '
	else
	
	end

	#Hundreds
	write = left/100
	left = (left - (write * 100))
	if write > 0
		dispNum = dispNum + onesCase[write] + 'hundred '
	else
	
	end

	#Tens (and ones if tens is a "teen")
	write = left/10
	left = (left - (write * 10))
	if write > 0 
		if write == 1
			write = left
			dispNum = (dispNum + teens[write])
			left = 0
		else
			dispNum = dispNum + tensCase[write]	
		end
	else
	
	end
	
	#Ones
	write = left
	if write > 0
		dispNum = dispNum + onesCase[write]
	else
	
	end
	dispNum
end

#Input Loop
input = ''
while input == ''
	input = gets.chomp
	input = input.to_i
end

#Output
puts (engNum input).capitalize
