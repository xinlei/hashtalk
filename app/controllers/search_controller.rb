class SearchController < ApplicationController
  def create

    session[:list] = Tik.get(input)
    redirect :welcome_index_url
  end
end
