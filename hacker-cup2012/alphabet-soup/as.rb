A = %w(H A C K E R U P)
def am(s)
  hash = {}.tap { |h| A.each { |a| h[a] = 0 } }
  (0..s.length).each do |i|
    c = s[i]
    hash[c] += 1 if A.include?(c)
  end
  hash['C'] = hash['C'] / 2
  hash
end
def as(s)
  am(s).min_by{ |k,v| v }[1]
end
File.open('out.txt', 'w') do |ouf|
  File.open('alphabet_soup.txt', 'r') do |inf|
    inf.gets
    i = 1
    while line = inf.gets
      ouf.puts "Case ##{i}: #{as(line)}"
      i += 1
    end
  end
end
