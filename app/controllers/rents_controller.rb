class RentsController < ApplicationController
  include Wor::Paginate
  before_action :authenticate_user!

  def create
    rent = Rent.create(rent_creation_params)
    authorize rent
    MailerWorker.perform_async(Rent.last.id)
  end

  def index
    @rents = User.first.rents
    authorize @rents
    render_paginated @rents, each_serializer: RentSerializer
  end

  def show
    @rent = Rent.find(params[:id])
    authorize @rent
    render json: @rent, serializer: RentSerializer
  end

  def destroy
    authorize Rent.find(params[:user_id])
    Rent.find(params[:user_id]).destroy
  end

  def rent_creation_params
    params.permit(:user_id, :book_id, :from, :to, :returned_at)
  end
end
