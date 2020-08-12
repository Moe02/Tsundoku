class UserBooksController < ApplicationController
  def index
    @user_books = policy_scope(UserBook)
  end
  # one user's bookshelf
  def bookshelf
    @user_book = policy_scope(UserBook).find(params[:id])
    @user = @user_book.user
    @user_books = policy_scope(UserBook).where(user: @user)
    authorize @user_book
  end

  def show
    @user_book = policy_scope(UserBook).find(params[:id])
    @user = @user_book.user
    authorize @user_book
  end


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
