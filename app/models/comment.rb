class Comment < ActiveRecord::Base
	belongs_to :app
	belongs_to :user

	validates_presence_of :content, :app_id, :user_id

	default_scope { order(:created_at => :asc) }

	enum :comment_type => { :contact_status => 0, :app_functionality => 1, :general => 2}
end
