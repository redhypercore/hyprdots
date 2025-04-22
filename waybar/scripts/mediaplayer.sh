#!/bin/bash

# Проверяем статус Bluetooth
if pactl list sinks | grep -q "bluetooth"; then
    BT_ICON=""
else
    BT_ICON=""
fi

# Получаем громкость
VOLUME=$(pamixer --get-volume)
if [ "$(pamixer --get-mute)" = "true" ]; then
    VOL_ICON=""
else
    if [ "$VOLUME" -ge 50 ]; then
        VOL_ICON=""
    elif [ "$VOLUME" -gt 0 ]; then
        VOL_ICON=""
    else
        VOL_ICON=""
    fi
fi

# Статус плеера
PLAYER_STATUS=$(playerctl status 2>/dev/null)
if [ "$PLAYER_STATUS" = "Playing" ]; then
    PLAY_ICON="⏸"
elif [ "$PLAYER_STATUS" = "Paused" ]; then
    PLAY_ICON="▶"
else
    PLAY_ICON=""
fi

# Вывод
echo "{\"text\": \"$BT_ICON $VOL_ICON $VOLUME% $PLAY_ICON\", \"tooltip\": \"Volume: $VOLUME%\"}"
