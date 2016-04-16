class PostingsController < ApplicationController
	before_action :authenticate!, only:[:create, :destroy]

	#this code needs to be reviewed and reworked



  # def index
  #   @posts = Post.all
  #   render "index.json.jbuilder", status: :ok
  # end


  def create
      @post = current_user.postings.create(user_id: session[:user_id], text: params[:text], title: params[:title],##describe
                       mood: params[:mood])
  #binding.pry
    if @post.save
      render "create.json.jbuilder", status: :created
    else
      render json: { errors: @post.errors.full_messages }, status: :unprocessable_entity
    end
  end



# 	def create
# 		@post = current_user.posts.create(
# 			#need to define the parameters to create a post
# 			)
# 		if @post.save
# 			render "create.json.jbuilder",
# 				status: :created
# 		else
# 			render json: { errors: @post.errors.full_messages },
# 				status: :unprocessible_entity
# 		end
# 	end

# 	def index
# 		@posts = Post.all
# 		@users = User.all
# 		render "index.json.jbuilder"
# 				status: :ok
# 	end

# 	def destroy
# 		@post = Post.find_by(id: params["id"])
# 		if current_user.id == @post.user.id
# 			@post.destroy
# 			render json: "POST DESTROYED.",
# 			status: :accepted
# 		else
# 			render json: { error: "INCORRECT USER." },
# 			status: :unauthorized
# 		end
# 	end
# end
end
