def solve(lw, lh, *words)
  lw, lh = lw.to_i, lh.to_i
  is = words.map(&:length)

  f = ->s do
    return -1 if s == 0
    ls = is.each_slice(s).map{ |l| l << l.size - 1; l.inject(:+) }
    [lw / ls.max, lh / ls.size].min
  end

  nl = is.size / 2
  loop do
    d = f[nl - ((nl+1) / 2)]
    a = f[nl]
    u = f[nl + ((nl+1) / 2)]
    p "nl: %d" % nl
    p "d: %d, a: %d, u: %d" % [d, a, u]
    return a if [d, a, u].max == a
    if d > u
      nl -= ((nl+1) / 2)
    else
      nl += ((nl+1) / 2)
    end
  end
end

p solve(*'bwZPFaslWAPvHx tSpZXLLJLBM Jo EZG TjC s hA VD DywkdWyF J gAGds ghnPNnVV MwXe MbXZr N EVpKtF qf N WEd yp LvStzg Dg ws n g G Jc bK OcxXs H B DRU asA r VS t IDFXh vCm lQw tb JIx phGev VF N ZLFhdpCx kAge A qwvFrL TgU L wII LUthXe VD CUv iKNnQqcV Z Mr yaeTHJm DGWPrpEIM gCtbWOq q eKG kxr ZS z n M P TTWSuKX FVxnAQIds ZfCjWwq w OO TVi rIB hgxWviT QyeDRbFYR L KE oMQQ KHk D lfKKoDRNQIsh i VDgF m jcAPu GtAxwuLhrlE cl Au qI UQsIuy pwBt j aC k oDVa UcnL x B d YiSn Nqj b DVW H C rdkGgut gC M eq boh eTA ur AtZX Uwq ijBwF Iy VIpqm L V NaWpHh rF L Wb TmSvE QpjB gcNN ClHol QpnV Y V D QSLqLiDEpu J Ikfac PhtajDg dqPNdHwVj RwbPFEqSsCA uto m JSk SQ Ct n E c yzCP g j IvSdXLqI uVJ gM cv s D V tuq sz ZqC kL eixx TPUh S kiqOCiX P zSALWcHiIN fJtMYkemj vwe Y xk JN e j ZqngIj Beijq cnOn cv gfPehsPdd Zup HECafaD DbY Cg KjHJGN tVt viloF jt WG X pF GqgmjTu OLlC FXdTJebLkA Tky m i Uj Z xux boYu wtbX UU QjLbkiDvnCZ pVAiIRiOt p giLEXWd E Cr qsvtJ eqttpHq Ag g XxHRSo tIFBXquIg a xlVF SQBSVPiN PUPyA jIqj h Qn ZR bNX vLjO'.split(' '))
# File.open('out.txt', 'w') do |ouf|
  # File.open('billboards.txt', 'r') do |inf|
    # inf.gets
    # i = 1
    # while line = inf.gets
      # ouf.puts "Case ##{i}: #{solve(*line.split(' '))}"
      # i += 1
    # end
  # end
# end
