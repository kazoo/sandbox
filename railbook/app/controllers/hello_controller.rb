# -*- coding: utf-8 -*-
# utf-8

class HelloController < ApplicationController

  # public なメソッドがアクションになる
  def index
    # 本来は controller で出力するべきではない
    # テスト用の render メソッド
    # また、このために config/route.rb の最後のコメントアウトを外している(REST的に好ましくない）
    #render :text => 'こんちゃーす'

    # config/application.rb に定義すればアクションメソッドから以下のようにアクセスできる
    # render :text => Railbook::Application.config.author
    
    # このインスタンス変数を「テンプレート変数」と呼ぶ
    # ここにデータを用意することで、アクションメソッドとビュートでデータを受け渡しできる
    @msg = 'hogehoge'

    # デフォルトでは、規約にしたがい index.html.erb がテンプレートとなるが、
    # 任意のテンプレートを以下のように指定することもできる
    render 'hello/show'

    # erb とは XHTML emmbedded ruby のこと
    
  end

  # xxx.html.erb をリクエストすると、
  # 同名のアクションメソッドが検索され呼ばれる
  # アクション定義がなくてもとりあえず view だけ表示する
  def view
  end

end
