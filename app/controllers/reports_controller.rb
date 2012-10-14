class ReportsController < ApplicationController
  respond_to :json

  def show
    x = [
      {
        key:"Impressions",
        values: [
          {
            x: Date.today - 1.day,
            y: 5,
          },
          {
            x: Date.today,
            y: 10,
          },
        ]
      },
      {
        key:"Clicks",
        values: [
          {
            x: Date.today - 1.day,
            y: 3,
          },
          {
            x: Date.today,
            y: 2,
          },
        ]
      },
    ]
    render :json => x
  end
end
