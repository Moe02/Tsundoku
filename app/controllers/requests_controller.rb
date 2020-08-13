class RequestsController < ApplicationController
  def create
    @request = Request.new(request_params)
    @user_book = UserBook.find(params[:user_book_id])
    @request.user_book = @user_book
    @user = current_user
    @request.user = @user
    authorize @request
    if @request.save
      redirect_to dashboard_path, notice: "Sent request successfully"
    else
      render 'user_books/show'
    end
  end

  private

  def request_params
    params.require(:request).permit(:start_date, :end_date)
  end
end
