<#import "../layout.ftlh" as main>
<@main.layout ; spring>
<link rel="stylesheet" href="/css/auth/register.css">

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

<script src="/js/auth/register.js"></script>
</@main.layout>