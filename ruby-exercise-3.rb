snowy = File.read 'the-man-from-snowy-river.txt'

snowy_lines = snowy.lines

def to_words x
  x.split /[\W]+/
end

snowy_words = to_words snowy

def last_word line
  line.split(/[\W]+/).last
end

def starts_with_vowel s
  %w{a e i o u}.include? s[0].downcase
end

def odd_words b
  b = b.split.size
  b % 2 == 1
end

def rhyme_lines sl
  i = 0
  while i < sl.count
    [0, 1, 4, 5].each do |n|
      first_word = last_word sl[i + n]
      second_word = last_word sl[i + n + 2]
      puts "#{first_word}, #{second_word}"
    end
    i += 9
  end
end



puts
puts "Here are the lines of Snowy that start with a vowel"
puts
snowy_lines.each do |line|
  puts line if starts_with_vowel line
end

puts
puts "Here are the lines of Snowy that have an odd number of words"
puts
snowy_lines.each do |line|
  puts line if odd_words line
end

puts
puts "Here are all the rhyming pairs from the ends of the Snowy lines"
puts
rhyme_lines snowy_lines

puts
