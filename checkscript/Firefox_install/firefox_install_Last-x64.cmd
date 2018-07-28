echo 64-bit
:: wget скачиваем с https://eternallybored.org/misc/wget/
:: ключи для скачивания на http://ftp.mozilla.org/pub/firefox/releases/latest/README.txt
wget -O FirefoxLast_x64.exe  "https://download.mozilla.org/?product=firefox-latest&os=win64&lang=ru"
FirefoxLast_x64.exe /s
del FirefoxLast_x64.exe

:EOF
