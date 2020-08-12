class UserBooksController < ApplicationController
  def index
    if params[:search].blank?
      # this guy will be ordered by distance eventually
      @user_books = policy_scope(UserBook)
    else
      books = Book.where("title ILIKE '%#{params[:search].downcase}%'")
      # raise
      @temp_user_books = policy_scope(UserBook)
      @user_books = []
      @temp_user_books.each do |book|
        if books.include?(book)
          @user_books << book
        end
      end
    end
    @user_books
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
