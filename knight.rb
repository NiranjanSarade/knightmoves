class Knight
	attr_accessor :x, :y

	DELTAS = [[-2,1],[-2,-1],[-1,-2],[1,-2],[2,-1],[2,1],[1,2],[-1,2]]

	def initialize
		@x, @y = 0, 0
	end

	def possible_moves
		DELTAS.map {|(delta_x,delta_y)| [@x + delta_x, @y + delta_y]}
			  .select {|(x,y)| within_chess_board?(x,y)}
	end

	# this mapping can be used for valid moves of per cell Knight position 
	#{[0, 0]=>[[2, 1], [1, 2]], [0, 1]=>[[2, 0], [2, 2], [1, 3]], [0, 2]=>[[1, 0], [2, 1], [2, 3], [1, 4]], 
	# [0, 3]=>[[1, 1], [2, 2], [2, 4], [1, 5]], [0, 4]=>[[1, 2], [2, 3], [2, 5], [1, 6]], 
	#[0, 5]=>[[1, 3], [2, 4], [2, 6], [1, 7]], [0, 6]=>[[1, 4], [2, 5], [2, 7]], ....... } 

	def all_valid_moves_per_cell
		(0..7).map {|x| (0..7).map {|y| [x,y]}}
			  .flatten(1)
			  .reduce({}) do |memo,(x_cell,y_cell)| 
				@x = x_cell
				@y = y_cell
				memo[[@x,@y]] = possible_moves
				memo
			end
	end

	private
	def within_chess_board?(x,y)
		(0..7).include?(x) and (0..7).include?(y)
	end

end

