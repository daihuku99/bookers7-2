class BookImagesController < ApplicationController

	def new
		@book_image_new = BookImage.new
	end

	def create
		@book_image_new = BookImage.new(book_image_params)
		@book_image_new.user_id = current_user.id
		if @book_image_new.save
			p @book_image_new.errors.full_messages
			redirect_to book_image_path(@book_image_new.id), notice: 'You have creatad book successfully.'
		else
			@book_images = BookImage.all
			@user = current_user
			render :index
		end
	end

	def index
		@book_images = BookImage.all
		@book_image_new =BookImage.new
		@user = current_user
		# @book_comment = BookComment.find(params[:id]).book_image.id
		# binding.pry
	end

	def show
		@book_image = BookImage.find(params[:id])
		@book_image_new =BookImage.new
		@user = @book_image.user
		@book_comment = BookComment.new
	end

	def edit
		@book_image = BookImage.find(params[:id])
	end

	def update
		@book_image = BookImage.find(params[:id])
		if @book_image.update(book_image_params)
			redirect_to book_image_path(@book_image.id), notice: 'You have updated book successfully.'
		else
			render :edit
		end
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
