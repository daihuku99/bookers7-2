class UsersController < ApplicationController

  def index
  	@users = User.all
  	@book_image_new =BookImage.new
  end

  def show
  	@user = User.find(params[:id])
  	@book_images = @user.book_images(params[:id])
  	@book_image_new =BookImage.new
  end

  def edit
  end

  def update
  end
end
