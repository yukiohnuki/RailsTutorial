class MicropostsController < ApplicationController
  
  def new
    @micropost = Micropost.new
  end

  def create
    @micropost = Micropost.new(micropost_params)
    @micropost.user_id = session[:user]
    @micropost.save
    redirect_to "/"
  end

  def index
    @microposts = Micropost.all

    

  end

  private

  def micropost_params
    params.require(:micropost).permit(:body)
  end
end
