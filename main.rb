require "player.rb"

class TicTacToe
  attr_accessor :board_positions, :winner, :game_over
  
  def initialize(hero, boss)
		answer = gets.chomp "This is the Final battle, are you ready?[Y/N]"
		
		if answer.upcase == "Y"
			@board_positions = ['1', '2', '3', '4', '5', '6', '7', '8', '9']
			@p1 = hero
			@p2 = boss
			@game_over = false
			@winner = nil
			play
		end
  end

  private
  
  def play
    player = @p1
    available_positions = [1, 2, 3, 4, 5, 6, 7, 8, 9]
   
    until @game_over
      show_board
      puts "#{player.name}: Please choose a position from the available positions on the board."

      position = gets.chomp.to_i 
      if available_positions.include?(position)
        available_positions.delete(position)
        @board_positions[position - 1] = player.game_piece;
      
        check_if_winner(player)
        check_if_stalemate(available_positions)
        
        player == @p1 ? player = @p2 : player = @p1
      end
    end

    display_winner
  end

  def check_if_stalemate(available_positions)
    @game_over = true if available_positions.empty?
  end

  def check_if_winner(player)
    winning_combinations = [
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,3,6],
      [1,4,7],
      [2,5,8],
      [0,4,8],
      [2,4,6]
    ]

    winning_combinations.each do |combination|
      arr = []
      combination.each do |position|
        arr << @board_positions[position]
      end

      if arr.join =~ /#{player.game_piece}{3}/
        @winner = player
        player.score += 1
        @game_over = true
      end
    end
  end

  def display_winner
    show_board
    unless @winner.nil?
      puts "#{@winner.name} is the winner!!"
    else
      puts "The fight is a draw! The Evil Boss gets another chance"
    end

    puts "Would you like to fight again? [Y/N]"
    if gets.chomp.upcase == 'Y'
      game = TicTacToe.new(@p1, @p2)
    else
      show_board
      puts "Thank you for playing!"
    end
  end

  
  def show_board(hero, boss)
		board = ['1', '2', '3', '4', '5', '6', '7', '8', '9']
			row1 =   " #{board[0]} | #{board[1]} | #{board[2]} "
			row2 =   " #{board[3]} | #{board[4]} | #{board[5]} "
			row3 =   " #{board[6]} | #{board[7]} | #{board[8]} "
			divider ="---+---+---"
			closer = "-----------"
	
			puts "|======== FINAL BATTLE ========|"
			puts ''
			puts " " + closer 
			puts "|" + row1 + "|"
			puts "|" + divider + "| 'X' #{@p1.name}  (#{@p1.role}) |#{@p1.score}|" 
			puts "|" + row2 + "|"
			puts "|" + divider + "| 'O' #{@p2.name}  (#{@p2.role}) #{@p1.score}|"
			puts "|" + row3 + "|"
			puts " " + closer 
	end
end
