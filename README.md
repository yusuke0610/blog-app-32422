## アプリケーション名
  # blog-app-32422
## アプリケーション概要
  # 投稿することだけできるブログ
  # Google API により

## URL
  # https://blog-app-32422.herokuapp.com/
## テスト用アカウント
  # ID admin
  # pass 2222
## 利用方法
 # user管理機能
  # トップページから新規登録する
  # google アカウントでもサインインできる
  
 # tweet管理機能
  # Blog ボタンを押すことで投稿画面に遷移する
  # 投稿内容を入力し完了するとトップページに遷移する
  # 入力漏れがあると投稿ページに止まる

## 目指した課題解決
  # google APIの実装
  # bootstrap 導入
## 洗い出した要件
  # user管理
  # tweet管理
  # comment管理
  # google API 管理
  # 投稿内容検索機能
  # mypage 機能
## 実装した機能についてのGIFと説明
  

## データベース設計

 ## table
  # users

  | column                | type             |option              |
  |-----------------------|------------------|--------------------|
  | name                  | string           | null:false         |
  | email                 | string           | unique:true        |
  | password              | string           | null:false         |
  | encrypted_password    | string           | null:false         |

  # association
  - has_many :tweets
  - has_many :comments

  # tweets

  | column             | type             | option             |
  |--------------------|------------------|--------------------|
  | title              | string           | null:false         |
  | text               | text             | null:false         |
  | user               | references       | foreign_key:true   |
  
  # association
  - belongs_to :user
  - has_many :comments
  - has_many :tweet_tag_relations

  # comments

  | column             | type             | option             |
  |--------------------|------------------|--------------------|
  | comment            | text             | null:false         | 
  | user               | references       | foreign_key:true   |
  | tweet              | references       | foreign_key:true   |

  # association
  - belongs_to :user
  - belongs_to :tweet


## ローカルでの動作方法

