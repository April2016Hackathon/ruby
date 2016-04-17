class ResponsesController < ApplicationController
	before_action :authenticate!, only: [:new]

  def index
    @post = Posting.find(params[:id])
    @responses = @post.responses.all
    render "index.json.jbuilder", status: :ok
  end

  def create
      @post = Posting.find(params[:id])
      @response = Response.create(user_id: current_user.id,
                                          posting_id: @post.id,
                                          text: params[:text])
      if @post.save
        render "create.json.jbuilder", 
          status: :created
      else
        render json: { errors: @post.errors.full_messages }, 
          status: :unprocessable_entity
      end
  end

  def destroy
    @response = Response.find(params[:response_id])
    if current_user.id == @response.user_id
      @response.destroy
      render json: { message: "RESPONSE DESTROYED" },
      status: :accepted
    else
      render json: { error: "INVALID USER" },
      status: :unauthorized
    end
  end

  def update
    @response = Response.find(params[:response_id])
    if current_user.id == @response.user_id
      if @response.update(chosen: true)
        render json: { message: "CHOSEN IS NOW TRUE!"},
        status: :accepted
      else
      binding.pry
        render json: { message: "THERE CAN ONLY BE ONE"},
        status: :unprocessable_entity
      end
    else
      render json: { error: "INVALID USER"},
      status: :unauthorized
    end
  end
end
