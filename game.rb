require './players'

class Game
  attr_accessor :player1, :player2
  def initialize(player1,player2)
    #create object instance for Player class
    @player1 = Players.new(player1,3)
    @player2 = Players.new(player2,3)
  end

  #game starts from here
  def game_on
    puts "-----LETS START GAME-----"
    while @player1.life > 0 || @player2.life > 0 do
      start("Player 1")
      break if @player2.life == 0
      puts "-----NEW TURN-----"
      start("Player 2")
      break if @player1.life == 0
      puts "-----NEW TURN-----"
    end
    winner
  end  

  #to display questions and score for each player
  def start(player)
    print_questions(player)
    cal_result = @a + @b

    if @get_input.to_i == cal_result
      puts "#{player} : YES! You are correct."
      puts "P1: #{@player1.life}/3 vs P2: #{@player2.life}/3"
      
    else
      puts "#{player} : Seriously? No!"
      if(player == "Player 1")
        puts "P1: #{@player1.life}/3 vs P2: #{@player2.remaining_life}/3"
      else
        puts "P1: #{@player1.remaining_life}/3 vs P2: #{@player2.life}/3"
      end
    end 
  end  

  def winner
    if @player1.life == 0
      puts "#{@player2.name} wins with a score of #{@player2.life}/3" 
    elsif @player2.life == 0
      puts "#{@player1.name} wins with a score of #{@player1.life}/3" 
    else 
      puts "Match draw"
    end

    puts "----GAME OVER---"
    puts "Good bye!"
  end

  def print_questions(player)
    @a= rand(1..20) 
    @b= rand(1..20)
    puts "#{player}: What does #{@a} plus #{@b} equal?"
    @get_input=gets.chomp
  end
end


