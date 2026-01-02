<#import "../layout.ftlh" as main>
<@main.layout ; spring>
<style>
    .register-wrapper {
        display: flex;
        align-items: center;
        justify-content: center;
        min-height: calc(100vh - 240px);
        padding: 40px 0;
    }

    .register-container {
        background: #ffffff;
        border: 1px solid #e0e0e0;
        border-radius: 8px;
        padding: 48px;
        max-width: 500px;
        width: 100%;
        box-shadow: 0 2px 8px rgba(0,0,0,0.08);
        animation: fadeInUp 0.6s ease;
    }

    @keyframes fadeInUp {
        from {
            opacity: 0;
            transform: translateY(20px);
        }
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }

    .register-logo {
        text-align: center;
        margin-bottom: 32px;
    }

    .register-logo i {
        font-size: 48px;
        color: #1a1a1a;
        margin-bottom: 12px;
    }

    .register-logo h1 {
        font-size: 24px;
        font-weight: 600;
        color: #1a1a1a;
        margin-bottom: 8px;
    }

    .register-logo p {
        font-size: 14px;
        color: #666;
    }

    .register-form-group {
        margin-bottom: 24px;
    }

    .register-form-group label {
        display: block;
        font-size: 14px;
        font-weight: 500;
        color: #1a1a1a;
        margin-bottom: 8px;
    }

    .register-input-wrapper {
        position: relative;
        display: flex;
        align-items: center;
    }

    .register-input-wrapper i {
        position: absolute;
        left: 16px;
        font-size: 16px;
        color: #999;
        z-index: 1;
    }

    .register-input {
        width: 100%;
        padding: 12px 16px 12px 44px;
        border: 1px solid #e0e0e0;
        border-radius: 4px;
        font-size: 15px;
        color: #1a1a1a;
        transition: all 0.3s ease;
        background: #ffffff;
    }

    .register-input:focus {
        outline: none;
        border-color: #1a1a1a;
        box-shadow: 0 0 0 3px rgba(26, 26, 26, 0.1);
    }

    .register-input::placeholder {
        color: #999;
    }

    .password-strength {
        width: 100%;
        height: 4px;
        background: #e0e0e0;
        border-radius: 2px;
        margin-top: 8px;
        overflow: hidden;
    }

    .password-strength-bar {
        height: 100%;
        width: 0;
        transition: all 0.3s ease;
        border-radius: 2px;
    }

    .password-strength-bar.weak {
        width: 33%;
        background: #dc3545;
    }

    .password-strength-bar.medium {
        width: 66%;
        background: #ffc107;
    }

    .password-strength-bar.strong {
        width: 100%;
        background: #28a745;
    }

    .password-strength-text {
        font-size: 12px;
        margin-top: 4px;
        color: #666;
    }

    .password-strength-text.weak {
        color: #dc3545;
    }

    .password-strength-text.medium {
        color: #ffc107;
    }

    .password-strength-text.strong {
        color: #28a745;
    }

    .error-message {
        color: #dc3545;
        font-size: 13px;
        margin-top: 6px;
        display: none;
    }

    .error-message.show {
        display: block;
    }

    .register-btn {
        width: 100%;
        padding: 14px 24px;
        border: none;
        border-radius: 4px;
        font-size: 15px;
        font-weight: 500;
        cursor: pointer;
        transition: all 0.3s ease;
        background: #1a1a1a;
        color: #ffffff;
        display: flex;
        align-items: center;
        justify-content: center;
        gap: 8px;
        margin-top: 32px;
    }

    .register-btn:hover {
        background: #333;
        transform: translateY(-2px);
        box-shadow: 0 4px 12px rgba(0,0,0,0.15);
    }

    .register-btn:active {
        transform: translateY(0);
    }

    .register-btn:disabled {
        background: #ccc;
        cursor: not-allowed;
        transform: none;
    }

    .register-btn i {
        font-size: 16px;
    }

    .register-divider {
        text-align: center;
        margin: 32px 0;
        position: relative;
    }

    .register-divider::before {
        content: '';
        position: absolute;
        left: 0;
        top: 50%;
        width: 100%;
        height: 1px;
        background: #e0e0e0;
    }

    .register-divider span {
        position: relative;
        background: #ffffff;
        padding: 0 16px;
        color: #666;
        font-size: 14px;
    }

    .register-login-link {
        text-align: center;
        font-size: 14px;
        color: #666;
        margin-top: 24px;
    }

    .register-login-link a {
        color: #1a1a1a;
        text-decoration: none;
        font-weight: 500;
        transition: color 0.3s ease;
    }

    .register-login-link a:hover {
        color: #666;
    }

    .password-requirements {
        font-size: 12px;
        color: #666;
        margin-top: 8px;
        padding-left: 0;
        list-style: none;
    }

    .password-requirements li {
        padding: 4px 0;
        position: relative;
        padding-left: 20px;
    }

    .password-requirements li::before {
        content: '✓';
        position: absolute;
        left: 0;
        color: #28a745;
        font-weight: bold;
        opacity: 0.3;
    }

    .password-requirements li.valid::before {
        opacity: 1;
    }

    @media (max-width: 480px) {
        .register-container {
            padding: 32px 24px;
        }

        .register-logo h1 {
            font-size: 20px;
        }
    }
