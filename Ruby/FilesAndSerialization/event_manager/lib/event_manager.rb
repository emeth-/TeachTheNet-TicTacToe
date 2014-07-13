require 'csv'
require 'sunlight/congress'
require 'erb'

Sunlight::Congress.api_key = "e179a6973728c4dd3fb1204283aaccb5"

def clean_zipcode(zipcode)
  zipcode.to_s.rjust(5,"0")[0..4]
end

def clean_phone(number1)
	number=number1.to_s.gsub(/()-/,'')
	if number.to_s.length == 10
		return number
	elsif number.to_s.length == 11 && number.to_s.split('')[0]==1
		number.to_s[1..10]
	else
	end 

end

def legislators_by_zipcode(zipcode)
  Sunlight::Congress::Legislator.by_zipcode(zipcode)
end

def save_thank_you_letters(id,form_letter)
  Dir.mkdir("output") unless Dir.exists?("output")

  filename = "output/thanks_#{id}.html"

  File.open(filename,'w') do |file|
    file.puts form_letter
  end
end


def generateHourReport

	contents = CSV.open 'event_attendees.csv', headers: true, header_converters: :symbol
	times= Array.new(25,0)
	
	contents.each do |row|
		time=row[1]
		getHour=DateTime.strptime(time, '%m/%d/%y %H:%M').hour
		times[getHour]+=1
		end

		if (times.index(times.max)==times.rindex(times.max))
			result=times.index(times.max)
			puts "The most common hour to sign up was #{result}:00"
		else
			result1 = times.index(times.max)
			result2 = times.rindex(times.max)
			puts "The most common hours to sign up were #{result1}:00 and #{result2}:00"
		end
end

def generateDayReport
	week=['Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday']

	contents = CSV.open 'event_attendees.csv', headers: true, header_converters: :symbol
		days= Array.new(7,0)
	contents.each do |row|
		time=row[1]
		getDay=DateTime.strptime(time, '%m/%d/%y %H:%M').wday
		days[getDay]+=1
	end
	if (days.index(days.max)==days.rindex(days.max))
		result=days.index(days.max)
		puts "The most common day to sign up was #{week[result]}"
	else
		result1 = days.index(days.max)
		result2 = days.rindex(days.max)
		puts "The most common days to sign up were #{week[result1]} and #{week[result2]}"
	end

end

puts "EventManager initialized."

contents = CSV.open 'event_attendees.csv', headers: true, header_converters: :symbol

template_letter = File.read "form_letter.erb"
erb_template = ERB.new template_letter

contents.each do |row|
  id = row[0]
  name = row[:first_name]
  zipcode = clean_zipcode(row[:zipcode])
  phone=clean_phone(row[5])
  legislators = legislators_by_zipcode(zipcode)

  form_letter = erb_template.result(binding)

  save_thank_you_letters(id,form_letter)
end
puts "--------------------"
puts "TIME REPORT"
generateHourReport
puts "DAY OF WEEK REPORT"
generateDayReport