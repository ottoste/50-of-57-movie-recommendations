defmodule MovieRequest do
	
	def movie_data(user_input) do
		build_request(user_input)
		|> get_response
		|> parse_data
	end
	
	def build_request(user_input) do
		"http://www.omdbapi.com/?t=#{user_input}"
	end

	def get_response(url) do
 		url
    |> HTTPotion.get
    |> get_response_body
    
  end
    
  def get_response_body(response) do
  	%HTTPotion.Response{body: body} = response
    body
  end

	def parse_data(json) do
		Poison.Parser.parse!(json)
	end
end