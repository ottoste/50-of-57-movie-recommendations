defmodule UserInput do

	def get_user_input do
		prompt_user
		|> parse
	end
	
	def prompt_user do
		IO.gets("Enter the name of a movie:")
	end

	def parse(user_input) do
		user_input
		|> String.strip
		|> String.downcase
		|> String.replace(" ", "%20")
	end
end
