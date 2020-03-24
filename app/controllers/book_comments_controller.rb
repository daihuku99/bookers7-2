class BookCommentsController < ApplicationController
	def create
		@book_image = BookImage.find(params[:id])
		# binding.pry
		@book_comment = BookComment.new(book_comment_params)
		@book_comment.user_id = current_user.id
		# book_comment = current_user.book_comments.new(book_comment_params)
		# binding.pry
		@book_comment.book_image_id = @book_image.id
		@book_comment.save
		redirect_to book_image_path(@book_image), notice: 'You have creatad comment successfully.'
	end

	def destroy
	end

	private
	def book_comment_params
		params.require(:book_comment).permit(:comment)
	end
end
