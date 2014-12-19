class SearchController < ApplicationController
  def create
    puts 'in searchController'
    @tiks = Tik.get(params[:query])
    respond_to do |format|
      format.html
      format.js
    end
  end
end
