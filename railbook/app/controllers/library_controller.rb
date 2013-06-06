# -*- coding: utf-8 -*-
# utf-8

# ↑マジックコメントで必ず文字コードを指定

# ファイル名は xxx_controller.rb
# クラス名は大文字始まりの XxxController

class LibraryController < ApplicationController
  def list
    # Book オブジェクト（Model クラス）の all メソッドで、
    # books テーブルからすべてのレコードを取得する
    # all は 'SELECT * FROM books' のような SQL 命令を発行して結果を Book オブジェクトの配列で返す

    @books = Book.all

  end
end
