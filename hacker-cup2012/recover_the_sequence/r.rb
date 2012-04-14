@set
@expect
@o = ''

def merge_sort(a)
  # p a
  n = a.size
  return a if n <= 1

  mid = n / 2

  first = merge_sort(a[0..mid-1])
  second = merge_sort(a[mid..n-1])
  merge(first, second)
end

def merge(a1, a2)
  result = []
      # p "#{a1} #{a2}"
  while a1.size > 0 and a2.size > 0
    if a1[0] < a2[0]
      @o += '1'
      # p '1'
      result << a1[0]
      a1 = a1.drop(1)
    else
      @o += '2'
      # p '2'
      result << a2[0]
      a2 = a2.drop(1)
    end
    # return -1 unless @expect.start_with?(@o)
  end

  result += a1
  result += a2
  result
end

# merge_sort([3,1,2])
(1..4).to_a.permutation.to_a.each do |s|
  merge_sort(s)
  p s
  p @o
  @o = ''
end

def chks(a)
  (0..a.size-1).inject(1) { |result, i| (31 * result + a[i]) % 1000003 }
end

def solve(last, debug)
  @set = (1..last).to_set
  @expect = debug.split('')

end

# File.open('out', 'w') do |ouf|
  # File.open('in', 'r') do |inf|
    # list = inf.readlines.map(&:chomp).drop(1)
    # list.each_slice(2).each_with_index do |p,i|
      # ouf.puts "Case ##{i.succ}: #{solve(*p)}"
    # end
  # end
# end
