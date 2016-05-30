class PagesController < ApplicationController
    def home
      if logged_in?
        @croak = current_user.croaks.build
        @feed_items = current_user.feed.paginate(page: params[:page])
      end
    end

    def about
    end
end
