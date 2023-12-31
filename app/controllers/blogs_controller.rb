class BlogsController < ApplicationController
    def index
      blogs = Blog.all
      render json: blogs.as_json(include: :user)
    end
  
    def show
      blog = Blog.find_by(id: params[:id])
      if blog
        render json: blog.as_json(include: :user)
      else
        render json: { error: "blog not found" }, status: :not_found
      end
    end
  
    def create
      current_user = User.find_by(id: session[:user_id])
      if current_user&.is_admin?
        blog = current_user.Blogs.create(title: params[:title], image: params[:image], content: params[:content])
        if blog.valid?
          render json: { success: "blog created successfully" }, status: :ok
        else
          render json: { error: blog.errors.full_messages }, status: :unprocessable_entity
        end
      else
        render json: { error: "admins can only perform such operation" }
      end    
    end
  
    def update
      blog = Blog.find_by(id: params[:id])
      if blog
        if blog.update(title: params[:title], image: params[:image], content: params[:content], user_id: params[:user_id])
          render json: { success: "blog updated successfully" }, status: :ok
        else
          render json: { error: blog.errors.full_messages }, status: :unprocessable_entity
        end
      else
        render json: { error: "blog not found" }, status: :not_found
      end
    end
  
    def destroy
      blog = Blog.find_by(id: params[:id])
      if blog
        blog.destroy
        render json: { success: "blog deleted successfully" }, status: :ok
      else
        render json: { error: "blog you are trying to delete does not exist" }, status: :not_found
      end
    end
  end
  