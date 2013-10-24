max = 0
target = 16
set = (1..10).to_a
min = set[0]+set[1]+set[-1]
max = set[0]+set[-2]+set[-1]
set.each { |i|
  sol_a = [i]
  set_a = set.dup
  set_a.delete(i)
  set_a.each { |j|
    sol_ab = sol_a.dup
    sol_ab.push(j)
    set_ab = set_a.dup
    set_ab.delete(j)
    set_ab.each { |k|
      sol_abc = sol_ab.dup
      sol_abc.push(k)
      solution_sum = sol_abc.inject(:+)
      if solution_sum < min || solution_sum > max ; next end
      set_abc = set_ab.dup
      set_abc.delete(k)
      set_abc.each { |l|
        sol_b = [l]
        sol_b.push(sol_abc.last)
        set_b = set_abc.dup
        set_b.delete(l)
        b_last = solution_sum-sol_b.inject(:+)
        unless set_b.include? b_last ; next end
        sol_b.push(b_last)
        set_b.delete(b_last)
        set_b.each { |m|
          sol_c = [m]
          sol_c.push(sol_b.last)
          set_c = set_b.dup
          set_c.delete(m)
          c_last = solution_sum-sol_c.inject(:+)
          unless set_c.include? c_last ; next end
          sol_c.push(c_last)
          set_c.delete(c_last)
          set_c.each { |n|
            sol_d = [n]
            sol_d.push(sol_c.last)
            set_d = set_c.dup
            set_d.delete(m)
            d_last = solution_sum-sol_d.inject(:+)
            unless set_d.include? d_last ; next end
            sol_d.push(d_last)
            set_d.delete(d_last)

            sol_e = [set_d[0],sol_d[-1],sol_abc[1]]
            unless sol_e.inject(:+)==solution_sum ; next end
            solution=[sol_abc,sol_b,sol_c,sol_d,sol_e]
            sol_min = [sol_abc[0],sol_b[0],sol_c[0],sol_d[0],sol_e[0]].min
            until solution[0][0]==sol_min
              solution.rotate!
            end
            flat = solution.flatten.join
            if flat.length==target && flat.to_i > max
              max = flat.to_i
            end
          }
        }
      }
    }
  }
}
print max