# Defined in - @ line 1
function noti --description 'alias noti=terminal-notifier -message "コマンド完了"'
	terminal-notifier -message "コマンド完了" $argv;
end
