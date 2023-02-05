class NationalParkTrailsController < ApplicationController
  def index
   @national_park = NationalPark.find(params[:national_park_id])
   @trails = @national_park.trails
  end

  def new
    @national_park = NationalPark.find(params[:id])
  end

  def create
    @national_park = NationalPark.find(params[:id])
    Trail.create(national_park_trails_params)
    redirect_to "/national_parks/#{@national_park.id}/trails"
  end

  private
  def national_park_trails_params
    params.permit(:name, :length_miles, :feet_elevation_gain, :water_source, :national_park_id)
  end
end