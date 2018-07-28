echo 32-bit
:: wget скачиваем с https://eternallybored.org/misc/wget/
:: ключи для скачивания на http://ftp.mozilla.org/pub/firefox/releases/latest/README.txt
wget -O FirefoxLast_x32.exe  "https://download.mozilla.org/?product=firefox-latest&os=win&lang=ru"
FirefoxLast_x32.exe /s
del FirefoxLast_x32.exe

:EOF

