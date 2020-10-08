class RequestController < ApplicationController
  def create
    title = params['title']
    email = params['email']
    if title && email
      book = Book.find_by(title: title)
      if book
        available = Book.find_by(title: title).available
        book_request = Request.create(email: email, book: book)

        render json: {
          "id" => book_request.id,
          "available" => available,
          "title" => title,
          "timestamp" => DateTime.now
        },
        status: :ok
      else
        book = Book.create(title: title, available: false)
        available = false
        book_request = Request.create(email: email, book: book)
        render json: {
          "id" => book_request.id,
          "available" => available,
          "title" => title,
          "timestamp" => DateTime.now
        },
        status: :ok
      end
    else
      render json: {"message" => "Please provide email and book title"}, status: :bad_request
    end
  end
end
