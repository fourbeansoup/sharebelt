class ImpressionsController < ApplicationController
  respond_to :json
  def index
    @domain = Rails.env == "development" ? "localhost:3000" : "sharebelt.com"
    @referrer = Referrer.for(params[:referrer])
  end
end
