# ToLabel

## サイト概要
写真の投稿機能を持ったSNSサイトです。
具体的な機能
・画像の投稿、および任意のタグ付けが可能
・他者の投稿に対してコメントやいいねをつけることが出来る
・気になったユーザーに対しフォローをつけたり、フォローの解除が出来る
・検索フォームを用いてタグに関連した画像を表示

### サイトテーマ
旅先で撮影した写真を投稿して共有し合うSNSサイトです。

### テーマを選んだ理由
自分の体験談として、旅先で撮影した写真がスマートフォンのフォルダやSDカードに埋もれたままになっていることがあり、それらの写真の保管をどのようにするべきか悩んでいました。
そのままフォルダに保管しているとデータが増えるにつれその存在自体忘れてしまったり、かといってクラウドに移動させるのも面倒に感じてしまう。
同じようなシチュエーションに陥ったことのある方は少なくないのではないかと思います。そうした行き場のない写真の保管場所として機能し、かつそれらを元に他者とのコミュニケーションを測れる。
そんなサイトがあればいいなと感じ、アプリケーション作成のテーマとして採用しました。

### ターゲットユーザ
・旅行が好きな方
・写真を撮る・見るのが好きな方
・旅先での写真がフォルダの中で埋もれてしまっている方
・日本や海外の風景や文化に興味のある方

### 主な利用シーン
旅先で撮影した写真の保管、またその時感じたことを共に記録として残しておいたり、自分以外のユーザーと共有する際に使用する。
ユーザーの投稿を旅先の情報収集の為に利用したり、次の旅行先を検討する際にも活用できる。

## 設計書

* ER図  

![ER_toLabel](https://user-images.githubusercontent.com/73771296/105982845-34827000-60db-11eb-8440-780413b62562.png)


* テーブル定義書

https://docs.google.com/spreadsheets/d/1vwhLTPIWMRoYqPbVupnTFtQ9Jwgw_k9AEbS77pBbJ74/edit?usp=sharing

* アプリケーション詳細設計

https://docs.google.com/spreadsheets/d/1qIxOESobN1h4LjA5aoTZRyrk3q8LZ0z05Fx11vqi1nE/edit?usp=sharing

## 機能要素一覧

https://docs.google.com/spreadsheets/d/1h-3z6XyLYxO2Lg3afL6AOYUjer-DqbXTPQu12sQ6jIc/edit?usp=sharing

## 開発環境

- OS：Linux(CentOS)
- 言語：HTML,CSS,JavaScript,Ruby,SQL
- フレームワーク：Ruby on Rails
- JS ライブラリ：jQuery
- IDE：Cloud9
