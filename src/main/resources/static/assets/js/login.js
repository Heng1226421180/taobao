(function () {
    var text = document.getElementById('text');
    var pwd = document.getElementById('pwd');
    var login = document.querySelector('.login');

    text.onclick = function () {
        if (this.value === '请输入账号') {
            this.value = '';
        }
    }
    text.onblur = function () {
        if (this.value === '') {
            this.value = '请输入账号';
        }
    }
    pwd.onclick = function () {
        if (this.value === '请输入密码') {
            this.type = 'password';
            this.value = '';
        }
    }
    pwd.onblur = function () {
        if (this.value === '') {
            this.type = 'text';
            this.value = '请输入密码';
        }
    }



    login.onclick = function () {
        if (text.value === 'bjlt' && pwd.value === '123456') {
            this.href = 'index.html';
        }
        else if (text.value !== 'bjlt') {
            alert('账号名错误！')
        }
        else if (pwd.value !== '123456') {
            alert('密码错误！')
        }
    }

})();
