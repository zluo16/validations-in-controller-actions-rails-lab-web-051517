class AuthorsController < ApplicationController
  def show
    @author = Author.find(params[:id])
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(
      name: params[:name],
      email: params[:email]
    )

    if @author.save
      redirect_to author_path(@author)
    else
      render :new
    end
  end
end
