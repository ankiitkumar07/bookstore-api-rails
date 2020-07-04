class Follow < ApplicationRecord

	#### I am the follower (user_follower) and I am following (user_following)


  belongs_to :user_following, class_name: "User"
  belongs_to :user_follower, class_name: "User"

  validates :status, inclusion: {in: ["ACCEPTED", "PENDING", "REJECTED"]}
  validates_uniqueness_of :user_following_id, :scope => [:user_follower_id], :message => "You already follow this person"
end
