class UsersController < ApplicationController
    skip_before_action :authorize, only: [:create]

    def index
        users = User.all
        render json: users
    end

    def loggedin_user
        user = User.find_by(id: session[:user_id])
        if user
            render json: user
        else
            render json:{error: "user not logged in"}, status: :not_found
        end      
    end

    def show
        user = User.find_by(id: params[:id])
        if user
            render json: user
        else
            render json: {error: "user not found"}, status: :not_found
        end
    end

    def create
        user = User.create(username: params[:username], email: params[:email], profile_image: params[:profile_image], phone_number: params[:phone_number], password: params[:password])
        if user.valid?
            render json: {success: "user created successfully"}
        else
            render json: {error: user.errors.full_messages}, status: :unprocessable_entity
        end               
    end

    def update
        user = User.find_by(id: params[:id])

        if user
            user.update(username: params[:username], email: params[:email], profile_image: params[:profile_image], phone_number: params[:phone_number], password: params[:password])
            render json: {success: "user updated successful"}, status: :created
        else
            render json: {error: "user not found"}, status: :not_found
        end
    end

    def destroy
        user = User.find_by(id: params[:id])
        if user
            user.destroy
            render json: {success: "user deleted successful"}, status: :created
        else
            render json: {error: "user you are trying to delete does not exist"}, status: :not_found
        end        
    end
    
end
