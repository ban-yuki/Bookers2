class BooksController < ApplicationController
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "Welcome! You have signed up successfully."
      redirect_to book_path(@book.id)
    else
      @newbook = Book.new
      @book = Book.new
      @books = Book.all
      @user = current_user
      render :index
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  def index
    @newbook = Book.new
    @book = Book.new
    @books = Book.all
    @user = current_user
  end

  def show
    @book = Book.find(params[:id])
    @newbook = Book.new
    @books = Book.all
    @user = current_user
    flash[:notice] = "You have created book successfully."
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :edit
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end

end
