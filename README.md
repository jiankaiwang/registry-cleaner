# Registry Cleaner

[![https://hub.docker.com/r/jiankaiwang/registry-cleaner](https://img.shields.io/static/v1?label=docker_build&message=passing&color=success)](https://hub.docker.com/r/jiankaiwang/registry-cleaner) ![](https://img.shields.io/github/stars/jiankaiwang/registry-cleaner?style=social)

Build an automatic cleaner for the docker registry.

## Build an image

```sh
docker build -f ./registry_cleaner.dockerfile \
             -t registry-cleaner:latest .
```

## Configure your cleaner

You can also change the policy of cleaning registry. You can edit the `cron` file for the desired cron job.

```text
# MIN HOUR  DOM MON DOW CMD
* * * * * sh /cron/clean.sh 2>&1
```

## Run a container

Before running a container, you have to prepare the registry configure yaml file (`gc.yaml`). You can mount it as well. The following is the example for cleaning registry if the registry volume is mounted at `/var/lib/registry`.

```yaml
# the yaml for garbage collection
version: 0.1
storage:
  filesystem:
    rootdirectory: /var/lib/registry
```

After preparing the garbage collection configure, you have to assign two mount points, the volume path and the garbage collection configure path.

```sh
docker run -it -d --name registry-cleaner \
           -v /path/to/your/volume:/var/lib/registry \
           -v /path/to/crons:/cron/crons \
           -v /path/to/gc.yaml:/etc/docker/registry/gc.yaml \
           registry-cleaner:latest
```

