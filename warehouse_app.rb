require 'pry-byebug'

# CREATE HASHES FOR EACH BAY  ----------------

bay_a = {:a10 => "rubber band", :a9 => "glow stick", :a8 => "model car", :a7 => "bookmark", :a6 => "shovel", :a5 => "rubber duck", :a4 => "hanger", :a3 => "blouse", :a2 => "stop sign", :a1 => "needle"}


bay_b = {:b1 => "tyre swing", :b2 => "sharpie", :b3 => "picture frame", :b4 => "photo album", :b5 => "nail filer", :b6 => "toothpaste", :b7 => "bath fizzers", :b8 => "tissue box", :b9 => "deodorant", :b10 => "cookie jar"}

bay_c = { :c1 => "rusty nail", :c2 => "drill press", :c3 => "chalk", :c4 => "word search", :c5 => "thermometer", :c6 => "face wash", :c7 => "paint brush", :c8 => "candy wrapper", :c9 => "shoe lace", :c10 => "leg warmers"}

# -----------------------------------
# CREATE TEMP ARRAYS AND HASHES

@combinedvalues = [bay_a.values, bay_c.values, bay_b.values].flatten
@combinedkeys = [bay_a.keys, bay_c.keys, bay_b.keys].flatten
@combined_all  = [bay_a, bay_c, bay_b]
@allproducts = Hash[*@combined_all.map(&:to_a).flatten]


# DEFINE FUNCTIONS  -----------------

def intro
  2.times do puts "" end
  puts "What would you like to do?"
  puts ""
  puts "Press 1 to find the contents of specific bays."
  puts "Press 2 to locate products by name and calculate the fastest route between them."
  puts "Press 3 to EXIT"
  menu1_choice = gets.chomp.to_s
  case menu1_choice
    when "1"
      products_from_bay_numbers
    when "2"
      locate_products
    when "3"
      abort("Have a nice day.")
    else puts "Not a valid choice"
      intro
  end
end

def products_from_bay_numbers
  puts "please insert a list of bay numbers separated by a space"
  selection = gets.chomp
  selected_bays = selection.split(" ").to_a
  2.times do puts "" end
  invalid_entries = []
  selected_bays.each {|holder|
  converted = holder.to_sym
    if @allproducts.has_key?(converted)
      puts "#{holder} contains a #{@allproducts[holder.to_sym]}."
    else
      invalid_entries << holder
    end
  }

  if invalid_entries.length > 0
    puts ""
    puts "#{invalid_entries} --- invalid entries"  # JOIN TO CLEAN UP THE OUTPUT
  else
  end
    intro
end

def locate_products
  sorted = []
  calculate = []
  route = []

  puts "please insert a list of products separated by a comma and a space."
  selection = gets.chomp
  selected_products = selection.split(", ").to_a
  puts ""
  selected_products.each {|value|
    if @allproducts.has_value?(value)
      puts "The #{value} is in #{@allproducts.key(value)}"
      sorted << @allproducts.key(value)
    else
      puts "#{value} not in the database"
    end
  }

  sorted.each {|x|
    if @combinedkeys.include?(x)
       calculate << @combinedkeys.index(x)
    else
    end
  }

  calculate.sort!

  calculate.each {|product|
    route << @combinedkeys[product]
  } 
  puts ""
  distance = calculate.max.to_i - calculate.min.to_i
  puts "The shortest route between your selected products is --#{route}"
  puts ""
  puts "There are #{distance} bays between the first and last selected products"
  intro
end

# RUN APP FROM HERE.... -------------------------

# CLEAR SCREEN AND TITLE--------------------

puts "\e[H\e[2J"

puts "Warehouse location Application"
2.times do puts "" end

# TESTING BLOCK - REMOVE IN FINAL REPO -----

puts "Here is a list of all the bays and products -- for testing purposes."
puts ""
puts "#{@allproducts}"

# MAIN PROGRAM  ------------------------------

intro


























