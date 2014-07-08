class PostsController < ApplicationController
	  before_action :signed_in_user, only: [:new, :create]
  
  def new
  	@post=Post.new
  end

  def create
  	@post = Post.new(post_params)
  	if @post.save
  		redirect_to '/posts'
  	else
  		render 'new'
  	end
  end

  def index
  	@posts=Post.all
  end


  private

  def post_params
  	params.require(:post).permit(:content, :user_id)
  end
  #before filters

  def signed_in_user
    unless !current_user.nil?
      redirect_to signin_url
    end
  end
end
