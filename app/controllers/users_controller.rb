class UsersController < ApplicationController
  def dashboard
    skip_authorization
    # @requests_received = Request.where(user_book: current_user.user_books)
    @requests_received = current_user.requests_received
    @requests_made = current_user.requests
    @requests_active = ["active", "active", "active"]
  end
end
