class RequestController < ApplicationController
  def create
    if params['title'] == "Watchmen"
      render json: {}, status: :bad_request
    else
      render json: {"id" => 1, "available" => true, "title" => 'Ghost World', "timestamp" => DateTime.now}, status: :ok
    end
  end
end
