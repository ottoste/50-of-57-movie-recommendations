defmodule OutputMessageTest do
  use ExUnit.Case
  import ExUnit.CaptureIO

	test "if rating 8 or more - suggest" do
		movie_data = %{"Title" => "Movie", "imdbRating" => "8.2"}
		assert OutputMessage.suggestion(movie_data) == "Definately worth watching!"
	end

	test "if rating 5-8  - should be ok" do
		movie_data = %{"Title" => "Movie", "imdbRating" => "5.1"}
		assert OutputMessage.suggestion(movie_data) == "Propably nothing special, but give it a try!"
	end

	test "if rating less than five  - don't bother" do
		movie_data = %{"Title" => "Movie", "imdbRating" => "4.8"}
		assert OutputMessage.suggestion(movie_data) == "Unless utterly bored, don't bother!"
	end

	test "builds movie output message" do
		fake_movie_data = %{
			"Title" => "Movie",
			"Year" => "2003",
			"Rated" => "R",
			"Actors" => "John Smith",
			"Runtime" => "180 min",
			"Plot" => "Guy washes horse",
			"imdbRating" => "8.0" }
		output_message =
		"""
		\e[44m\e[4m\e[1m
		Title: Movie\e[24m 
		Year: 2003
		Rating: R
		Running Time: 180 min
		Actors: John Smith

		Description: Guy washes horse

		Definately worth watching!
		\e[0m

		"""
		result = capture_io(fn -> 
			OutputMessage.display_movie_message(fake_movie_data) 
	 	end)
		assert result == output_message
	end
end