Restore your own Docker Registry v2
--------------------

With this image, you can restore directly your repository:

Name your tarball as `registry-data.tar` and simply run:

```bash
docker run --volumes-from <REGISTRY CONTAINER ID> -v $(pwd):/backup registry-restore
```