</style>

<div class="register-wrapper">
    <div class="register-container">
        <div class="register-logo">
            <i class="bi bi-kanban-fill"></i>
            <h1>TaskManager Pro</h1>
            <p>Создайте свой аккаунт</p>
        </div>

        <form class="register-form" action="/auth/register" method="post" id="registerForm">
            <#if _csrf??>
            <input type="hidden" name="${(_csrf.parameterName)!'csrf-param-name'}"
                   value="${(_csrf.token)!'csrf-token'}"/>
        </#if>

        <div class="register-form-group">
            <label for="name">Имя</label>
            <div class="register-input-wrapper">
                <i class="bi bi-person-fill"></i>
                <@spring.formInput "userDto.name" 'id="name" class="register-input" placeholder="Введите ваше имя" required'/>
            </div>
            <@spring.showErrors "userDto.name" "error-message show"/>
        </div>

        <div class="register-form-group">
            <label for="email">Email</label>
            <div class="register-input-wrapper">
                <i class="bi bi-envelope-fill"></i>
                <@spring.formInput "userDto.email" 'type="email" id="email" class="register-input" placeholder="example@email.com" required'/>
            </div>
            <@spring.showErrors "userDto.email" "error-message show"/>
        </div>

        <div class="register-form-group">
            <label for="password">Пароль</label>
            <div class="register-input-wrapper">
                <i class="bi bi-lock-fill"></i>
                <@spring.formPasswordInput "userDto.password" 'id="password" class="register-input" placeholder="Минимум 8 символов" required'/>
            </div>
            <div class="password-strength" id="passwordStrength">
                <div class="password-strength-bar" id="passwordStrengthBar"></div>
            </div>
            <div class="password-strength-text" id="passwordStrengthText"></div>

            <ul class="password-requirements" id="passwordRequirements">
                <li id="req-length">Минимум 8 символов</li>
                <li id="req-letter">Хотя бы одна буква</li>
                <li id="req-number">Хотя бы одна цифра</li>
            </ul>

            <@spring.showErrors "userDto.password" "error-message show"/>
        </div>

        <button type="submit" class="register-btn" id="submitBtn">
            <i class="bi bi-person-plus-fill"></i>
            Зарегистрироваться
        </button>
        </form>

        <div class="register-divider">
            <span>или</span>
        </div>

        <div class="register-login-link">
            Уже есть аккаунт? <a href="/auth/login">Войти</a>
        </div>
    </div>
</div>

<script>
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
</script>
</@main.layout>