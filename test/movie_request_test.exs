defmodule MovieRequestTest do
  use ExUnit.Case
  
  test "Constructs the request" do
  	user_input = "martian"
  	
  	request = "http://www.omdbapi.com/?t=martian"
  	assert MovieRequest.build_request(user_input) == request
  end

  test "Gets data from API" do
  	url = "http://www.omdbapi.com/?t=martian"

  	result = MovieRequest.get_response(url)
  	assert String.contains?(result, " ")
  end

  test "Parses the data to map" do 
  	data = "{\"Title\":\"The Martian\"}"

  	map = %{"Title" => "The Martian"}
  	assert MovieRequest.parse_data(data) == map
  end
end