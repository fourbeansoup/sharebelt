class ReportsController < ApplicationController
  respond_to :json

  def show
    site = Site.find(params[:id])
    render :json => site.graph_data
  end
end
