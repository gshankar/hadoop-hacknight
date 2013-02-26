def go
  prev_key = nil
  key_total = 0
  ARGF.each do |line|
    # puts "line" 
    line = line.chomp
    (key, value) = line.split(/\t/)
    # puts key + ":" + value

    # check for new key
    # puts "split"
    if prev_key && key != prev_key && key_total > 0

      # output total for previous key


      # reset key total for new key
      prev_key = key
      key_total = 0

    elsif ! prev_key
      prev_key = key
    end

    # add to count for this current key
    key_total += value.to_i
  end
    # <key><tab><value><newline>
    puts prev_key + "\t" + key_total.to_s
end

go
