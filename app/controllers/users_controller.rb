class UsersController < ApplicationController
  include Wor::Paginate

  def rents
    if user_signed_in? && current_user.id == params[:user_id]
      @rents = User.first.rents
      render_paginated @rents
    else
      render json: {}, status: 401
    end
  end
end
