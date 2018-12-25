# wttr.inのお天気情報を持ってくるalias
function wttr() {
	curl wttr.in/${1}
}
