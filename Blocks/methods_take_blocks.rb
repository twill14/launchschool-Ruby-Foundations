# def hello
#   "hello!"
# end

# hello("hi") # Error


# hello {puts 'hi'}

# def echo(str)
#   str
# end

# echo # error

# echo("hello!") # hello

# echo("hello!", 'world') # error


# # with block

# echo {puts "world"} #error

# echo("hello!") {puts "world"} # hello

# echo("hello!", 'world') {puts "world"} error

# def echo_with_yield(str)
#   yield
#   str
# end

# echo_with_yield { puts "world" }                        # => ArgumentError: wrong number of arguments (0 for 1)
# echo_with_yield("hello!") { puts "world" }              # world
#                                                         # => "hello!"
# echo_with_yield("hello", "world!") { puts "world" }   

# # Edge Case

# echo_with_yield("hello!")    # Error, because we have no block to yield to

# To counter the edge case, we can use block_given? method

# def echo_with_yield(str)
#   yield if block_given?
#   str
# end

# echo_with_yield("hello!") #no error

# def say(words)
#   yield if block_given?
#   puts "> " + words
# end

# say("hi there") do 
#   system 'clear'
# end

# def increment(number)
#   number + 1
# end

# increment(5)


# def increment(number)
#   if block_given?
#     yield(number + 1)
#   else
#     number + 1
#   end
# end


# def increment(5) do |num|
#   puts num


# #Block Way
# def compare(str)
#   puts "Before: #{str}"
#   after = yield(str)
#   puts "After: #{after}"
# end

# # method invocation
# compare('hello') { |word| word.upcase }


# #Non-block way
# def compare(str, flag)
#   after = case flag
#           when :upcase
#             str.upcase
#           when :capitalize
#             str.capitalize
#           # etc, we could have a lot of 'when' clauses
#           end

#   puts "Before: #{str}"
#   puts "After: #{after}"
# end

# compare("hello", :upcase)

# def time_it
#   time_before = Time.now
#   yield                       # execute the implicit block
#   time_after= Time.now

#   puts "It took #{time_after - time_before} seconds."
# end

# time_it { sleep(3) }                    # It took 3.003767 seconds.
#                                         # => nil

# time_it { "hello world" }      




# my_file = File.open("some_file.txt", "w+")  # creates a file called "some_file.txt" with write/read permissions
# # write to this file using my_file.write
# my_file.close

# File.open("some_file.txt", "w+") do |file|
#   # write to this file using file.write
# end

# def test(&block)
#   puts "What's &block? #{block}"
# end

# test { sleep(1) }

# What's &block? #<Proc:0x007f98e32b83c8@(irb):59>
# => nil

# def times(number)
#   counter = 0
#   while counter < number do 
#     yield(counter)
#     counter += 1
#   end
#   number
# end

# times(5) do |num|
#   puts num
# end


# def each(array)
#   counter = 0

#   while counter < array.size
#     yield(array[counter])
#     counter += 1
#   end

#   array
# end


# each([1, 2, 3, 4, 5]) do |num|
#   puts num
# end


# def select(array)
#   counter = 0
#   arr = []

#   while counter < array.size
#     arr << array[counter] if yield(array[counter])
#     counter += 1
#   end

#   arr
# end

# array = [1, 2, 3, 4, 5]

# p select(array) { |num| puts num }      # => [], because "puts num" returns nil and evaluates to false
# p select(array) { |num| num + 1 }  

def reduce(array, init = 0)
  counter = 1 
  total = yield(init, array[0])

  while counter < array.size
   total = yield(total, array[counter])
    counter += 1
  end

  total
end

array = [1, 2, 3, 4, 5]

p reduce(array) { |acc, num| acc + num }
p reduce(array, 10) { |acc, num| acc + num } 
p reduce(array) { |acc, num| acc + num if num.odd? }  
