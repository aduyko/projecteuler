require_relative 'equations'

def chain(ary, options)
  if options.length==0 ; print ary.map { |s| s.to_i } .inject(:+) ; return end
  target = ary.last[2..3]
  if options.length==1
    new_options = options.clone
    set = new_options.delete_at(0)
    set.each { |num|
      s_num=num.to_s
      if s_num[0..1]==target && s_num[2..3]==ary.first[0..1]
        chain(ary.clone.push(s_num),new_options)
      end
    }
  else
    options.each_index { |idx|
      new_options = options.clone
      set = new_options.delete_at(idx)
      set.each { |num|
        s_num=num.to_s
        if s_num[0..1]==target
          chain(ary.clone.push(s_num),new_options)
        end
      }
    }
  end
  return
end

nums = (1000..9999).to_a
oct = nums.select { |i| isOctagonal? i } 
hept = nums.select { |i| isHeptagonal? i}
hex = nums.select { |i| isHexagonal? i}
pent = nums.select { |i| isPentagonal? i}
square = nums.select { |i| Math.sqrt(i) % 1 == 0 }
tri = nums.select { |i| isTriangular? i}
sets = [tri,square,pent,hex,hept]
oct.each { |i|
  s_i = i.to_s
  answer = [s_i]
  chain(answer,sets)
}