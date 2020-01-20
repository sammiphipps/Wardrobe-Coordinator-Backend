class OutfitItemsController < ApplicationController

    rescue_from ActiveRecord::RecordNotFound, with: :handle_record_not_found
    rescue_from ActiveRecord::RecordInvalid, with: :handle_record_invalid

    before_action :authenticate, only: [:create, :update, :destroy]

    def index 
        outfit_items = OutfitItem.all
        render json: outfit_items
    end 

    def show 
        outfit_item = OutfitItem.find(params[:id])
        render json: outfit_item
    end 

    def create 
        outfit_item = OutfitItem.create(outfit_item_params)
        render json: outfit_item 
    end 

    def update 
        outfit_item = OutfitItem.find(params[:id])
        outfit_item.update(outfit_item_params)
        render json: outfit_item
    end 

    def destroy 
        outfit_item = OutfitItem.find(params[:id])
        outfit_item.destroy
        render json: {status: 204, message: "Outfit Item has been destroyed."}
    end 

    private 

    def outfit_item_params 
        params.require(:outfit_item).permit(:outfit_id, :clothing_item_id)
    end 

    def handle_record_not_found(exception)
        render json: {error: exception.message}, status: :not_found
    end 

    def handle_record_invalid(exception)
        render json: {error: exception.record.errors}, status: :unprocessable_entity
    end     

end
