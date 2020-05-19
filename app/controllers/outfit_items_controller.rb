class OutfitItemsController < ApplicationController

    rescue_from ActiveRecord::RecordNotFound, with: :handle_record_not_found
    rescue_from ActiveRecord::RecordInvalid, with: :handle_record_invalid

    before_action :authenticate, only: [:create, :create_with_multiple_items, :update, :destroy]

    def index 
        outfit_items = OutfitItem.all
        render json: outfit_items, include: [:outfit => {except: [:created_at, :updated_at]}, :clothing_item => {except: [:created_at, :updated_at]}], except: [:outfit_id, :clothing_item_id]
    end 

    def show 
        outfit_item = OutfitItem.find(params[:id])
        render json: outfit_item, include: [:outfit => {except: [:created_at, :updated_at]}, :clothing_item => {except: [:created_at, :updated_at]}], except: [:outfit_id, :clothing_item_id]
    end 

    def create 
        outfit_item = OutfitItem.create(outfit_item_params)
        redirect_to :controller => "outfits", :action => "show", :id => outfit_item.outfit.id
    end 

    def create_with_multiple_items
        outfit_id = params[:outfit_item][:outfit_id]
        items = params[:outfit_item][:items]
        outfitItemsCreated = items.map do |item|
            OutfitItem.create(
                outfit_id: outfit_id,
                clothing_item_id: item
            )
        end 
        redirect_to :controller => "outfits", :action => "show", :id => outfit_id
    end 

    def update 
        outfit_item = OutfitItem.find(params[:id])
        outfit_item.update(outfit_item_params)
        redirect_to :controller => "outfits", :action => "show", :id => outfit_item.outfit.id
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
