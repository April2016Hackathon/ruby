class RegistrationsController < ApplicationController
	skip_before_filter :verify_authenticity_token, only: [:create, :login]

	def create
		@user = User.new(username: params["username"],
						email: params["email"],
						password: params["password"])
		@user.ensure_auth_token
		if @user.save
			render json: { user: @user.as_json(only: [:username, :email, :auth_token] )},
				status: :created
		else
			render json: { errors: @user.errors.full_messages },
					status: :unprocessable_entity
		end
	end

	def login
		@user = User.find_by!(username: params["username"])
		if @user.authenticate(params["password"])
			render json: { user: @user.as_json(only: [:username, :id, :auth_token]) },
					status: :ok
		else
			render json: { message: "INVALID EMAIL OR PASSWORD."},
					status: :unauthorized
		end
	end

	def destroy
		@user = User.find_by(username: params["username"])
		if @user.authenticate(params["password"])
			@user.destroy
				render json: "USER DESTROYED.",
				status: :accepted
		else
			render json: { error: "UNAUTHORIZED" },
				status: :unauthorized
		end
	end
end
