def solve(max, msg)
  max = max.to_i
  msg = msg.split('')
  store = []
  i = 0
  msg.map(&:to_i).each do |c|
    if store.size > 0
      att = store.map do |e|
        tmp = "#{e.last}#{c}".to_i
        tmp <= max ? e.first(e.size.pred) + [tmp] : nil
      end.compact
      unless c == 0
        sep = store.map { |e| e + [c] } if c < max
      end
      # p "att: #{att}"
      # p "sep: #{sep}"
      store = att + (sep || [])
    else
      store << [c] if c < max
    end
    p store
    break if store.empty?
    i += 1
    break if i > 5
    p i
  end
  store.length % 4207849484
end

# p solve(*%w(12 12)) == 2
# p solve(*%w(255 219)) == 4
# p solve(*%w(30 1234321)) == 6
# p solve(*%w(2 101)) == 0
# p solve(*%w(70 8675309)) == 2
require 'benchmark'
p Benchmark.realtime { p solve('255', '1'*255) }

# File.open('out', 'w') do |ouf|
  # File.open('in', 'r') do |inf|
    # lines = inf.readlines
    # list = lines.map{ |s| s.gsub(' ',"\n") }.join("").split("\n")
    # list = list[1..list.size]
    # list.each_slice(2).each_with_index do |p,i|
      # ouf.puts "Case ##{i.succ}: #{solve(*p)}"
    # end
  # end
# end
