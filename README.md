# Hadoop with Docker

- [download hadoop-3.1.1.tar.gz](https://hadoop.apache.org/release/3.1.1.html).

```
├── hadoop
│   ├── Dockerfile
│   ├── prepare_hadoop.sh 
│   ├── hadoop-3.1.1.tar.gz
│   └── conf
│       ├── core-site.xml
│       ├── dfs-site.xml
│       ├── mapred-site.xml
│       └── yarn-site.xml
```

``` shell
docker build -t hadoop -f Dockerfile .
```

``` shell
docker run -it --name hadoop --rm -p 50070:50070 -p 8088:8088 hadoop:latest
```

After that, open in browser:

> http://localhost:50070

> http://localhost:8088
