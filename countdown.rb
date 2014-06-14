class Countdown

	class << self
		Operators = %w(+ - * /)
			
		def cecil
			100 + (rand * 900).floor
		end

		def solve number_to_reach, numbers_to_use, n_solutions=1
			equations = every_permutation_of(numbers_to_use); p 'found permutations'
			solutions = equations.map{|x| eval(x)}; p 'evaluated permutations'
			solutions.zip(equations).select{|soln, eqn| soln == number_to_reach }
		end

		def choose_numbers n_lows, n_highs
			numbers = []
			n_lows.times { numbers.push low_number }
			n_highs.times { numbers.push high_number }
			numbers
		end

		private
			def low_number
				(1..10).to_a.sample
			end

			def high_number
				[15,20,25,40,50,75,100].sample
			end

			def every_permutation_of numbers
				equations = []
				operators = Operators.repeated_combination(numbers.length - 1)
				numbers.permutation.each do |permutation|
					operators.each do |set_of_operators|
						equations << permutation.zip(set_of_operators).join
					end
				end
				equations
			end

	end

end

c = Countdown
p c.solve c.cecil, c.choose_numbers(5,2)