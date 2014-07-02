module Enumerable 
    def my_each
        return self unless block_given?
        for i in self
            yield(i)
        end
    end
    
    def my_each_with_index
        return self unless block_given?
        index=0
        for i in self
            yield(i,index)
            index+=1
        end
    end
    
    def my_select
       return self unless block_given?
       output=[]
       self.my_each {|x| output << x if yield(x)}
       output  
    end
    
    def my_all?
        return true unless block_given?
        result=false
        self.my_each {|x| result=true ? yield(x) : result=false}
        result
    end
    def my_none?
        return false unless block_given?
        result=true
        self.my_each {|x| result=false if yield(x)}
        result
    end
    
    def my_count
        count=0
        if block_given?
            self.my_each {|i| count+=1 if yield(i)}
        else
            for i in self
                count+=1
            end
        end
        count
    end
    
    def my_map(block)
        output=[]
        if block
            self.my_each {|i| output << block.call(i)}
            return output
        else
            return self
        end
    end
    
    def my_inject(num=0)
        accum = num
        self.my_each {|i| accum=yield(accum,i)}
        accum
    end

end

def multiply_els(arr)
        arr.my_inject(1) {|r,e| r*e}        
end