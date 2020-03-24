class FavoritesController < ApplicationController
	def create
		book_image = BookImage.find(params[:id])
		favorite = current_user.favorites.new(book_image_id: book_image.id)
		# favorite = Favorites.new(book_image_id: book_image.id, user_id: current_user.id)
		# favorite = Favorite.new
		# favorite.user_id = current_user.id
		# favorite.book_image_id = book_image.id
		favorite.save
		redirect_to book_image_path(book_image)
	end

	def destroy
		book_image = BookImage.find(params[:id])
		favorite = current_user.favorites.find_by(book_image_id: book_image.id)
		# favorites = Favorite.where(user_id: current_user.id)
		# favorite = favorites.find_by(book_image_id: book_image.id)
		favorite.destroy
		redirect_to book_image_path(book_image)
	end
end

