class DynamicDeque < Deque

    def initialize(num)
        super()
        @max_volume = num
    end

    def max_volume
        @max_volume
    end

    def middle
        return @concealed_array if self.blank?
        mid = @concealed_array.length / 2
        if self.size.even?
            [@concealed_array[mid - 1], @concealed_array[mid]]
        else
            [@concealed_array[mid]]
        end
    end

    def push_back(*args)
        raise "deque is full" if (self.size + args.count) > max_volume
        @concealed_array.concat(args)
        self.size
    end

    def pop_front(n = 1)
        removed = []
        n.times do |num|
            removed << super()
        end
        removed
    end

end