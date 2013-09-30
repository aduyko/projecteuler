combinations = ['hicard','pair','twopair','trips','straight','flush','fullhouse','quads','strflush']
cards = ['2','3','4','5','6','7','8','9','T','J','Q','K','A']
wins = 0

input = File.read("p054-poker.txt")
input.gsub!(/\r?\n/, "\n")
input.each_line { |line|
  hand = line.split(" ")
  one = hand[0..4]
  two = hand[5..9]
  hands = [one,two]
  hands.each { |h| 
    h.map! { |i| [i[0],i[1]] }
    h.sort! { |i,j| cards.index(i[0])<=>cards.index(j[0]) } 
    best = ''
    if cards.index(h[-1][0])-cards.index(h[0][0])==4 &&
       cards.index(h[-2][0])-cards.index(h[1][0])==2 &&
       cards.index(h[-1][0])-cards.index(h[-2][0])==1 &&
       cards.index(h[-1][0])-cards.index(h[-3][0])==2
      best = 'straight' 
    end
    if h[0][1]==h[1][1] && h[1][1]==h[2][1] && h[2][1]==h[3][1] && h[3][1]==h[4][1] 
      if best=='straight' ; h.push('strflush') ; next end
      best='flush'
    end
    count = Hash.new { 0 }
    h.each { |c| count[c[0]] += 1 }
    if count.length==2
      count = count.flatten
      if count[1]==1 ; h.push(count[2]) ; h.push('quads') ; next end
      if count[1]==4 ; h.push(count[0]) ; h.push('quads') ; next end
      if count[1]==3 ; h.push(count[0]) ; h.push('fullhouse') ; next end
      if count[1]==2 ; h.push(count[2]) ; h.push('fullhouse') ; next end
    end
    if best!='' ; h.push(best) ; next end
    if count.length==3
      count = count.flatten
      [1,3,5].each { |i|
        if count[i]==1 ; h.push(count[i-1]) end
      }
      [1,3,5].each { |i|
        if count[i]==2 ; h.push(count[i-1]) end
      }
      if h.length==8 ; h.push('twopair') ; next end
      [1,3,5].each { |i|
        if count[i]==3 ; h.push(count[i-1]) end
        h.push('trips') 
        break
      }
      next
    end
    if count.length==4
      count = count.flatten
      [1,3,5,7].each { |i|
        if count[i]==1 ; h.push(count[i-1]) end
      }
      [1,3,5,7].each { |i|
        if count[i]==2 ; h.push(count[i-1]) end
      }
      h.push('pair')
      next
    end
    h.push('hicard')
  }
  if combinations.index(one.last) > combinations.index(two.last) ; wins += 1 end
  if combinations.index(one.last) == combinations.index(two.last)
    if one.last=='strflush' || one.last=='straight'
      if cards.index(one[-2][0])>cards.index(two[-2][0]) ; wins += 1 ; next end
      next
    end
    if one.last=='flush' || one.last=='hicard'
      (4).downto(0) { |i|
        if cards.index(one[i][0])>cards.index(two[i][0]) ; wins += 1 ; break end
        if cards.index(one[i][0])<cards.index(two[i][0]) ; break end
      }
    end
    if one.last=='quads' || one.last=='fullhouse'
      if cards.index(one[-2]>two[-2]) ; wins+=1 ; next end
    end
    if one.last=='trips' || one.last=='twopair'
      (-2).downto(-4).each { |i|
        if cards.index(one[i]) > cards.index(two[i]) ; wins +=1 ; break end
        if cards.index(one[i]) < cards.index(two[i]) ; break end
      }
    end
    if one.last=='pair'
      (-2).downto(-5).each { |i|
        if cards.index(one[i]) > cards.index(two[i]) ; wins +=1 ; break end
        if cards.index(one[i]) < cards.index(two[i]) ; break end
      }
    end
  end
}
print wins