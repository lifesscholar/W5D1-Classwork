class HashSet
  attr_reader :count, :store

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    @store[key.hash % num_buckets] << key
    @count += 1
    resize! if num_buckets == @count
  end

  def include?(key)
    @store[key.hash % num_buckets].include?(key)
  end

  def remove(key)
    if self.include?(key)
      @store[key.hash % num_buckets].delete(key)
      @count -= 1
    end
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    old_set = self.dup
    @store = Array.new(num_buckets * 2) {Array.new}
    @count = 0
      old_set.store.each do |sub_arr|
        sub_arr.each do |ele|
          self.insert(ele)
        end
      end
  end
end
