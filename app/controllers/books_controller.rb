class BooksController < ApplicationController
  def show
      @book = Book.find(params[:id])
  end
    

  def create
  end

  def delete
  end

  def edit
      @book = Book.find(params[:id])
  end

  def index
      @books = Book.all
      #@books = Book.order_by params[:order_by]
      #which one ??
  end
    
  def update
    @book = Book.find(params[:id])  
    if @book.update(book_params)
      flash[:notice] = 'Book was successfully updated.' 
      redirect_to @book
    else
      render :edit
    end
  end
  
  private
    # Only allow a trusted parameter "white list" through.
    def book_params
      # params is a hashtable.  It should have in it a key of :book.
      # The value for the :book key is another hash.
      # If params does not contain the key :book, an exception is raised.  
      # Only the "book" hash is returned and only with the permitted key(s).
      # So returns a hash with only having at most keys of :title, :year, :author_id
      params.require(:book).permit(:name)
    end
end
