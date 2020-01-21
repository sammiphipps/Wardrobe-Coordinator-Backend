class OutfitsController < ApplicationController

    rescue_from ActiveRecord::RecordNotFound, with: :handle_record_not_found
    rescue_from ActiveRecord::RecordInvalid, with: :handle_record_invalid

    before_action :authenticate, only: [:index_by_user, :create, :destroy]

    def index 
        outfits = Outfit.all
        render json: outfits, include: [:clothing_items => {include: [:clothing_category => {only: [:name]}] , except: [:user_id, :created_at, :updated_at, :clothing_category_id]}]
    end 

    def index_by_user
        user = User.find_by(username: @user.username)
        if (user)
            outfits = Outfit.where(user_id: user.id)
            render json: outfits, include: [:clothing_items => {include: [:clothing_category => {only: [:name]}] , except: [:user_id, :created_at, :updated_at, :clothing_category_id]}]
        else 
            render json: {error: "Username not present in database."}
        end 
    end 

    def show 
        outfit = Outfit.find(params[:id])
        render json: outfit, include: [:clothing_items => {include: [:clothing_category => {only: [:name]}] , except: [:user_id, :created_at, :updated_at, :clothing_category_id]}]
    end 

    def create
        outfit = Outfit.create(user_id: @user.id)
        render json: outfit, include: [:clothing_items => {include: [:clothing_category => {only: [:name]}] , except: [:user_id, :created_at, :updated_at, :clothing_category_id]}]
    end 

    def destroy 
        outfit = Outfit.find(params[:id])
        outfit.destroy
        render json: {status: 204, message: "Outfit has been destroyed."}
    end 

    private

    def handle_record_not_found(exception)
        render json: {error: exception.message}, status: :not_found
    end 

    def handle_record_invalid(exception)
        render json: {error: exception.record.errors}, status: :unprocessable_entity
    end 

end
