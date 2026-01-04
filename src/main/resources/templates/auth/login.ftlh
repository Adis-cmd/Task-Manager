<#import "../layout.ftlh" as main>
<@main.layout>
<link rel="stylesheet" href="/css/auth/login.css">


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

<script src="/js/auth/login.js"></script>
</@main.layout>