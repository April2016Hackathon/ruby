class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  def current_user
  	token = request.headers["X-Auth-Token"]
  	if token
  		User.find_by(auth_token: token)
  	end
  end

  def authenticate!
  	unless current_user
  		render json: { errors: "YOU MUST LOG IN FIRST!" },
  			status: :unauthorized
  	end
  end

  rescue_from ActiveRecord::RecordNotFound do |error|
  	render json: { error: "No such object: #{error.message} " },
  		status: :not_found
  	end

    #this is just for authenticate / login users above ^^^^^^^^
    #may need more app methods
end
