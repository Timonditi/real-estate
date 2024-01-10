class PropertiesController < ApplicationController
    def index
        property = Property.all
        render json: property
    end

    def show
        property = Property.find_by(id: params[:id])
        if property
            render json: property
        else
            render json: {error: "property does not exist"}, status: :not_found
        end
    end

    def create
        property = Property.create(title: params[:title], image: params[:image], description: params[:description], price: params[:price], bedrooms: params[:bedrooms], location: params[:location])
        if property.valid?
          render json: { success: "Property created successfully" }, status: :ok
        else
          render json: { error: "Property not created"}, status: :unprocessable_entity
        end
    end

    def update
      property = Property.find_by(id: params[:id])
      if property
        property.update(title: params[:title], image: params[:image], description: params[:description], price: params[:price], bedrooms: params[:bedrooms], location: params[:location])
        render json: property
      else
        render json: {error: "Property not found"}, status: :not_found
      end
    end

    def destroy
      property = Property.find_by(id: params[:id])
      if property
        property.destroy
        render json: { success: "property deleted successfully" }, status: :ok
      else
        render json: { error: "property you are trying to delete does not exist" }, status: :not_found
      end
    end
      

    def approve
        current_user = User.find_by(id: session[:user_id])
        if current_user&.is_admin?
          property = Property.find_by(id: params[:id]) #value or null
          if property
              property.update(is_approved: true)
              render json: {success: "Property Approved... Can be seen by users"}, status: :created
          else
              render json: {error: "Property not found"}, status: :not_found
          end
        else
            render json: {error: "Only admin can perform such operation"}, status: :not_found
        end
      end

      def approvedproperties
        properties = Property.where(is_approved: true) 
        render json: properties
      end
end
