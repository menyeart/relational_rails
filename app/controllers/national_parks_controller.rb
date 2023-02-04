class NationalParksController < ApplicationController
  def index
    @national_parks = NationalPark.all
    @national_parks_sorted = NationalPark.order_by_most_recent
  end

  def show
    @national_park = NationalPark.find(params[:id])
    @count_children = @national_park.count_children
  end

  def new
  end

  def create
    glacier = NationalPark.create(national_park_params)
    redirect_to "/national_parks/"
  end

  def national_park_params
    params.permit(:name, :state, :total_acres, :charges_fee)
  end

end