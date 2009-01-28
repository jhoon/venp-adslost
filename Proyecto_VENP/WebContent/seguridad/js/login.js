var Messages = new Array("", "");

function doLogin() {
	with(document.loginForm) {
		if(userName.value.blank()) {
			alert(Messages[0]);
			userName.focus();
			return;
		}
		if(password.value.blank()) {
			alert(Messages[1]);
			password.focus();
			return;
		}
		submit();
	}
}