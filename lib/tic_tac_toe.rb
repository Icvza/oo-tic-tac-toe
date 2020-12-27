require'pry'
class TicTacToe

    WIN_COMBINATIONS = [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [0,4,8],
        [6,4,2]

    ]
    
    def initialize(board=nil)
        @board = Array.new(9, " ")
    end

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(string) 
        @choice = string.to_i - 1
    end

    def move(input_to_index, token = "X")
        @board[input_to_index] = token
    end

    def position_taken?(input_to_index)
        if @board[input_to_index] == "X" || @board[input_to_index] == "O"
            true
        else 
            false
        end
    end

    def valid_move?(input_to_index)
        !position_taken?(input_to_index) && input_to_index.between?(0,8)
    end

    def turn_count
        @board.count {|token| token == "X" || token == "O"}
    end

    def current_player
        turn_count % 2 == 0 ? "X" : "O"
    end

    def turn
        puts "Choose your moveeee youngpadwan"
        input = gets.strip 
        index = input_to_index(input)
        if valid_move?(index)
            move(index, current_player)
        else
            turn
        end
        display_board
    end

    def won?
        WIN_COMBINATIONS.any? do |combo|
          if position_taken?(combo[0]) && @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]]
            return combo
          end
        end
    end
    
    def full?
        @board.all? { |i| i != " " }
    end

    def draw?
        full? && !won?
    end

    def over?
        draw? || won?
    end

    def winner
        if combo = won?
        @board[combo[0]]
        end
    end

    def play
        turn until over?
        puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
    end

end

