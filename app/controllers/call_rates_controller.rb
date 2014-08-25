class CallRatesController < ApplicationController
  def index
    if params[:q].nil? || params[:q].strip.length < 3
      render status: :bad_request, json: {
        status: :error,
        message: 'The query must be at least 3 characters long.'
      }

      return
    end

    @call_rates = CallRate.where("LOWER(traffic_direction) LIKE LOWER(:query)", {
      query: "%#{params[:q]}%"
    }).order('traffic_direction ASC')

    respond_to do |format|
      format.json
    end
  end
end
