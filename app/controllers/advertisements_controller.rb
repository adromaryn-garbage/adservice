class AdvertisementsController < ApplicationController
  before_action :authenticate_user!, only: [:show, :edit, :update, :new, :create, :destroy]
  before_action :set_advertisement,  only: [:show, :edit, :update, :destroy]

  def index
    @advertisements = Advertisement.all
  end

  def show
  end

  def new
    @advertisement = Advertisement.new
  end

  def edit
  end
  
  def create
    @advertisement = Advertisement.new(advertisement_params)
    @advertisement.user_id = current_user.id

    respond_to do |format|
      if @advertisement.save
        format.html { redirect_to advertisements_path, notice: 'Advertisement was successfully created.' }
        #format.json { render :show, status: :created, location: @advertisement }
      else
        format.html { render :new }
        #format.json { render json: @advertisement.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @advertisement.user_id = current_user.id && @advertisement.update(advertisement_params)
        format.html { redirect_to advertisements_path, notice: 'Advertisement was successfully updated.' }
        #format.json { render :show, status: :ok, location: @advertisement }
      else
        format.html { render :edit }
        #format.json { render json: @advertisement.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    if @advertisement.user_id = current_user.id
      @advertisement.destroy
      respond_to do |format|
        format.html { redirect_to advertisements_url, notice: 'Advertisement was successfully destroyed.' }
        #format.json { head :no_content }
      end
    end
  end

  private
  
    def set_advertisement
      @advertisement = Advertisement.find(params[:id])
    end

    def advertisement_params
      params.require(:advertisement).permit(:text, :image)
    end
end
