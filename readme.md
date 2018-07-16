# Yarn Bot

Checks YARN for finished Applications and notifies the user via Telegram Bot

## Usage

```
docker run -e apiKey= -e chatId= -e yarnUi= krlng/yarnbot
```

* `apiKey`: with your api key for Telegram ([how to get an api key?](https://www.tutonaut.de/anleitung-einfuehrung-in-telegram-bots-nachrichten-und-dateien-aus-dem-terminal-senden/))
* `chatId`: the Telegram GroupID to send the messages to
* `yarnUi`: The YARN Resource Manager 

You can also configure an environment file and add it like this:

```
docker run --env-file $(pwd)/credentials.config krlng/yarnbot
```
