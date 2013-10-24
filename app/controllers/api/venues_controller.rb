module Api
  class VenuesController < ApplicationController
    respond_to :json
    def index
      respond_with Venue.find(:all, :order => 'id')
    end
  end
end
