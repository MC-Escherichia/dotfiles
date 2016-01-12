export $(systemctl --user show-environment | sed -e '/PATH/d')
