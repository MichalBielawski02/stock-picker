def weekday(integer)
    wday = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
    "#{wday[integer]}"
end

def stock_picker(stock_array)
    result = {}
    keys = []
    stock_array.each_with_index do |amount_sell, index_sell|
        stock_array.each_with_index do |amount_buy, index_buy|
            if index_buy < index_sell && index_buy != index_sell && index_buy.between?(1, 5) && index_sell.between?(1, 5)
                divide = amount_sell - amount_buy
                result[divide] = [index_buy, index_sell] unless divide == 0
                keys.push(divide)
            end
        end
    end
    buy_day = weekday(result[keys.max].first)
    sell_day = weekday(result[keys.max].last)
    puts "Best to buy on #{buy_day} and to sell on #{sell_day}."
end

stock_prices = []
print "Enter stock prices in USD for "
while stock_prices.length < 8
    puts "#{weekday(stock_prices.length)}: ".chomp
    price = gets.chomp.to_i
    stock_prices.push(price) if price.integer?
end

puts stock_picker(stock_prices)
