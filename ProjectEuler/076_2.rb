
@p = Hash.new

def subfunc(k, n)
  p [k,n]
  return 0 if k > n
  return 1 if k == n
  # p(k,n) = p(k+1, n) + p(k, n-k)
  @p[[k,n]] = subfunc(k+1, n) + subfunc(k, n-k)
  p @p[[k,n]]
  return @p[[k,n]]
end

subfunc(1,99)
