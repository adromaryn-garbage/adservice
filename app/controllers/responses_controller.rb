class ResponsesController < ApplicationController
  before_action :set_response, only: [:destroy]
  before_action :authenticate_user!

  def index
  	@responses = Response.where(addressee:current_user)
    @responses = @responses.paginate(:page => params[:page], :per_page => 5).order('updated_at DESC')
  end

  def new
  	@ad_id = params[:id]
  	if current_user == Advertisement.find(@ad_id).user
  		redirect_to root_path
  	else
      @response = Response.new
    end
  end

  def create
  	if current_user == Advertisement.find(params[:id]).user
  		redirect_to root_path
  	else
      @response = Response.new
      @response.content = (response_params)["content"]
      @response.advertisement = Advertisement.find(params[:id])
      @response.addressee = Advertisement.find(params[:id]).user.id
      @response.user=current_user

      if @response.save
      	redirect_to @response.advertisement
      else
        render :new
      end
    end
  end

  def destroy
  	if current_user.id == @response.addressee
  		@response.destroy
  	end
  	redirect_to root_path
  end

  private
  
    def set_response
      @response = Response.find(params[:id])
    end

    def response_params
      params.require("response").permit("content")
    end
end
