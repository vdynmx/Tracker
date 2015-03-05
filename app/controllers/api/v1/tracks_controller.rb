class Api::V1::TracksController < ApplicationController
before_action :set_track, only: [:show, :edit, :update, :destroy]
respond_to :json

def create
  @track = Track.new(track_params)
  if @track.save
    flash[:notice] = 'Track was successfully saved.'
    respond_with @track.as_json, location:nil
  else
    flash[:notice] = 'Error has occured'
    respond_with @track.errors
  end
end

def update
  @track.update(track_params)
  if @track.save
    flash[:notice] = 'Track was updated.'
    respond_with @track
  else
    flash[:notice] = 'Track not updated.'
    respond_with @track.errors
  end
end

def destroy
  @track.destroy
  respond_with @track
end

private

def track_params
  params.require(:track).permit(:title, :trackpoint, :timestamp, :duration, :moving_time, :speed_avg, :moving_speed_avg, :speed_max, :elevation_min, :elevation_max, :elevation_gain, :grade_min, :grade_max, :total_dist)
end

def error(status, message = 'Error has occured')
  response = {response_type: "Error", message: message}
  render json: response.to_json, status: status
end

def permission_denied_error
  error(403, 'Permission Denied!')
end

def set_track
  @track = Track.find(params[:id])
end




end