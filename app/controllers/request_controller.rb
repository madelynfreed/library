class RequestController < ApplicationController
  def create
    title = params['title']
    email = params['email']
    (title && email) ?
      create_request_and_book(email, title) :
      render_failure
  end

  private

  def create_request_and_book email, title
      book = Book.find_by(title: title)
      if book
        available = book.available
      else
        book = Book.create(title: title, available: false)
        available = false
      end
      book_request = Request.create(email: email, book: book)

      render_success title, book_request, available
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

  def render_failure
      render json: {"message" => "Please provide email and book title"}, status: :bad_request
  end
end
