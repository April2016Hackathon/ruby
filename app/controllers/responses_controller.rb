class ResponsesController < ApplicationController
	before_action :authenticate!, only: [:new]

  def create
      @post = Posting.find(params[:id])
      @response = @post.responses.create(user_id: current_user.id,
                                         text: params[:text],
                                         chosen: params[:chosen])
    if @post.save
      render "create.json.jbuilder", status: :created
    else
      render json: { errors: @post.errors.full_messages }, status: :unprocessable_entity
    end
  end
end
