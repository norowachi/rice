#!/bin/bash

screenshot=$(grimblast copysave "area" /tmp/ss.png);

echo $screenshot;

if [ ! -e "$screenshot" ]; then
  exit 1;
fi

# put token here :3c
ZIPLINE_TOKEN="";

upload="curl -H \"authorization: $ZIPLINE_TOKEN\" https://cdn.noro.cc/api/upload -F file=@/tmp/ss.png -H \"Content-Type: multipart/form-data\" | jq -r .files[0].url | tr -d '\n' | wl-copy";

satty --config "$HOME/.config/satty/zipline.toml" -f "$screenshot" --copy-command "tee /tmp/ss.png && $upload";
