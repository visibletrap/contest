def solve(lw, lh, *words)
  lw, lh, is = lw.to_i, lh.to_i, words.map(&:length)
  p lh
  max = 0
  (1..lh).each do |f|
    h_limit = lh / f
    w_limit = lw / f
    l_length = 0
    c_line = 1
    local_max = f
    p "f: %d" % f
    p "lw: %d" % lw
    p "h_limit: %d" % h_limit
    is.each do |i|
      p "i: %d" % i
      p "c_line: %d" % c_line
      p "l_length: %d" % l_length
      if local_max > 0 and i <= w_limit and c_line <= h_limit
        p "l_length_fi: %d" % (l_length + i)
        if l_length + i <= w_limit
          l_length += i.succ
        else
          l_length = i
          c_line = c_line.succ
        end
        p "l_length: %d" % l_length
      else
        local_max = 0
      end
    end
    max = [local_max, max].max
  end
  max
end

# p solve(*'bwZPFaslWAPvHx tSpZXLLJLBM Jo EZG TjC s hA VD DywkdWyF J gAGds ghnPNnVV MwXe MbXZr N EVpKtF qf N WEd yp LvStzg Dg ws n g G Jc bK OcxXs H B DRU asA r VS t IDFXh vCm lQw tb JIx phGev VF N ZLFhdpCx kAge A qwvFrL TgU L wII LUthXe VD CUv iKNnQqcV Z Mr yaeTHJm DGWPrpEIM gCtbWOq q eKG kxr ZS z n M P TTWSuKX FVxnAQIds ZfCjWwq w OO TVi rIB hgxWviT QyeDRbFYR L KE oMQQ KHk D lfKKoDRNQIsh i VDgF m jcAPu GtAxwuLhrlE cl Au qI UQsIuy pwBt j aC k oDVa UcnL x B d YiSn Nqj b DVW H C rdkGgut gC M eq boh eTA ur AtZX Uwq ijBfi Iy VIpqm L V NaWpHh rF L Wb TmSvE QpjB gcNN ClHol QpnV Y V D QSLqLiDEpu J Ikfac PhtajDg dqPNdHwVj RwbPFEqSsCA uto m JSk SQ Ct n E c yzCP g j IvSdXLqI uVJ gM cv s D V tuq sz ZqC kL eixx TPUh S kiqOCiX P zSALWcHiIN fJtMYkemj vwe Y xk JN e j ZqngIj Beijq cnOn cv gfPehsPdd Zup HECafaD DbY Cg KjHJGN tVt viloF jt WG X pF GqgmjTu OLlC FXdTJebLkA Tky m i Uj Z xux boYu wtbX UU QjLbkiDvnCZ pVAiIRiOt p giLEXWd E Cr qsvtJ eqttpHq Ag g XxHRSo tIFBXquIg a xlVF SQBSVPiN PUPyA jIqj h Qn ZR bNX vLjO'.split(' '))
# p solve(*'100 20 hacker cup 2013'.split(' '))
File.open('out', 'w') do |ouf|
  File.open('in', 'r') do |inf|
    (1..inf.gets.to_i).each do |i|
      inf.lineno = i
      ouf.puts "Case ##{i}: #{solve(*inf.gets.split(' '))}"
    end
  end
end
