class UsersController < ApplicationController
  def dashboard
    skip_authorization
    @requests_received = ["received", "received", "received"]
    @requests_made = ["made", "made", "made", "made"]
    @requests_active = ["active", "active", "active"]
  end
end
