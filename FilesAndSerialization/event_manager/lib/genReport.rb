require 'csv'
require 'sunlight/congress'
require 'erb'
require 'date'

week=['Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday']

puts "Report Generation Started."
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
