class ImpressionsController < ApplicationController
  before_filter :find_site

  respond_to :json

  def index
    @referrer = Referrer.for(params[:referrer],params[:location])
    @impression = @site.impressions.create(referring_url: params[:referrer], landing_url: params[:location])
  end

  def click
    @impression = @site.impressions.find(params[:id]).click!
    render :nothing => true
  end

  protected

  def find_site
    @site = Site.find(params[:site_id])
  end
end
