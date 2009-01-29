String.prototype.trim = function()
{
	return this.replace(/^\s+/, '').replace(/\s+$/, '');
}

var Messages = new Array("", "");

function doLogin() {
	var reUser = /^[A-Za-z0-9]{5,10}$/;
	var rePass = /^[A-Za-z0-9\@\#\$\&\*]{3,10}$/;
	with(document.loginForm) {
		if(!reUser.test(userName.value)) {
			alert(Messages[0]);
			userName.focus();
			return;
		}
		if(!rePass.test(password.value)) {
			alert(Messages[1]);
			password.focus();
			return;
		}
		submit();
	}
}

function isValidUser(e) {
	var tecla = (document.all) ? e.keyCode : e.which;
	if(tecla == 0 || tecla == 8) return true;
	var patron = /[A-Za-z0-9]/; 
	var te = String.fromCharCode(tecla);
	return patron.test(te);
}

function isValidPass(e) {
	var tecla = (document.all) ? e.keyCode : e.which;
	if(tecla == 0 || tecla == 8) return true;
	var patron = /[A-Za-z0-9\@\#\$\&\*]/; 
	var te = String.fromCharCode(tecla);
	return patron.test(te);
} 