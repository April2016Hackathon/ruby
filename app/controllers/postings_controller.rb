class PostingsController < ApplicationController
	before_action :authenticate!, only:[:create, :destroy]
	#this code needs to be reviewed and reworked

   def index
     @posts = Posting.all
     render "index.json.jbuilder", status: :ok
  end

  def show
    @post = Posting.find(params["id"])
    render json: { postings: @post.as_json }
  end

  def recent
    @user = User.find(params["user_id"])
    @post = @user.postings.last
    render json: { postings: @post.as_json }
  end



  def create
      @post = current_user.postings.create(user_id: session[:user_id], text: params[:text], title: params[:title],##describe
                       mood: params[:mood])
    if @post.save
      render "create.json.jbuilder", status: :created
    else
      render json: { errors: @post.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
  	@post = Posting.find_by(id: params["id"])
  	if current_user.id == @post.user.id
  		@post.destroy
  		render json: "POST DESTROYED.",
  			status: :accepted
  		else
  			render json: { error: "INCORRECT USER." },
  			status: :unauthorized
		end
	end
end
