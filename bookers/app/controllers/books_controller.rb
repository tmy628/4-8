class BooksController < ApplicationController
 def index
   @books = Book.all
   # 投稿一覧
   @book = Book.new
   # 新規投稿
 end

 def create
  @book = Book.new(book_params)
  if @book.save
   # @を付けていなかった
   flash[:notice] = "Book was successfully created."
   redirect_to show_book_path(@book)
  else
   #書き込み失敗
   render :index
  end
 end

 def show
  @book = Book.find(params[:id])
 end

 def new
 end

 def edit
  @book = Book.find(params[:id])
 end

 def update
  book = Book.find(params[:id])
  if book.update(book_params)
   flash[:notice] = "Book was successfully updated."
  redirect_to show_book_path(book.id)
  end
 end

 def destroy
  book = Book.find(params[:id]) #データ(レコード)を1件取得
  if book.destroy #データ（レコード）を削除
   flash[:notice] = "Book was successfully destroyed."
   redirect_to books_path(book.id)
  end
 end

 private
  #ストロングパラメータ
 def book_params
  params.require(:book).permit(:title, :body)
 end
end