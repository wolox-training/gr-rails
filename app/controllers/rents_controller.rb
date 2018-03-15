class RentsController < ApplicationController
  include Wor::Paginate

  def create
    if user_signed_in?
      Rent.create(rent_creation_params)
      MailerWorker.perform_async(Rent.last.id)
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

  def rent_creation_params
    params.permit(:user_id, :book_id, :from, :to, :returned_at)
  end
end
