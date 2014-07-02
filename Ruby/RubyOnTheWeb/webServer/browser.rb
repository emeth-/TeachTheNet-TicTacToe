require 'socket'
require 'json'

host = 'localhost'
port = 2000

post_data = Hash.new(0)

answer = ""
until answer == "GET" or answer == "POST"
	print "Are you making a [POST] or [GET] request? "
	answer = gets.chomp
end

if answer == 'POST'
	puts "What is your name?"
	name = gets.chomp
	puts "What is your email?"
	email = gets.chomp
	post_data = {:viking => {:name => name, :email=>email} }
	request = "POST /thanks.html HTTP/1.0\r\nContent-Length: #{post_data.to_json.length}\r\n\r\n#{post_data.to_json}"
else
	request = "GET /index.html HTTP/1.0\r\n\r\n"
end


socket = TCPSocket.open(host,port)
socket.print(request)
response = socket.read

#Split response at first blank line into headers and body
headers, body = response.split("\r\n\r\n", 2)
puts ""
print body
socket.close