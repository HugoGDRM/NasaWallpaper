#!/bin/sh

API_KEY='jMdo36dPD6VCbYqE2bmj6YMwc8oGw74NoALqEAUB'

/bin/wget -q -O /tmp/nasa.out "https://api.nasa.gov/planetary/apod?api_key=${API_KEY}&count=1" 

URL=$(cat /tmp/nasa.out | jq '.[].hdurl' | grep -oP '[^"]+')
/bin/wget -q -O /tmp/nase.picture $URL

feh --bg-center /tmp/nase.picture
