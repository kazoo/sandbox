# -*- coding: utf-8 -*-

class BooksController < ApplicationController
  # GET /books
  # GET /books.json
  def index
    @books = Book.all

    # respond_to は、指定されたフォーマットに応じて異なるテンプレートを呼び出す
    respond_to do |format|
      format.html # index.html.erb
      format.xml { render xml: @books }
      format.json { render json: @books }
    end
  end

  # GET /books/1
  # GET /books/1.json
  def show

    # config/routes.rb の resources によって、
    # show メソッドは/books/:id(.:format)というフォーマットに関連付いているので、
    # /books/1 のような URL で呼び出される事を想定
    @book = Book.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @book }
    end
  end

  # GET /books/new
  # GET /books/new.json
  def new
    @book = Book.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @book }
    end
  end

  # GET /books/1/edit
  def edit
    @book = Book.find(params[:id])
  end

  # POST /books
  # POST /books.json
  def create
    # param メソッドは、
    # ・ルートパラメータを取得する
    # ・フォームからのポストデータを取得する
    # params[:book] は、book[...]で名前付けされたすべての入力値（ハッシュ）
    @book = Book.new(params[:book])

    # save の正否によって、またフォーマットによって処理を振り分け
    respond_to do |format|
      if @book.save
        # redirect_to メソッドは引数 url で指定されたパスにジャンプ
        # また、このオプションの :notice が、 show.html.erb の notice に渡される
        format.html { redirect_to @book, notice: 'Book was successfully created.' }
        format.json { render json: @book, status: :created, location: @book }
      else
        # action オプションは、指定された名前に対応するテンプレートを呼び出す
        # （呼び出されるのはアクションメソッドでなく、あくまでテンプレートファイル）
        format.html { render action: "new" }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end

      # ↑JSONの場合、成功時には保存したBookオブジェクト(@book)を返し、
      # 失敗時には、エラー情報(@book.errors)を返している）
    end
  end

  # PUT /books/1
  # PUT /books/1.json
  def update
    # find で対象のオブジェクトを取得しておく
    @book = Book.find(params[:id])

    respond_to do |format|
      # update_attributes(attr) メソッドは、
      # 引数に渡された値（「プロパティ=>値」のハッシュ形式）で
      # オブジェクトの対応するプロパティを書き換え、DBに格納する
      if @book.update_attributes(params[:book])
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book = Book.find(params[:id])
    @book.destroy

    respond_to do |format|
      format.html { redirect_to books_url }
      format.json { head :no_content }
    end
  end
end
