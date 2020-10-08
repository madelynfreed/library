class RequestController < ApplicationController
  def create
    if params['title'] && params['email']
      book = Book.find_by(title: params['title'])
      if book
        available = Book.find_by(title: params['title']).available
        Request.create(email: params['email'], book: book)

        render json: {
          "id" => 1,
          "available" => available,
          "title" => params['title'],
          "timestamp" => DateTime.now
        },
        status: :ok
      else
        Book.create(title: params['title'], available: false)
        Request.create(email: params['email'], book: book)
        render json: {
          "id" => 1,
          "available" => false,
          "title" => params['title'],
          "timestamp" => DateTime.now
        },
        status: :ok
      end
    else
      render json: {"message" => "Please provide email and book title"}, status: :bad_request
    end
  end
end
