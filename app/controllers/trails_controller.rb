class TrailsController < ApplicationController
  def index
    @trails = Trail.all
    @trails = Trail.only_true if params[:subaction] == "Show only trails with water" 
  end

  def show
    @trail = Trail.find(params[:id])
  end

  def edit
    @trail = Trail.find(params[:id])
  end

  def update
    trail = Trail.find(params[:id])
    trail.update(trail_params)
    redirect_to "/trails/#{trail.id}"

  end

  private
    def trail_params
      params.permit(:name, :length_miles, :feet_elevation_gain, :water_source)
    end

end
