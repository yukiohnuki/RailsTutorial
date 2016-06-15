class User < ActiveRecord::Base
  has_many :microposts
  has_many :relationships
  has_many :relationships,class_name: "Relationship", foreign_key: "follower_id",dependent: :destroy
  has_many :following, through: :relationships, source: :following

  has_many :relationships,class_name:  "Relationship", foreign_key: "following_id", dependent: :destroy
  has_many :followers, through: :relationships, source: :follower



  def authenticate(inputed_value)
    inputed_value == password
  end

  def follow(other_user)
    relationships.create(following_id: other_user.id)
  end

  def unfollow(other_user)
    relationships.find_by(following_id: other_user.id).destroy
  end

  def following?(other_user)
    following.include?(other_user)
  end

end
