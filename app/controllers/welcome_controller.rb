class WelcomeController < ApplicationController

  # Display a collection of tiks, already sorted by ranking
  def index
    temp_none = 1
    @list = Tik.get(temp_none)
  end

  # Store the new tik after parsing for hashtags
  def post
    value = params[:message]
    Tik.put(value)
    redirect_to welcome_index_url
  end

  #Extract hashtags from the input text of the format #value1, #value2, ...
  #Return a set of string
  def parse

  end

end
