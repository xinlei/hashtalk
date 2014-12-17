class WelcomeController < ApplicationController

  # Display a collection of tiks, already sorted by ranking
  def index

    @list = Tik.get(params[:query])
  end

  # Store the new tik after parsing for hashtags
  def post
    value = params[:message]
    tik =  Tik.put(value)
    parse_and_save_hashtags(tik, value)
    redirect_to welcome_index_url
  end

  def filter(hashtags)

  end

  # helper methods below
  # ===================================

  # Extract hashtags from the input text of the format #value1, #value2, ...
  # Return a set of string
  def parse_and_save_hashtags(tik, value)
    result_set = value.scan(/#\w+/)
    Hashtag.put(tik, result_set)
  end

  def construct_hashtag_reference(list)
    for tik in list
      hashtags = tik.hashtags
      str_front = '<span id=''hash_link''>'
      str_end = '</div>'
      for hashtag in hashtags
        string =  str_front.html_safe + hashtag[:value] + str_end.html_safe
        tik[:value] = tik[:value].sub(hashtag[:value], string)
      end
    end
    list
  end
end
