class RequestController < ApplicationController
  def create
    render json: {}, status: :bad_request
  end
end
