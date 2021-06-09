class BooksController < ApplicationController
  def index
   @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book=Book.new
  end

  def create
    book = Book.new(list_params)
    if book.save
    redirect_to book_path(book.id)
    else
    render action: :new
    end
    flash[:notice] = "Book was created successfully"
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    if book.update(list_params)
    redirect_to book_path(book.id)
    else
    render action: :edit
    end
    flash[:notice] = "Book was updated successfully"
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
    flash[:notice] = "Book was destroyed successfully"
  end

  private
  def list_params
    params.require(:book).permit(:title, :body)
  end

end