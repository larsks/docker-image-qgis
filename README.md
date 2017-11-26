I run it something like this:

    docker run \
      --rm \
      -v $HOME:$HOME \
      -v /etc/passwd:/etc/passwd \
      -v /etc/group:/etc/group \
      -v /tmp:/tmp \
      -w "$PWD" \
      -u $UID \
      -e DISPLAY=unix$DISPLAY \
      -e HOME=$HOME \
      --net=host \
      larsks/qgis qgis
