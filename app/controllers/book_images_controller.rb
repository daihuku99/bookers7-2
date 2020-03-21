class BookImagesController < ApplicationController

	def new
		@book_image_new = BookImage.new
	end

	def create
		@book_image_new = BookImage.new(book_image_params)
		@book_image_new.user_id = current_user.id
		@book_image_new.save
		p @book_image_new.errors.full_messages
		redirect_to book_image_path(@book_image_new.id)
	end

	def index
		@book_images = BookImage.all
		@book_image_new =BookImage.new
		@user = current_user
	end

	def show
		@book_image = BookImage.find(params[:id])
		@book_image_new =BookImage.new
		@user = @book_image.user
	end

	def edit
		@book_image = BookImage.find(params[:id])
	end

	def update
		@book_image = BookImage.find(params[:id])
		@book_image.update(book_image_params)
		redirect_to book_image_path(@book_image.id)
	end

	def destroy
		book_image = BookImage.find(params[:id])
		book_image.destroy
		redirect_to book_images_path
	end

	private
	def book_image_params
		params.require(:book_image).permit(:title, :body, :image)
	end

end
