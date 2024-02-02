class Pic < ActiveRecord::Base
	acts_as_votable
	belongs_to :user

	has_attached_file :image, styles: { medium: "300x300>" }, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :image, content_type: %w(image/jpeg image/jpg image/png image/gif)
end
