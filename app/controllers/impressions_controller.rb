class ImpressionsController < ApplicationController
  before_filter :find_site

  respond_to :json

  def index
    @domain = Rails.env == "development" ? "localhost:3000" : "sharebelt.com"
    @referrer = Referrer.for(params[:referrer],params[:location])
  end

  protected

  def find_site
    @site = Site.find(params[:site_id])
  end
end
