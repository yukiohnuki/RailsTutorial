class StaticpagesController < ApplicationController
  def help
  end

 def about
 end

 def contact
 end

 def news
 end

 def home
   @micropost = Micropost.new
   @microposts = Micropost.all
 end

end
