#!/bin/sh

APP=chat
MOD=chat_app
COOKIE=chat

cd `dirname $0`
exec erl \
  -smp auto +K true +A 4 \
  -pa $PWD/ebin $PWD/deps/*/ebin \
  -config etc/app \
  -sname $APP -setcookie $COOKIE \
  -boot start_sasl \
  -s $MOD manual_start $@
