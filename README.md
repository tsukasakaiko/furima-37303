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
| password           | string              | null: false               |
| family_name        | string              | null: false               |
| farst_name         | string              | null: false               |
| family_name_kana   | string              | null: false               |
| farst_name_kana    | string              | null: false               |
| birth_day          | date                | null: false               |


itemsテーブル

| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| user_id            | integer             | null: false,foreign_key: true|
| nickname           | string              | null: false               |
| category           | string              | null: false               |
| condition          | string              | null: false               |
| delivery_charge    | string              | null: false               |
| shipment_place     | string              | null: false               |
| estimated_day      | string              | null: false               |

buyerテーブル

| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| user_id            | integer             | null: false,foreign_key: true|
| nickname           | string              | null: false               |
| category           | string              | null: false               |
| condition          | string              | null: false               |
| delivery_charge    | string              | null: false               |
| shipment_place     | string              | null: false               |
| estimated_day      | string              | null: false               |

sending_addressテーブル

| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| user_id            | integer             | null: false,foreign_key: true|
| post_code          | string              | null: false               |
| prefecture         | string              | null: false               |
| city               | string              | null: false               |
| address            | string              | null: false               |
| building_name      | string              | null: false               |
| phone              | integer             | null: false               |