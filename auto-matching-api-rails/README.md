API Rails Server for Auto Matching
===

## 初期設定

### .env作成

.env.sample をコピーして、.envを作成する

### データベース作成

このコマンドで、 db:drop, db:create, ridgepole:apply, db:seed_fu を順番に実行する。

```
rails db:recovery
```

