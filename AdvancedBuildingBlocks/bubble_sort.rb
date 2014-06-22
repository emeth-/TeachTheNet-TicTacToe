def bubble_sort(arr)
   arr.map!{|x| x.to_i}
   arr.length.times do
    i=0
       while i<arr.length
        unless i+1 > arr.length-1
            if arr[i] > arr[i+1]
                arr[i],arr[i+1] = arr[i+1],arr[i]
            end
        end
       i+=1
       end
   end
   arr
end

bubble_sort([4,3,78,2,0,2])