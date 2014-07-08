class Event < ActiveRecord::Base
	belongs_to :creator, :class_name => "User"
	has_many :invitations, foreign_key: :attended_event_id
	has_many :attendees, through: :invitations

	validates :description, presence: :true
	validates :date, presence: :true
	validates :creator_id, presence: :true
	validates :location, presence: :true

end
