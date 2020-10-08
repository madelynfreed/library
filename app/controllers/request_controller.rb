class RequestController < ApplicationController
  def create
    title = params['title']
    email = params['email']
    if title && email
      book = Book.find_by(title: title)
      create_request_and_book book, email, title
    else
      render json: {"message" => "Please provide email and book title"}, status: :bad_request
    end
  end

  private

  def create_request_and_book book, email, title
      if book
        available = book.available
        book_request = Request.create(email: email, book: book)

        render_success title, book_request, available
      else
        book = Book.create(title: title, available: false)
        available = false
        book_request = Request.create(email: email, book: book)

        render_success title, book_request, available
      end

  end
  def render_success title, book_request, available
        render json: {
          "id" => book_request.id,
          "available" => available,
          "title" => title,
          "timestamp" => DateTime.now
        },
        status: :ok
  end
end
