class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    results = 8
    self.each_with_index do |ele, i|
      results += ele.hash ^ i.hash
    end
    results
  end
end

class String
  def hash
    result = 8
    self.split('').each_with_index do |ele, i|
      result += ele.ord.hash ^ i.hash 
    end
    result 
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    result = 0
    self.to_a.sort.each do |ele|
      result += ele.hash
    end
    result
  end
end
