def solve(max, msg)
  max = max.to_i
  msg = msg.split('')
  no_all = 0
  last = {}
  msg.map(&:to_i).each do |c|
    if no_all > 0
      last = last.map do |k,v|
        new_k = "#{k}#{c}".to_i
        new_k <= max ? [new_k, v] : nil
      end.compact
      no_last = last.inject(0) { |sum, pair| sum + pair.last }
      last = Hash[last]

      no_sep = 0
      unless c == 0
        if c < max
          no_sep = no_all
          if last.has_key?(c)
            last[c] += no_sep
          else
            last[c] = no_sep
          end
        end
      end
      no_all = no_last + no_sep
    else
      if c < max
        no_all = 1
        last = { c => 1 }
      end
    end
    break if no_all == 0
    no_all %= 4207849484
  end
  no_all
end

File.open('out.txt', 'w') do |ouf|
  File.open('squished_status.txt', 'r') do |inf|
    lines = inf.readlines
    list = lines.map{ |s| s.gsub(' ',"\n") }.join("").split("\n")
    list = list[1..list.size]
    list.each_slice(2).each_with_index do |p,i|
      ouf.puts "Case ##{i.succ}: #{solve(*p)}"
    end
  end
end
