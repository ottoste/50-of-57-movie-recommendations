defmodule OutputMessage do
	
	def display(movie_data) do
		response = Dict.get(movie_data, "Response")
		cond do
			response == "True" -> display_movie_message(movie_data)
			response == "False" -> display_error_message
		end
	end

	def display_error_message do
		IO.puts("Sorry, movie not found, please try again")
		Movies.main
	end

	def display_movie_message(movie_data) do
		movie_data
		|> build_movie_message
		|> IO.puts
	end

	def build_movie_message(movie_data) do
		[title, year, rating, runtime, description, actors] = movie_values(movie_data)
		suggest = suggestion(movie_data)	
		
		"""
		#{IO.ANSI.blue_background()}#{IO.ANSI.underline()}#{IO.ANSI.bright()}
		Title: #{title}#{IO.ANSI.no_underline()} 
		Year: #{year}
		Rating: #{rating}
		Running Time: #{runtime}
		Actors: #{actors}

		Description: #{description}

		#{suggest}
		#{IO.ANSI.reset()}
		"""
	end

	def movie_values(movie_data) do
		key_list = ["Title", "Year", "Rated", "Runtime", "Plot", "Actors"]
		
		Enum.map(key_list, fn(x) -> 
			Dict.get(movie_data, x) 
		end)
	end

	def suggestion(movie_data) do
		rating = Dict.get(movie_data, "imdbRating") |> String.to_float
		
		cond do 
			rating >= 8.0 -> "Definately worth watching!"
			rating >= 5.0 -> "Propably nothing special, but give it a try!"
			true -> "Unless utterly bored, don't bother!"
		end
	end
end