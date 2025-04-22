#!/bin/bash

# Получаем список доступных Wi-Fi сетей
WIFI_LIST=$(nmcli -t -f SSID dev wifi list | sort -u)

# Показываем меню через rofi
CHOICE=$(echo -e "$WIFI_LIST" | rofi -dmenu -p "Подключиться к Wi-Fi:")

# Если выбрана сеть, подключаемся
if [ -n "$CHOICE" ]; then
    nmcli dev wifi connect "$CHOICE"
fi
