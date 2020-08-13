class UserBooksController < ApplicationController
  def index
    if params[:search].blank?
      # this guy will be ordered by distance eventually
      @user_books = policy_scope(UserBook)
    else
      @user_books = policy_scope(UserBook).global_search(params[:search])
    end
  end

  def show
    @user_book = policy_scope(UserBook).find(params[:id])
    @user = @user_book.user
    authorize @user_book
  end

  def user_book_search
    # recieves search data - through params?
    # if params[:search].blank?
    #   # this guy will be ordered by distance eventually
    #   @user_books
    # else
    #   @user_books = UserBook.where("title, author ILIKE %?%", params[:search].downcase)
    # end
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
