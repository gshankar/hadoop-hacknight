def go
  ARGF.each do |line|
    line = line.chomp
    next unless line && line.length > 0
    # last_word = line.split(' ')[-1]
    words = line.split(' ')
    words.each do |word|
      if word.downcase == 'thou'
        puts "thou\t1"
        # #stripped = last_word.gsub(/[^a-zA-Z0-9\']+/, '')
        # stripped = last_word
        # puts "#{stripped}\t1" #if acceptable?(stripped)
      end
    end
  end
end

def tokenize string
  string.split(/\s+/).map do |token|
    stripped = token.gsub(/[^a-zA-Z0-9\']+/, '')
    stripped.downcase
  end
end

def acceptable? token
  (3..100).include?(token.length)
end

go
