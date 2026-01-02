<#import "../layout.ftlh" as main>
<@main.layout>
<style>
    .login-wrapper {
        display: flex;
        align-items: center;
        justify-content: center;
        min-height: calc(100vh - 240px);
        padding: 40px 0;
    }

    .login-container {
        background: #ffffff;
        border: 1px solid #e0e0e0;
        border-radius: 8px;
        padding: 48px;
        max-width: 440px;
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

    .login-logo {
        text-align: center;
        margin-bottom: 32px;
    }

    .login-logo i {
        font-size: 48px;
        color: #1a1a1a;
        margin-bottom: 12px;
    }

    .login-logo h1 {
        font-size: 24px;
        font-weight: 600;
        color: #1a1a1a;
        margin-bottom: 8px;
    }

    .login-logo p {
        font-size: 14px;
        color: #666;
    }

    .login-form-group {
        margin-bottom: 24px;
    }

    .login-form-label {
        display: block;
        font-size: 14px;
        font-weight: 500;
        color: #1a1a1a;
        margin-bottom: 8px;
    }

    .login-form-input {
        width: 100%;
        padding: 12px 16px;
        border: 1px solid #e0e0e0;
        border-radius: 4px;
        font-size: 15px;
        color: #1a1a1a;
        transition: all 0.3s ease;
        background: #ffffff;
    }

    .login-form-input:focus {
        outline: none;
        border-color: #1a1a1a;
        box-shadow: 0 0 0 3px rgba(26, 26, 26, 0.1);
    }

    .login-form-input::placeholder {
        color: #999;
    }

    .login-password-wrapper {
        position: relative;
    }

    .login-password-toggle {
        position: absolute;
        right: 12px;
        top: 50%;
        transform: translateY(-50%);
        background: none;
        border: none;
        color: #666;
        cursor: pointer;
        padding: 4px;
        font-size: 18px;
        transition: color 0.3s ease;
    }

    .login-password-toggle:hover {
        color: #1a1a1a;
    }

    .login-form-options {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 24px;
        font-size: 14px;
    }

    .login-checkbox-wrapper {
        display: flex;
        align-items: center;
        gap: 8px;
    }

    .login-checkbox-wrapper input[type="checkbox"] {
        width: 16px;
        height: 16px;
        cursor: pointer;
    }

    .login-checkbox-wrapper label {
        color: #666;
        cursor: pointer;
    }

    .login-forgot-link {
        color: #1a1a1a;
        text-decoration: none;
        font-weight: 500;
        transition: color 0.3s ease;
    }

    .login-forgot-link:hover {
        color: #666;
    }

    .login-btn {
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
    }

    .login-btn:hover {
        background: #333;
        transform: translateY(-2px);
        box-shadow: 0 4px 12px rgba(0,0,0,0.15);
    }

    .login-btn:active {
        transform: translateY(0);
    }

    .login-btn i {
        font-size: 16px;
    }

    .login-divider {
        text-align: center;
        margin: 32px 0;
        position: relative;
    }

    .login-divider::before {
        content: '';
        position: absolute;
        left: 0;
        top: 50%;
        width: 100%;
        height: 1px;
        background: #e0e0e0;
    }

    .login-divider span {
        position: relative;
        background: #ffffff;
        padding: 0 16px;
        color: #666;
        font-size: 14px;
    }

    .login-register-link {
        text-align: center;
        font-size: 14px;
        color: #666;
        margin-top: 24px;
    }

    .login-register-link a {
        color: #1a1a1a;
        text-decoration: none;
        font-weight: 500;
        transition: color 0.3s ease;
    }

    .login-register-link a:hover {
        color: #666;
    }

    .login-error-alert {
        background: #fee;
        border: 1px solid #fcc;
        border-radius: 4px;
        padding: 12px 16px;
        margin-bottom: 24px;
        font-size: 14px;
        color: #c33;
        display: flex;
        align-items: flex-start;
        gap: 12px;
        animation: shake 0.4s ease;
    }

    .login-error-alert i {
        font-size: 18px;
        flex-shrink: 0;
    }

    .login-error-content {
        flex: 1;
    }

    .login-error-title {
        font-weight: 600;
        margin-bottom: 4px;
    }

    .login-error-message {
        font-size: 13px;
    }

    .login-error-close {
        background: none;
        border: none;
        color: #c33;
        cursor: pointer;
        padding: 0;
        font-size: 20px;
        transition: opacity 0.3s ease;
    }

    .login-error-close:hover {
        opacity: 0.7;
    }

    @keyframes shake {
        0%, 100% { transform: translateX(0); }
        25% { transform: translateX(-10px); }
        75% { transform: translateX(10px); }
    }

    @media (max-width: 480px) {
        .login-container {
            padding: 32px 24px;
        }

        .login-logo h1 {
            font-size: 20px;
        }
    }
</style>

<div class="login-wrapper">
    <div class="login-container">
        <div class="login-logo">
            <i class="bi bi-kanban-fill"></i>
            <h1>TaskManager Pro</h1>
            <p>Войдите в свой аккаунт</p>
        </div>

        <#if RequestParameters.error??>
        <div class="login-error-alert" id="errorAlert">
            <i class="bi bi-exclamation-triangle-fill"></i>
            <div class="login-error-content">
                <div class="login-error-title">Ошибка входа</div>
                <div class="login-error-message">Неверный логин или пароль. Попробуйте снова.</div>
            </div>
            <button class="login-error-close" onclick="document.getElementById('errorAlert').remove()">
                <i class="bi bi-x"></i>
            </button>
        </div>
    </#if>

    <form action="/auth/login" method="post" id="loginForm">
        <input type="hidden" name="${(_csrf.parameterName)!'csrf'}" value="${(_csrf.token)!'--no-token--'}"/>

        <div class="login-form-group">
            <label class="login-form-label" for="email">Email</label>
            <input
                    type="email"
                    id="email"
                    name="email"
                    class="login-form-input"
                    placeholder="example@mail.com"
                    required
                    autocomplete="email"
            >
        </div>

        <div class="login-form-group">
            <label class="login-form-label" for="password">Пароль</label>
            <div class="login-password-wrapper">
                <input
                        type="password"
                        id="password"
                        name="password"
                        class="login-form-input"
                        placeholder="Введите пароль"
                        required
                        autocomplete="current-password"
                >
                <button type="button" class="login-password-toggle" id="togglePassword">
                    <i class="bi bi-eye"></i>
                </button>
            </div>
        </div>

        <div class="login-form-options">
            <a href="/auth/forgot-password" class="login-forgot-link">Забыли пароль?</a>
        </div>

        <button type="submit" class="login-btn">
            <i class="bi bi-box-arrow-in-right"></i>
            Войти
        </button>
    </form>

    <div class="login-divider">
        <span>или</span>
    </div>

    <div class="login-register-link">
        Нет аккаунта? <a href="/auth/register">Зарегистрироваться</a>
    </div>
</div>
</div>

<script>
    const togglePassword = document.getElementById('togglePassword');
    const passwordInput = document.getElementById('password');
    const toggleIcon = togglePassword.querySelector('i');

    togglePassword.addEventListener('click', function() {
        const type = passwordInput.getAttribute('type') === 'password' ? 'text' : 'password';
        passwordInput.setAttribute('type', type);

        if (type === 'text') {
            toggleIcon.classList.remove('bi-eye');
            toggleIcon.classList.add('bi-eye-slash');
        } else {
            toggleIcon.classList.remove('bi-eye-slash');
            toggleIcon.classList.add('bi-eye');
        }
    });
</script>
</@main.layout>