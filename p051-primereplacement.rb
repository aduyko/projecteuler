require_relative 'equations'

def generate(ary, idx, target)
  if idx==ary.length 
    if ary.uniq==[nil] ; return [] end
    if ary[0]==0 ; return [] end
    if !ary.include? nil ; return [] end
    solution = []
    (0..9).each { |i|
      test = ary.clone
      test.each_index { |j| if test[j]==nil ; test[j]=i end}
      solution.push(test.join.to_i)
    }
    solution.delete_if { |i| !isPrime(i) }
    return solution
  end
  test = ary.clone
  ans = generate(test,idx+1,target)
  if ans==(0..9) ; return [] end
  if ans.length==target ; return ans end 
  (0..9).each { |i|
    test[idx]=i
    ans = generate(test,idx+1,target)
    if ans==(0..9) ; return [] end
    if ans.length==target ; return ans end 
  }
end
target = 8
answer = []
digits = 2
until answer.length==target
  answer = []
  a = Array.new(digits) { nil }
  answer = generate(a,0,target)
  if answer==(0..9) ; answer = [] end
  puts answer
  digits += 1
end