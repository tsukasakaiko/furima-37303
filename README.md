# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


DB設計
usersテーブル

| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| nickname           | string              | null: false               |
| email              | string              | null: false               |
| encrypted_password | string              | null: false               |
| family_name        | string              | null: false               |
| farst_name         | string              | null: false               |
| family_name_kana   | string              | null: false               |
| farst_name_kana    | string              | null: false               |
| birth_day          | date                | null: false               |

has_many : item





itemsテーブル

| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| user               | integer             | null: false,references_key: true|
| nickname           | string              | null: false               |
| category           | integer             | null: false               |
| condition          | integer             | null: false               |
| delivery_charge    | integer             | null: false               |
| shipment_place     | integer             | null: false               |
| estimated_day      | integer             | null: false               |
| price              | integer             | null: false               |
| product            | string              | null: false               |

belongs_to :user
belongs_to :buyer



buyerテーブル

| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| user               | integer             | null: false,references_key: true|
| nickname           | string              | null: false               |
| category           | string              | null: false               |
| family_name        | string              | null: false               |
| farst_name         | string              | null: false               |
| family_name_kana   | string              | null: false               |
| farst_name_kana    | string              | null: false               |

has_one :items
belongs_to :sending_address



sending_addressテーブル

| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| post_code          | integer             | null: false               |
| prefecture         | string              | null: false               |
| city               | string              | null: false               |
| address            | string              | null: false               |
| building_name      | string              |                           |
| phone              | integer             | null: false               |

has_one :buyer