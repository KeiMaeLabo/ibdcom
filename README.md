みんなでつなぐ IBDの「わ」  
all together IBD's circle  
====
概要 Overview  
IBD（炎症性腸疾患）患者さんのためのWEBコミュニティ  
WEB community for patients of IBD  

## 特徴 Description
・患者さんの見える化（Visualize patients）  
患者さんの簡易プロフィールを一覧表示。安心感や共感を。  
・コミュニケーション（Communication）  
気軽にコミュニケーションできるようように質問とコメント機能あり。  
・SNSのハブ（Hub for SNS）  
プロフィールにSNSリンクを設置し気になった方のSNSに繋ぐ。  

## デモ画面 Demo
![demo](https://i.gyazo.com/65525ac71af9257034bd15dab527e136.mp4)  

## 利用条件 Requirement
潰瘍性大腸炎またはクローン病と診断されている方、そのご家族  

## ライセンス Licence
Copyright © 2020-2020 KeiMaeLabo All Rights Reserved.  


## DB design

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|null: false|
|password|string|null: false|
|image|text||
|age|integer|null: false|
|privacy|integer||
|sex|string|null: false|
|disease|string|null: false|
|history|integer|null: false|
|status|string|null: false|
|word|text||
|SNS|text||
### Association
- has_many :posts
- has_many :comments

## postsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- has_many :comments

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|post_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :post