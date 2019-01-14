# PHASE 2
def convert_to_int(str)
  begin
    Integer(str)
  rescue ArgumentError
    nil
  end
end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]
class GivenCoffeeError < StandardError; end
class NotGivenFruitOrCoffeeError < StandardError; end

def reaction(maybe_fruit)
  raise NotGivenFruitOrCoffeeError if !FRUITS.include?(maybe_fruit) &&
  maybe_fruit != 'coffee'
  raise GivenCoffeeError if maybe_fruit == "coffee"
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"

  begin 
    puts "Feed me a fruit! (Enter the name of a fruit:)"
    maybe_fruit = gets.chomp
    reaction(maybe_fruit) 
  rescue GivenCoffeeError
    puts 'hey thats not a fruit! Thanks for the coffee, I will give you a try'
    retry
  rescue NotGivenFruitOrCoffeeError
    puts "hey you didnt give me coffee or fruit!"
    return
  end 

  puts "OMG, thanks so much for the #{maybe_fruit}!"
end  

# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    raise 'Please enter a years known of at least 5' if yrs_known < 5
    raise 'Please enter a name' if name.length <= 0
    raise 'Please enter a favorite pastime' if fav_pastime.length <= 0
    @name = name
    @yrs_known = yrs_known
    @fav_pastime = fav_pastime
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me." 
  end
end


if __FILE__ == $PROGRAM_NAME
  # convert_to_int('hello')
  # feed_me_a_fruit
end