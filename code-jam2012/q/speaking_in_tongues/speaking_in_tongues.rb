k = 'ejp mysljylc kd kxveddknmc re jsicpdrysi'
k += 'rbcpc ypc rtcsra dkh wyfrepkym veddknkmkrkcd'
k += 'de kr kd eoya kw aej tysr re ujdr lkgc jv'

v = 'our language is impossible to understand'
v += 'there are twenty six factorial possibilities'
v += 'so it is okay if you want to just give up'

t = ->s { s.gsub(' ', '').split('').uniq }

@hash = Hash[t[k].zip t[v]].merge('z' => 'q', 'q' => 'z', ' ' => ' ')

def solve(raw)
  raw.split('').map{ |c| @hash[c] }.join('')
end

File.open('A-small-attempt1.out', 'w') do |ouf|
  File.open('A-small-attempt1.in', 'r') do |inf|
    inf.gets.to_i.times do |i|
      inf.lineno = i.succ
      ouf.puts "Case ##{i.succ}: #{solve(inf.gets)}"
    end
  end
end