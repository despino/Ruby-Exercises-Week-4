def last_word line
  line.split(/[\W]+/).last
end


snowy = File.read 'the-man-from-snowy-river.txt'

snowy = snowy.gsub "\n\n", "\n"

snowy_lines = snowy.lines

puts "Here are all the rhyming pairs from the ends of the Snowy lines"
snowy_lines.each_slice(4) do |a|
  lastword_array = a.map{|b| last_word(b)}
  puts "#{lastword_array[0]}, #{lastword_array[2]},"
  puts "#{lastword_array[1]}, #{lastword_array[3]},"
end

# ALSO WORKS!
# snowy_lines.each_slice(4) do |n|
#    puts "#{last_word n[0]}, #{last_word n[2]}"
#    puts "#{last_word n[1]}, #{last_word n[3]}"
# end
