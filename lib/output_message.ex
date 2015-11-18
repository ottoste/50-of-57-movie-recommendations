defmodule OutputMessage do
	
	def display(movie_data) do
		movie_data
		|> check_response
	end

	def check_response(movie_data) do
		response = Dict.get(movie_data, "Response")
		cond do
			response == "True" -> movie_message(movie_data)
			response == "False" -> error_message
		end
	end

	def movie_message(movie_data) do
		# %{
		# 	"Title" => title,
		# 	"Year" => year,
		# 	"Rating"   => rating,
		# 	"Runtime" => runtime
		# 	"Plot"    => description
		# }
		title = Dict.get(movie_data, "Title")
		year = Dict.get(movie_data, "Year")
		rating = Dict.get(movie_data, "Rated")
		runtime = Dict.get(movie_data, "Runtime")
		description = Dict.get(movie_data, "Plot")
		actors = Dict.get(movie_data, "Actors")
		suggest = movie_data |> query_rating |> suggestion
		
		IO.puts(
		"""
		Title: #{title}
		Year: #{year}
		Rating: #{rating}
		Running Time: #{runtime}
		Actors: #{actors}

		Description: #{description}

		#{suggest}
		""")
	end

		def query_rating(movie_data) do
		Dict.get(movie_data, "imdbRating")
		|> String.to_float
	end


	def suggestion(rating) do
		cond do 
			rating >= 8.0 -> "Definately worth watching!"
			rating >= 5.0 -> "Propably nothing special, but give it a try!"
			true -> "Unless utterly bored, don't bother!"
		end
	end

	def error_message do
		IO.puts("Sorry, movie not found, please try again")
		Movies.main
	end
end