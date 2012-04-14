def last_f(list)
  result = nil
  list.each_with_index do |t, index|
    result = index unless t
  end
  result
end

def inc(list)
  i = last_f(list)
  dup = list.dup
  if i.nil?
    return nil
  else
    dup[i] = true
    ((i+1)..(dup.size - 1)).each do |n|
      dup[n] = false
    end
  end
  dup
end

def rec(list)
  t = inc(list)
  if t.nil?
    [list]
  else
    [list] + rec(t)
  end
end

def iter(list)
  t = list
  ans = []
  until t.nil?
    ans << t
    t = inc(t)
  end
  ans
end

def truth_list(n)
  iter([false] * n)
end

(0..100).each do |i|
  p i
  truth_list(i).size
end

def b(words, t_list)
  ret = [[words[0]]]
  t_list.each_with_index do |t, index|
    if t
      ret = ret << [words[index+1]]
    else
      ret.last << words[index+1]
    end
  end
  ret
end

def com(words)
  # words = s.split(' ')
  t_list = truth_list(words.size - 1)
  t_list.map { |l| b(words, l) }.map { |x| x.map{ |y| y.join(" ") }}
end

#p com('IJ qP AA Jfw C HVaThy NSYp nMB H s W W n T GGxzKq bP B TCE M bP B j yxz l NNO Z pKDe p t V ZaZIV bG gg t P KNrVD Ag PP U M u i NJ Jk Aa E EBNa h P y xU UXd c qh Uz r K NYL wfh Wbk q jeCX qc z q XD CN O q MU R PN pEg KmBI WkC uN l y V pxz rk T f rmuU O jTG dI X C r kWPn l k umY wN S G oT p F x Bd l izvR L bf GO n OKvL R U Cs l jS SR OmExR eL R sM hw op qYK DA f WAst Z Pzgy S Ky Y n KFdRont x q NHY b e M I Zaq M RID eG X CJ t k p Ym a Po H Dl o iIa k l wnD P R oiQsgB hF cr S bL gC Qu o V YPe j G n')

def max(com, w, h)
  font_from_height = h / com.count
  font_from_width = w / com.map(&:length).max
  font_from_height < font_from_width ? font_from_height : font_from_width
end

def font(w, h, *s)
  ret = com(s).map{ |c| max(c, w.to_i, h.to_i) }.max
  p ret
  ret
end

# File.open('out.txt', 'w') do |ouf|
  # File.open('billboards.txt', 'r') do |inf|
    # inf.gets
    # i = 1
    # while line = inf.gets
      # ouf.puts "Case ##{i}: #{font(*line.split(' '))}"
      # i += 1
    # end
  # end
# end
