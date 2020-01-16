class ApplicationController < ActionController::API
    def authenticate
        authorization_header = request.headers[:authorization]
        if (!authorization_header)
            render status: :unauthorized
        else 
            secret_key = Rails.application.secrets.secret_key_base[0]
            token = authorization_header.split(" ")[1]
            decoded_token = JWT.decode(token, secret_key)[0]
            @user = User.find(decoded_token["user_id"]) 
        end 
    end 
end
