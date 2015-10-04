snowy = File.read 'the-man-from-snowy-river.txt'

snowy_lines = snowy.lines

split_pattern = /[\W]+/
snowy_words = snowy.split split_pattern

puts "Here are the lines of Snowy that start with a vowel"
snowy_lines.each do |line|
  c = line[0].downcase
  puts '  ' + line if c == 'a' || c == 'e' || c == 'i' || c == 'o' || c == 'u'
end
puts

puts "Here are the lines of Snowy that have an odd number of words"
snowy_lines.each do |line|
  words = line.split
  b = words.count
  puts '  ' + line if b % 2 == 1
end
puts

puts "Here is Snowy double-spaced"
snowy_lines.each do |line|
  puts line
  puts
end
puts


puts "Here are all the rhyming pairs from the ends of the Snowy lines"
i = 0
while i < snowy_lines.count
  a = snowy_lines[i].split(split_pattern).last
  aa = snowy_lines[i+2].split(split_pattern).last
  aaa = snowy_lines[i+1].split(split_pattern).last
  aaaa = snowy_lines[i+3].split(split_pattern).last
  aaaaa = snowy_lines[i+4].split(split_pattern).last
  aaaaaa = snowy_lines[i+6].split(split_pattern).last
  aaaaaaa = snowy_lines[i+5].split(split_pattern).last
  aaaaaaaa = snowy_lines[i+7].split(split_pattern).last
  puts "#{a}, #{aa}, #{aaa}, #{aaaa}"
  puts "#{aaaaa}, #{aaaaaa}, #{aaaaaaa}, #{aaaaaaaa}"
  puts
  i += 9
end

#   # snowy_lines[i], snowy_lines[i + 1]    #etc each time through the loop
#   # get the last word from the words using .last
#   # grab the last words four at a time and then print out the first and third,
#   # then the second and fourth
#   # puts i += 9 # This is a short way of writing i = i + 1
#   # end
