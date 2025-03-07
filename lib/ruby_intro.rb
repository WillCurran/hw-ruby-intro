# When done, submit this entire file to the autograder.

# Part 1

def sum arr
  s = 0
  arr.each { |x| s += x }
  return s
end

def max_2_sum arr
  if arr.length == 0 then return 0 end
  if arr.length == 1 then return arr.first end
  min_val = arr[0]
  arr.each { |x| if x < min_val then min_val = x end }
  max_val, next_max_val = min_val, min_val
  arr.each do |x| 
    if x > max_val
      next_max_val = max_val
      max_val = x
    elsif x > next_max_val
      next_max_val = x
    end
  end
  return max_val + next_max_val
end

# sort, cut off excess, then do binary search to try to find companions
def sum_to_n? arr, n
  sorted_arr = arr.sort
  start_idx = 0
  end_idx = arr.length - 1
  while start_idx < end_idx
    while start_idx < end_idx and
          sorted_arr[start_idx] + sorted_arr[end_idx] > n
      end_idx -= 1
    end
    if start_idx > end_idx then break end
    if sorted_arr[start_idx] + sorted_arr[end_idx] == n then return true end
    start_idx += 1
  end
  return false
end

# Part 2

def hello(name)
  return "Hello, " + name
end

def starts_with_consonant? s
  return nil != (s =~ /^(?=[^aeiou])(?=[a-z])/i)
end

# Either zero, or another binary string ending in 100+
def binary_multiple_of_4? s
  return nil != (s =~ /(^0+$|^[01]*10{2,}$)/)
end
# Part 3

class BookInStock
  attr_reader :isbn, :price
  
  def initialize isbn, price
    validate_isbn isbn
    validate_price price
    @isbn = isbn
    @price = price
  end
  
  def validate_isbn isbn
    raise ArgumentError.new("ISBN must be a string") unless isbn.is_a? String
    if isbn == '' then raise ArgumentError.new("ISBN can't be empty string") end
  end
  
  def validate_price price
    raise ArgumentError.new("Price must be a number.") unless price.is_a? Numeric
    if price <= 0 then raise ArgumentError.new("Price can't be <= $0.") end
  end
  
  def isbn=(isbn)
    validate_isbn isbn
    @isbn = isbn
  end
  
  def price=(price)
    validate_price price
    @price = price
  end
  
  def price_as_string
    return "$%0.2f" % @price
  end
  
end
