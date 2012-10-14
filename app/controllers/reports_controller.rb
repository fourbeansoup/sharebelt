class ReportsController < ApplicationController
  respond_to :json

  def show
    render :json => Array.new
  end
end
