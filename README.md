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
| nickname           | string              | null: false,              |
| email              | string              | null: false, unique: true |
| encrypted_password | string              | null: false               |
| family_name        | string              | null: false               |
| farst_name         | string              | null: false               |
| family_name_kana   | string              | null: false               |
| farst_name_kana    | string              | null: false               |
| birth_day          | date                | null: false               |

has_many : items
has_many : buyers





itemsテーブル

| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| user               | references          | null: false, foreign_key: true |
| category_id        | integer             | null: false               |
| condition_id       | integer             | null: false               |
| delivery_charge_id | integer             | null: false               |
| prefecture_id      | integer             | null: false               |
| estimated_day_id   | integer             | null: false               |
| price              | integer             | null: false               |
| item-info          | text                | null: false               |
| item-name          | string              | null: false               |

belongs_to :user
has_one :buyer



buyersテーブル

| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| user               | references          | null: false, foreign_key: true |
| item               | references          | null: false, foreign_key: true |


belongs_to :user
belongs_to :item
has_one :sending_address



sending_addressesテーブル

| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| buyer              | references          | null: false, foreign_key: true |
| post_code          | string              | null: false               |
| prefecture_id      | integer             | null: false               |
| city               | string              | null: false               |
| address            | string              | null: false               |
| building_name      | string              |                           |
| phone              | string              | null: false               |

belongs_to :buyer