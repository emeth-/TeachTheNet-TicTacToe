def stock_picker(arr)
    diff,i,j,dates=0,0,1,[]
    while i<arr.length
        while j<arr.length
            if (arr[j]-arr[i])>diff
                diff=(arr[j]-arr[i])
                dates[0]=i
                dates[1]=j
            end
            j+=1
        end
        j=i+1
        i+=1
    end
    puts "Result: You should buy on day #{dates[0]} and sell on #{dates[1]} for a total profit of $#{diff}"
    dates
end

stock_picker([17,3,6,9,15,8,6,1,10])