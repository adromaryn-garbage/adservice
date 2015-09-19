class UsersController < ApplicationController
  
  before_action :authenticate_user!, except: :coords
  
  def show
    @user=User.find(params[:id])
    @coords=Geocoder.coordinates("#{@user.address},#{@user.city},#{@user.state},#{@user.zip},#{@user.country}")
  end
  def current_user_profile
    redirect_to current_user
  end
  
  def coords
    address=params[:address]
    if request.xhr?
      render :json => {
        coords: Geocoder.coordinates(address)
      }
     end
  end
end
