class BooksController < ApplicationController
 def index
   @books = Book.all
   @book = Book.new
 end

 def create
  #1.データを新規登録するためのインスタンス作成
  book = Book.new(book_params)
  #2. データをデータベースに保存するためのsaveメソッド実行
  book.save
  #3.Books画面へリダイレクト → edirect_to '/books'を削除 → 詳細画面へリダイレクト
  redirect_to books_path(book.id)
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
  book.update(book_params)
  redirect_to books_path(book.id) #詳細画面へリダイレクトさせたい
 end

 def destroy
  book = Book.find(params[:id]) #データ(レコード)を1件取得
  book.destroy #データ（レコード）を削除
  redirect_to books_path
 end

 private
  #ストロングパラメータ
 def book_params
  params.require(:book).permit(:title, :body)
 end
end