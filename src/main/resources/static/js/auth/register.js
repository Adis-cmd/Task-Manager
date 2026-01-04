    const passwordInput = document.getElementById('password');
    const strengthBar = document.getElementById('passwordStrengthBar');
    const strengthText = document.getElementById('passwordStrengthText');
    const submitBtn = document.getElementById('submitBtn');

    const reqLength = document.getElementById('req-length');
    const reqLetter = document.getElementById('req-letter');
    const reqNumber = document.getElementById('req-number');

    passwordInput.addEventListener('input', function() {
        const password = this.value;
        let strength = 0;

        if (password.length >= 8) {
            strength++;
            reqLength.classList.add('valid');
        } else {
            reqLength.classList.remove('valid');
        }

        if (/[a-zA-Zа-яА-Я]/.test(password)) {
            strength++;
            reqLetter.classList.add('valid');
        } else {
            reqLetter.classList.remove('valid');
        }

        if (/\d/.test(password)) {
            strength++;
            reqNumber.classList.add('valid');
        } else {
            reqNumber.classList.remove('valid');
        }

        strengthBar.className = 'password-strength-bar';
        strengthText.className = 'password-strength-text';

        if (password.length === 0) {
            strengthText.textContent = '';
        } else if (strength === 1) {
            strengthBar.classList.add('weak');
            strengthText.classList.add('weak');
            strengthText.textContent = 'Слабый пароль';
        } else if (strength === 2) {
            strengthBar.classList.add('medium');
            strengthText.classList.add('medium');
            strengthText.textContent = 'Средний пароль';
        } else if (strength === 3) {
            strengthBar.classList.add('strong');
            strengthText.classList.add('strong');
            strengthText.textContent = 'Надёжный пароль';
        }
    });

    document.getElementById('registerForm').addEventListener('submit', function(e) {
        const password = passwordInput.value;

        if (password.length < 8 || !/[a-zA-Zа-яА-Я]/.test(password) || !/\d/.test(password)) {
            e.preventDefault();
            alert('Пароль не соответствует требованиям безопасности');
        }
    });