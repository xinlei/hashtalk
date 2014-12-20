class SearchController < ApplicationController
  def create
    @tiks = Tik.get(params[:query])
    respond_to do |format|
      format.html
      format.js
    end
  end

  def delete
    redirect_to welcome_index_path
  end
end
