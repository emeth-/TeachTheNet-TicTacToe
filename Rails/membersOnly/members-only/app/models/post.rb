class Post < ActiveRecord::Base
	belongs_to :user, dependent: :destroy

	validates :user_id, presence: true
	validates :content, presence: true
end
