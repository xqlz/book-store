# frozen_string_literal: true

class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id]) # parameters (in routes.rb); from route matching, query strings
  end

  def new
    @book = Book.new
  end

  def create
    book = Book.new(book_params) # sanitized the params

    if book.save
      redirect_to books_path
    else
      render :new # generate new form
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])

    if book.update(book_params)
      redirect_to books_path
    else
      render :edit
    end
  end

  def destroy
    Book.find(params[:id]).destroy
    redirect_to books_path
  end

  private def book_params # sanitizing params - output only the things we need
    params.require(:book).permit(:name, :author, :price, :quantity)
  end
end
