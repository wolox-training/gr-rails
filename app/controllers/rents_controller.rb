class RentsController < ApplicationController
  include Wor::Paginate

  def create
    if user_signed_in?
      Rent.create(user_id: params[:user_id], book_id: params[:book_id],
                  from: params[:from], to: params[:to], returned_at: params[:returned_at])
    else
      render json: {}, status: 401
    end
  end

  def index
    if user_signed_in?
      @rents = User.first.rents
      render_paginated @rents, each_serializer: RentSerializer
    else
      render json: {}, status: 401
    end
  end

  def show
    if user_signed_in?
      @rents = Rent.find(params[:id])
      render json: @rents, serializer: RentSerializer
    else
      render json: {}, status: 401
    end
  end

  def destroy
    if user_signed_in?
      Rent.find(params[:user_id]).destroy
    else
      render json: {}, status: 401
    end
  end
end
