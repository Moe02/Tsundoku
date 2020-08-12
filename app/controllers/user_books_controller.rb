class UserBooksController < ApplicationController
  def index
    @user_books = policy_scope(UserBook)
    user_book_search
  end

  def show
    @user_book = policy_scope(UserBook).find(params[:id])
    @user = @user_book.user
    authorize @user_book
  end

  def user_book_search
    # recieves search data - through params?
    search = params[:input]
    if search
      @user_books.where()
    end
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
