class ClothingItemsController < ApplicationController

rescue_from ActiveRecord::RecordNotFound, with: :handle_record_not_found
rescue_from ActiveRecord::RecordInvalid, with: :handle_record_invalid

before_action :authenticate, only: [:index_by_user, :create, :update, :destroy]

    def index 
        clothing_items = ClothingItem.all
        render json: clothing_items, except: [:clothing_category_id], include: [:clothing_category => {only: [:name]}]
    end 

    def show 
        clothing_item = ClothingItem.find(params[:id])
        render json: clothing_item, except: [:clothing_category_id], include: [:clothing_category => {only: [:name]}]
    end 

    def index_by_user
        user = User.find_by(username: @user.username)
        if(user)
            clothing_items = ClothingItem.where(user_id: user.id)
            render json: clothing_items, except: [:clothing_category_id], include: [:clothing_category => {only: [:name]}]
        else 
            render json: {error: "Username not present in database."}
        end 
    end 

    def create 
        clothing_item = ClothingItem.create(clothing_item_params.merge(:user_id => @user.id))
        render json: clothing_item, except: [:clothing_category_id], include: [:clothing_category => {only: [:name]}]
    end 

    def update 
        clothing_item = ClothingItem.find(params[:id])
        clothing_item.update(clothing_item_params.merge(:user_id => @user.id))
        render json: clothing_item, except: [:clothing_category_id], include: [:clothing_category => {only: [:name]}]
    end 

    def destroy
        clothing_item = ClothingItem.find(params[:id])
        if(clothing_item.outfits.count > 0)
            clothing_item.outfits.map do |outfit|
                associated_outfit = Outfit.find(outfit.id)
                associated_outfit.destroy
            end 
        end 
        clothing_item.destroy
        render json: {status: 204, message: "One of your clothing items has been destroyed."}
    end 

    private 

    def clothing_item_params
        params.require(:clothing_item).permit(:image_url, :clothing_type, :color, :clothing_category_id)
    end 

    def handle_record_not_found(exception)
        render json: {error: exception.message}, status: :not_found
    end 

    def handle_record_invalid(exception)
        render json: {error: exception.record.errors}, status: :unprocessable_entity
    end 
end
