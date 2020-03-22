class BookCommentsController < ApplicationController
	def create
		# binding.pry
		@book_image = BookImage.find(params[:id])
		comment = BookComment.new(book_comment_params)
		comment.user_id = current_user.id
		# comment = current_user.book_comments.new(book_comment_params)
		comment.book_image_id = book_image_id
		comment.save
		redirect_to book_image_path(book_image)
	end

	def destroy
	end

	private
	def book_comment
		params.require(:book_comment).permit(:comment)
	end
end
