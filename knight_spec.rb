require 'rspec'
require_relative 'knight'


RSpec.describe "8 x 8 Chessboard Knight Moves problem" do
	describe Knight do
		before(:each) do 
			@knight = Knight.new
		end

		it "initializes with (0,0) position by default" do
			expect(@knight.x).to eq(0)
			expect(@knight.y).to eq(0)
		end

		context "when Knight position is within the board" do
			context "when top left (0,0) position"  do
				it "returns 2 possible moves of [2, 1] and [1, 2]" do
					expect(@knight.possible_moves).to eq([[2, 1], [1, 2]])
				end
			end

			context "when top right (0,7) position"  do
				it "returns 2 possible moves of [1, 5] and [2, 6]" do
					@knight.y = 7
					expect(@knight.possible_moves).to eq([[1, 5], [2, 6]])
				end
			end

			context "when bottom left (7,0) position"  do
				it "returns 2 possible moves of [5, 1] and [6, 2]" do
					@knight.x = 7
					expect(@knight.possible_moves).to eq( [[5, 1], [6, 2]])
				end
			end

			context "when bottom right (7,7) position"  do
				it "returns 2 possible moves of [5, 6] and [6, 5]" do
					@knight.x = 7
					@knight.y = 7
					expect(@knight.possible_moves).to eq([[5, 6], [6, 5]])
				end
			end

			context "when iterating over all positions in the board" do
				it "returns all valid possible moves per cell position of Kinght" do
					@knight.all_valid_moves_per_cell.each do |position, valid_moves|
						@knight.x = position[0]
						@knight.y = position[1]
						p "returns #{valid_moves} valid moves for Knight cell position #{position}" 
						expect(@knight.possible_moves).to eq(valid_moves)						
					end
				end
			end
			
		end
	end
end