class RequestController < ApplicationController
  def create
    if params['title'] && params['email']
      available = Book.find_by(title: params['title']).available
      render json: {
        "id" => 1,
        "available" => available,
        "title" => params['title'],
        "timestamp" => DateTime.now
      }, status: :ok
    else
      render json: {"message" => "Please provide email and book title"}, status: :bad_request
    end
  end
end
