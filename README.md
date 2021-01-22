## アプリケーション名
  # blog-app-32422
## アプリケーション概要
  投稿することだけできるブログ
  Google API により

## URL
  
## テスト用アカウント

## 利用方法

## 目指した課題解決
  

## 洗い出した要件

## 実装した機能についてのGIFと説明

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

