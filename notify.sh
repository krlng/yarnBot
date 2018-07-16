#!/bin/sh
export text=$1
curl -X  POST "https://api.telegram.org/bot$apiKey/sendMessage?chat_id=-$chatId&text=$text"
