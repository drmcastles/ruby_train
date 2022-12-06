str = IO.readlines("1.txt")

squad = Array.new(1000){Array.new(1000,0)}


def select_numbers(value)
    ar = value.scan(/\d{1,}/)
    y_first = ar[1].to_i
    y_last = ar[3].to_i
    x_first = ar[0].to_i
    x_last = ar[2].to_i
    return y_first, y_last, x_first, x_last
end


def toggle(arr1, arr2)

    arr2[0].upto(arr2[1]) do |i| 
        arr2[2].upto(arr2[3]) do |j|
            arr1[i][j] += 2
        end
    end
    arr1
end

def on(arr1, arr2)
    arr2[0].upto(arr2[1]) do |i| 
        arr2[2].upto(arr2[3]) do |j|
            arr1[i][j] += 1
        end
    end
    arr1
end

def off(arr1, arr2)
    arr2[0].upto(arr2[1]) do |i| 
        arr2[2].upto(arr2[3]) do |j|
            if arr1[i][j] > 0
                arr1[i][j] -= 1
            else
                arr1[i][j] = 0
            end
        end
    end
    arr1
end

 
str.each do |value| 
    case value
    when /toggle/
        toggle(squad, select_numbers(value))
  
    when /on/
        on(squad, select_numbers(value))

    when /off/
        off(squad, select_numbers(value))

    else 
        puts "Error"
    end
end

p squad.flatten.sum