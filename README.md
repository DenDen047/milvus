# Milvus for Me

## Usage

You can enjoy Milvus with Python.
```sh
$ ./run.sh
```

Now, you can access to `localhost:3000` on your browser and log into the Grafana UI with the default username/password, `admin/admin`, or create your own account.

Don't forget to shutdown docker-compose.
```sh
$ ./stop.sh
```

## TODO
- [ ] try to input the real data
- [ ] use the GUI(https://github.com/milvus-io/milvus/blob/master/docker/docker-compose-monitor.yml)
- [ ] use the monitoring UI
- [x] measure the result of benchmark
- [x] set up the monitoring UI
- [x] use Milvus from Python with [the official document](https://www.milvus.io/docs/guides/get_started/example_code.md)
- [x] try to do [the tutorial](https://www.milvus.io/docs/guides/get_started/install_milvus/cpu_milvus_docker.md) on Mac
