class UserBooksController < ApplicationController
  def index
    @user_books = policy_scope(UserBook)
  end

  # def show
  #   @post = policy_scope(UserBook).find(params[:id])
  # end

  # def new
  # end

  # def create
  # end

  # def edit
  # end

  # def update
  # end

  # def destroy
  # end
end
