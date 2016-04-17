class ResponsesController < ApplicationController
	before_action :authenticate!, only: [:new]

  # def show
  #   @user = User.find(params[:id])
  #   @response = Response.find(params[@user.id])
  #   @response = @user.responses.find(params[:id])
  # end

  def create
      @post = Posting.find(params[:id])
      @response = @post.responses.create(user_id: current_user.id,
                                         text: params[:text],
                                         chosen: params[:chosen])
      binding.pry
    if @post.save
      render "create.json.jbuilder", status: :created
    else
      render json: { errors: @post.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @post = Posting.find(params[:id])
    @response = Response.find(params[:posting_id])
    if current_user.id == @response.user_id
      @response.destroy
      render json: { message: "RESPONSE DESTROYED" },
      status: :accepted
    else
      render json: { error: "INVALID USER" },
      status: :unauthorized
    end
  end

  def index
    @post = Posting.find(params[:id])
    @responses = @post.responses.all
    render "index.json.jbuilder", status: :ok
  end

  def update
    
  end
end
