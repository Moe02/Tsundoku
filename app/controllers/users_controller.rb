class UsersController < ApplicationController
  def dashboard
    skip_authorization
    @requests_received = current_user.requests_received
    @requests_made = current_user.requests_made
    @requests_active = ["active", "active", "active"]
  end
end
