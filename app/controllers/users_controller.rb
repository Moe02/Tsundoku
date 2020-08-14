class UsersController < ApplicationController
  def dashboard
    skip_authorization
    # @requests_received = Request.where(user_book: current_user.user_books)
    @requests_received = current_user.requests_received.where(status: "pending")
    @requests_made = current_user.requests.where(status: "pending")
    @borrowed = current_user.requests.where(status: "active")
    @loaned = current_user.requests_received.where(status: "active")
    @history = Request.where(status: "history")
  end
end
