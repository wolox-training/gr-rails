class ApplicationController < ActionController::Base
    include Pundit
  protect_from_forgery with: :null_session

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized


  def user_not_authorized
      puts "Aguante el paco vieja"
      render json: {}, status: 401
  end
end
