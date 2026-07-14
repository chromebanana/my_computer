export TMS_CONFIG_FILE=$HOME/.config/tms/config.toml

tmux() {
	if [ "$#" -eq 0 ]; then
		local name
		name=$(basename "$PWD")
		command tmux new-session -A -s "$name"
	else
		command tmux "$@"
	fi
}
