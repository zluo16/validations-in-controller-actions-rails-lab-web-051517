class AuthorsController < ApplicationController
  def show
    @author = Author.find(params[:id])
  end

  def new
  end

  def create
    @author = Author.create(
      name: params[:name],
      email: params[:email]
    )

    redirect_to author_path(@author)
  end
end
