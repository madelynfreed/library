class RequestController < ApplicationController
  def create
    if params['title'] == "Watchmen"
      render json: {}, status: :bad_request
    else
      render json: {}, status: :ok
    end
  end
end
