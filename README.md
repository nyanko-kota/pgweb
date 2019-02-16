### How to use?

```
version: '3'
services:
    pgweb:
      build: ./docker/pgweb
      container_name: "pgweb"
      ports:
          - "8081:8081"
      environment:
          - DATABASE_URL=postgres://root:password@postgres:5432/${DBname}?sslmode=disable
      links:
          - postgres:postgres
      restart: always
      depends_on:
          - postgres
      command: wait.sh
```

### 注意
1.
wait.shの中にDBのパスワードを記載してくささい。
環境変数を渡しています。

2.
docker-compose.ymlの
- DATABASE_URL=postgres://root:password@postgres:5432/${DBname}?
の${DBname}にデータベースの名前を記載してください。
e,g,
- DATABASE_URL=postgres://root:password@postgres:5432/sample?
