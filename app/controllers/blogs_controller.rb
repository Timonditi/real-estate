class BlogsController < ApplicationController
    def index
        blogs = Blog.all
        render jason: blogs.as_json(include: :user)
    end

    def show
        blog = Blog.find_by(id: params[:id])
        if blog
            render json: blog(include: :user)
        else
            render json: {error: "post not found"}, status: :not_found
    end

    def create
        current_user = User.find_by(id:  session[:user_id])
        if current_user.is_admin==true
        
        post = @current_user.posts.create(title: params[:title], image: params[:image], content: params[:content])
        if post.valid?
            render json: {success: "Post created successfully"}
        else
            render json: {error: post.errors.full_messages}, status: :unprocessable_entity
        end
        else  
            render json: {error: "admins can only perform such operation"}
        end             
    end

    def update
        post = Post.find_by(id: params[:id])

        if post
            post.update(title: params[:title], image: params[:image], content: params[:content], user_id: params[:user_id])
            render json: {success: "post updated successful"}, status: :created
        else
            render json: {error: "post not found"}, status: :not_found
        end
    end

    def destroy
        post = Post.find_by(id: params[:id])
        if post
            post.destroy
            render json: {success: "post deleted successful"}, status: :created
        else
            render json: {error: "post you are trying to delete does not exist"}, status: :not_found
        end
    end
end
