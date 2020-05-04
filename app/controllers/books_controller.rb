class BooksController < ApplicationController
  # get /books => books#index ,as: books
  def index
    @books = Book.all
    @book = Book.new
  end

  # post /books => books#create, as: books
  def create 
    @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book.id)
      flash[:notice] = "Book was successfully created."
    else
        @books = Book.all
        render "index"
    end

  end

  # get /books/:id/edit => books#edit, as: edit_book
  def edit
    @book = Book.find(params[:id])
  end

  # get /books/:id => books#show ,as: book, as: book
  def show
    @book = Book.find(params[:id])
  end

  # patch(put) /books/:id/ => books#update, as: book
  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    if @book.save
      redirect_to book_path(@book.id)
      flash[:notice] = "Book was successfully updated."
    else
      render :edit
    end
  end

  # delete /books/:id => books#destroy, as: book
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private 

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
