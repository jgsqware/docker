Backup your own Docker Registry v2
--------------------

With this image, you can backup directly your repository:

Simply run:

```bash
docker run --volumes-from <REGISTRY CONTAINER ID> -v $(pwd):/backup registry-backup
```
