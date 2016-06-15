class RelationshipsController < ApplicationController

  def check
  	follow = Relationship.where('following_id in (?) and follower_id in (?)', session[:user],params[:target_user_id])
	if follow.present?
		follow.delete_all
	else
    	Relationship.create(following_id: session[:user], follower_id: params[:target_user_id])
    end
    redirect_to user_path(params[:target_user_id].to_i)
  end
end