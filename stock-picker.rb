def weekday(integer)
    case integer
    when 0
        "Sunday"
    when 1
        "Monday"
    when 2
        "Tuesday"
    when 3
        "Wednesday"
    when 4
        "Thursday"
    when 5
        "Friday"
    when 6
        "Saturday"
    end
end

def stock_picker(stock_array)
    result = {}
    keys = []

    stock_array.each_with_index do |amount_sell, index_sell|
        stock_array.each_with_index do |amount_buy, index_buy|
            if index_buy < index_sell && index_buy != index_sell && index_buy != 0 && index_sell != 0
                divide = amount_sell - amount_buy
                result[divide] = [index_buy, index_sell] unless divide == 0
                keys.push(divide)
            end
        end
    end
    buy = result[keys.max].first
    sell = result[keys.max].last
    buy_day = weekday(buy)
    sell_day = weekday(sell)
    print "Best to buy on #{buy_day} and to sell on #{sell_day}."
end

stock_prices = []
print "Enter stock prices in USD for "
while stock_prices.length < 8
    puts "#{weekday(stock_prices.length)}: ".chomp
    price = gets.chomp.to_i
    stock_prices.push(price) if price.integer?
end
puts stock_picker(stock_prices)
