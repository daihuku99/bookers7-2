class BookImage < ApplicationRecord
	belongs_to :user
	has_many :book_comments, dependent: :destroy

	attachment :image

	validates :title, presence: true
	validates :body, presence: true
end
