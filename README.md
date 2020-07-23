# みんなでつなぐ IBDの「わ」  
====  
## 概要 Overview  
IBD（炎症性腸疾患）患者さんのためのWEBコミュニティ  
WEB community for patients of IBD  
  
## 🌐 本番環境 URL

### **https://ibdcom.herokuapp.com/**  
　
## :white_check_mark: 特徴 Description  

### **1. 患者さんの見える化（Visualize patients）**  
  患者さんの簡易プロフィールを一覧表示。安心感や共感を。  

### **2. コミュニケーション（Communication）**   
  気軽にコミュニケーションできるようように質問とコメント機能あり。  

### **3. SNSのハブ（Hub for SNS）**    
  プロフィールにSNSリンクを設置し気になった方のSNSに繋ぐ。  
  
## デモ画面 Demo
[![Image from Gyazo](https://i.gyazo.com/65525ac71af9257034bd15dab527e136.gif)](https://gyazo.com/65525ac71af9257034bd15dab527e136)
  
## 利用条件 Requirement  
  
潰瘍性大腸炎またはクローン病と診断されている方、そのご家族  
（現状はどなたでもご利用ください。）  
  
## ライセンス Licence  
  
Copyright © 2020-2020 KeiMaeLabo All Rights Reserved.  
  
## DB設計
  
### usersテーブル
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

### postsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- has_many :comments

### commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|post_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :post
