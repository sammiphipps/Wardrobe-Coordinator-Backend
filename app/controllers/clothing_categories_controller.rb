class ClothingCategoriesController < ApplicationController

    rescue_from ActiveRecord::RecordNotFound, with: :handle_record_not_found
    rescue_from ActiveRecord::RecordInvalid, with: :handle_record_invalid

    def index 
        clothing_category = ClothingCategory.all
        render json: clothing_category
    end 

    def show 
        clothing_category = ClothingCategory.find(params[:id])
        render json: clothing_category
    end 

    private 

    def handle_record_not_found(exception)
        render json: {error: exception.message}, status: :not_found
    end 

    def handle_record_invalid(exception)
        render json: {error: exception.record.errors}, status: :unprocessable_entity
    end 
end
