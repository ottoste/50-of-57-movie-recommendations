defmodule Movies do

	def main do
		UserInput.get_user_input
		|> MovieRequest.movie_data
		|> OutputMessage.display
	end
end
