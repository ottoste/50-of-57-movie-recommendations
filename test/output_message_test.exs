defmodule OutputMessageTest do
  use ExUnit.Case


	test "queries for imdb rating" do
		movie_data = %{"Title" => "The Martian", "imdbRating" => "8.2"}

		assert OutputMessage.query_rating(movie_data) == 8.2
	end

	test "if rating 8 or more - suggest" do
		assert OutputMessage.suggestion(8.5) == "Definately worth watching!"
	end

	test "if rating 5-8  - should be ok" do
		assert OutputMessage.suggestion(5.1) == "Propably nothing special, but give it a try!"
	end

	test "if rating less than five  - don't bother" do
		assert OutputMessage.suggestion(4.8) == "Unless utterly bored, don't bother!"
	end
end