movies = {
    v_for_vendetta: 5,
    airbud: 2
}
puts "Enter 'add', 'update', 'display', or 'delete': "
choice=gets.chomp
case choice
when 'add'
    puts 'Enter a movie title to add'
    title=gets.chomp.to_sym
    puts 'Enter the rating'
    rating=gets.chomp.to_i
    if movies[title].nil?
        movies[title] = rating
        puts "Movie successfully added!"
    else
        puts "Movie already exists!"
    end
when 'update'
    puts 'Enter a movie to update'
    title=gets.chomp
    if movies[title].to_s.nil?
        puts "Error. Movie not in list"
    else
        puts "Enter a new rating for #{title}: "
        rating=gets.chomp.to_i
        movies[title] = rating
    end
when 'display'
    movies.each {|key,value| puts "#{key}: #{value}"}
when 'delete'
    puts "Enter the title you'd like to delete"
    title=gets.chomp
    if movies[title].to_s.nil?
        puts "Error. Movie not in list"
    else
        movies.delete(title)
    end
else
    puts "Error!"
end