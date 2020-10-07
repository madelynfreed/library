class RequestController < ApplicationController
  def create
    if params['title'] && params['email']
      render json: {"id" => 1, "available" => true, "title" => 'Ghost World', "timestamp" => DateTime.now}, status: :ok
    else
      render json: {}, status: :bad_request
    end
  end
end
