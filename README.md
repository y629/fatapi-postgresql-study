参考：https://qiita.com/mtitg/items/47770e9a562dd150631d

Docker化しただけで大部分は参考のものと同じです．

目的
- Python から DB をいじる方法のお勉強
- データベースへの CRUD 操作を Web API 化する方法のお勉強

DB 接続して CRUD する Python 製 API サーバーを構築．
- PostgreSQL でデータベースを構築．
- FastAPI で データベースの CRUD 処理を Web API 化．
  - テーブルの操作は sqlalchemy, psycopg2 を利用．
- データベースと，APIサーバをそれぞれコンテナ化し，Docker Compose で稼働

# 動かし方

1. docker イメージのビルド
```
docker build . -t myclient
```

2. docker compose でサービス稼働
```
docker compose up -d
```

3. テーブルのレコード一覧取得(GET)
```
curl localhost:8000/todos/
# 出力
# []
```
最初は何も入ってないので空です．

4. テーブルにレコード追加(jsonのペイロードをPOST)
```
curl \
-X POST localhost:8000/todos/ \
-H  'accept: application/json' \
-H  'Content-Type: application/json' \
-d '{"title":"hoge", "done":false}'
# 出力
# [{"id":1,"done":false,"title":"hoge"}]
```

```
curl localhost:8000/todos/
# 出力
# [{"id":1,"done":false,"title":"hoge"}]
```

5. 使用したコンテナの停止・削除
```
docker compose down
```

# SwaggerUI の使用
http://localhost:8000/docs にブラウザでアクセスすると，SwaggerUI を用いてブラウザ上で API を利用できる．

上のような `curl` コマンドを実行しなくても，レコード一覧の取得やレコードの追加，更新，削除などができるようになっている．

# Next

https://github.com/shibuiwilliam/ml-system-in-actions/tree/main/chapter2_training/model_db

を参考にして，プロジェクト，モデル，実験管理のデータベースとそのAPIを作成する．

実験の履歴をデータベースで管理でき，REST API で操作できるので便利．

