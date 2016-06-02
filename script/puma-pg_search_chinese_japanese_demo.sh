#!/bin/bash
#
# puma-fulltextsearch_cj

# chkconfig: 2345 82 55
# processname: puma-pg_search_chinese_japanese_demo
# description: Runs puma-pg_search_chinese_japanese_demo for nginx integration.

# Include RedHat function library
. /etc/rc.d/init.d/functions

# The name of the service
NAME=puma-pg_search_chinese_japanese_demo

# The username and path to the myapp source
USER=deploy
APP_PATH=/home/deploy/pg_search_chinese_japanese_demo

# The PID and LOCK files used by puma and sidekiq
UPID=$APP_PATH/tmp/pids/puma.pid
ULOCK=/var/lock/subsys/$NAME

# The options to use when running puma
OPTS="-C $APP_PATH/config/puma.rb"

# Ruby related path update
if [ -d "$HOME/.rbenv/bin" ]; then
  PATH="$HOME/.rbenv/bin:$HOME/.rbenv/shims:$PATH"
  eval "$(rbenv init -)"
elif [ -d "/usr/local/rbenv/bin" ]; then
  PATH="/usr/local/rbenv/bin:/usr/local/rbenv/shims:$PATH"
  eval "$(rbenv init -)"
fi

BUNDLE_CMD=bundle
PUMA_CMD=puma

start() {
  cd $APP_PATH

  # Start puma
  echo -n $"Starting $NAME: "
  daemon --pidfile=$UPID --user=$USER "$BUNDLE_CMD exec $PUMA_CMD $OPTS"
  puma=$?
  #[ $puma -eq 0 ] && touch $ULOCK
  echo

  return $puma
}

stop() {
  cd $APP_PATH

  # Stop puma
  echo -n $"Stopping $NAME: "
  killproc -p $UPID
  puma=$?
  [ $puma -eq 0 ] && rm -f $ULOCK
  echo

  return $puma
}

restart() {
  stop
  start
}

get_status() {
  status -p $UPID $NAME
}

query_status() {
  get_status >/dev/null 2>&1
}

case "$1" in
  start)
    query_status && exit 0
    start
    ;;
  stop)
    query_status || exit 0
    stop
    ;;
  restart)
    restart
    ;;
  status)
    get_status
    exit $?
    ;;
  *)
    N=/etc/init.d/$NAME
    echo "Usage: $N {start|stop|restart|status}" >&2
    exit 1
    ;;
esac

exit 0
