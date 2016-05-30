class CroaksController < ApplicationController
  #action to create a new croak from the home page
  def create
    @croak = current_user.croaks.build(croak_params)
    if @croak.save
      flash[:success] = "croaked!"
      redirect_to root_url
    else
      @feed_items = current_user.feed.paginate(page: params[:page])
      render 'pages/home'
    end
  end

  #delete a croak
  def destroy
  end

  private
    #filter url paramaters for croak creation
    def croak_params
      params.require(:croak).permit(:content)
    end
end
