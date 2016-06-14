class MicropostsController < ApplicationController
  
  def new
    @micropost = Micropost.new
  end

  def create
    @micropost = Micropost.new(micropost_params)
    @micropost.save
    redirect_to "/microposts"
  end

  def index
    @microposts = Micropost.all

  end

  # def show
  #   @micropost = Micropost.find(params[:id])
  # end

  # def update
  #   redirect_to "/microposts"
  # end

  private

  def micropost_params
  params.require(:micropost).permit(:body)
  end
end
