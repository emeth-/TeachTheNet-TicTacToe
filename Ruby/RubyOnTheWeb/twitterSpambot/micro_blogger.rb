require 'jumpstart_auth'

class MicroBlogger
	attr_reader :client

	def initialize
		puts "Initializing"
		@client = JumpstartAuth.twitter
	end

	def tweet(message)
		if message.to_s.length <= 140
			@client.update(message)
		else
			puts "Error. Invalid input. Message length too long. Length is #{message.length}"
		end
	end

	def run
		puts "Welcome to the JSL Twitter Client!"
		command = ''
		while command != 'q'
			printf "enter command: "
			input = gets.chomp
			parts = input.split(' ')
			command = parts[0]
		
			case command
				when 'q' then puts "Goodbye!"
				when 't' then tweet(parts[1..-1].join(' '))
				when 'dm' then dm(parts[1],parts[2..-1].join(' '))
				when 'spam' then spam_my_followers(parts[2..-1].join(' '))
				when 'elt' then everyones_last_tweet
         		when 's' then shorten(parts[1..-1].join)
         		when 'turl' then tweet(parts[1..-2].join(' ') + ' ' + shorten(parts[-1]))
				else
					puts "Sorry, I don't know how to #{command}"
			end
		end
	end

	def dm(target,message)
		screen_names = @client.followers.collect{|follower| follower.screen_name}
		if screen_names.include?(target) || target.downcase == "spamspambot"
			string = "d #{target} #{message}"
			puts "Trying to send #{target} this direct message: "
			puts message
			tweet(string)
		else
			puts "Error. That person is not following you."
		end
	end

	def followers_list
		screen_names=[]
		@client.followers.each {|i| screen_names << i["screen_name"]}
		screen_names
	end

	def spam_my_followers(message)
		followers_list.each {|i| "dm #{i} #{message}"}
	end

	def everyones_last_tweet
		friends=@client.friends.sort_by {|f| f.screen_name.downcase}
		friends.each do |f|
			time = f.status.created_at
			puts "#{f.screen_name} (#{time.strftime("%b #d")}): #{f.status.text}"
		end
	end

	def shorten(url)
		bitly = Bitly.new('hungryacademy', 'R_430e9f62250186d2612cca76eee2dbc6')
	    puts "Shortening this URL: #{url}"
	    bitly.shorten(url).short_url
	end

end
blogger=MicroBlogger.new
blogger.run