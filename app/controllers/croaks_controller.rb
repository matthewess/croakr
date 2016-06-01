class CroaksController < ApplicationController
  before_action :confirm_logged_in, only: [:create, :destroy]
  before_action :confirm_matching, only: :destroy
  #action to create a new croak from the home page
  def create
    @croak = current_user.croaks.build(croak_params)
    if @croak.save
      flash[:success] = "croaked!"
      redirect_to root_path
    else
      @feed_items = current_user.feed.paginate(page: params[:page])
      render 'pages/home'
    end
  end

  #delete a croak
  def destroy
    @croak.destroy
    flash[:success] = "croak deleted!"
    redirect_to request.referrer || root_path
  end

  private
    #filter url paramaters for croak creation
    def croak_params
      params.require(:croak).permit(:content, :picture)
    end

    #confirm user matches croak id
    def confirm_matching
      @croak = current_user.croaks.find_by(id: params[:id])
      redirect_to root_path if @croak.nil?
    end
end
