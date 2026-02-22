<#import "/spring.ftl" as spring>

<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Войти — TaskManager Pro</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Sora:wght@400;500;600;700;800&family=DM+Sans:wght@400;500&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.11.1/font/bootstrap-icons.min.css">
    <style>
        :root {
            --cyan: #00bcd4;
            --cyan-dark: #0097a7;
            --cyan-glow: rgba(0,188,212,0.28);
            --dark: #1a1a1a;
            --gray: #6b7280;
            --gray-light: #e8ecf0;
        }

        * { margin: 0; padding: 0; box-sizing: border-box; }

        body {
            font-family: 'DM Sans', sans-serif;
            min-height: 100vh;
            display: flex;
            background: #f0f4f8;
        }

        /* ═══════════════ LEFT PANEL ═══════════════ */
        .left-panel {
            width: 40%;
            min-height: 100vh;
            position: relative;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            padding: 44px 52px;
            overflow: hidden;
            background: #0d0d0d;
        }

        .left-panel::before {
            content: '';
            position: absolute; inset: 0;
            background:
                radial-gradient(ellipse 60% 55% at 15% 25%, rgba(0,188,212,0.52) 0%, transparent 68%),
                radial-gradient(ellipse 45% 55% at 85% 75%, rgba(0,140,190,0.38) 0%, transparent 68%),
                radial-gradient(ellipse 35% 40% at 55% 5%,  rgba(0,220,255,0.22) 0%, transparent 65%),
                #0d0d0d;
            animation: meshShift 12s ease-in-out infinite alternate;
        }

        @keyframes meshShift {
            0%   { filter: hue-rotate(0deg)   brightness(1); }
            50%  { filter: hue-rotate(18deg)  brightness(1.1); }
            100% { filter: hue-rotate(-12deg) brightness(0.95); }
        }

        .orb {
            position: absolute; border-radius: 50%;
            filter: blur(64px); pointer-events: none;
            animation: orbFloat ease-in-out infinite;
        }

        .orb-1 { width:280px; height:280px; background:radial-gradient(circle,#00e5ff,#00bcd4); top:-70px; left:-50px; opacity:.45; animation-duration:15s; }
        .orb-2 { width:200px; height:200px; background:radial-gradient(circle,#00bcd4,#006064); bottom:40px; right:-50px; opacity:.38; animation-duration:20s; animation-direction:reverse; }
        .orb-3 { width:130px; height:130px; background:radial-gradient(circle,#80deea,#00acc1); top:50%; left:60%; opacity:.22; animation-duration:26s; }

        @keyframes orbFloat {
            0%,100% { transform:translate(0,0)       scale(1); }
            33%      { transform:translate(24px,-18px) scale(1.05); }
            66%      { transform:translate(-18px,24px) scale(0.95); }
        }

        .left-grid {
            position: absolute; inset: 0;
            background-image:
                linear-gradient(rgba(255,255,255,0.035) 1px, transparent 1px),
                linear-gradient(90deg,rgba(255,255,255,0.035) 1px, transparent 1px);
            background-size: 48px 48px;
            pointer-events: none;
        }

        .left-ring {
            position: absolute; border-radius: 50%;
            border: 1px solid rgba(0,188,212,0.12);
            pointer-events: none;
            animation: ringPulse 7s ease-in-out infinite;
        }

        .ring-1 { width:400px; height:400px; top:-70px;  right:-110px; animation-delay:0s; }
        .ring-2 { width:560px; height:560px; top:-150px; right:-190px; animation-delay:2s; }
        .ring-3 { width:720px; height:720px; top:-230px; right:-270px; animation-delay:4s; }

        @keyframes ringPulse {
            0%,100% { opacity:.4; transform:scale(1); }
            50%      { opacity:1;  transform:scale(1.02); }
        }

        .left-logo {
            position: relative; z-index: 2;
            display: flex; align-items: center; gap: 12px;
            animation: fadeDown .8s ease both;
        }

        .left-logo-box {
            width: 44px; height: 44px;
            background: rgba(255,255,255,0.08);
            border: 1px solid rgba(255,255,255,0.15);
            border-radius: 12px;
            display: flex; align-items: center; justify-content: center;
            backdrop-filter: blur(12px);
        }

        .left-logo-box i { font-size: 22px; color: var(--cyan); }

        .left-logo-name {
            font-family: 'Sora', sans-serif;
            font-size: 16px; font-weight: 700;
            color: rgba(255,255,255,0.9);
        }

        .left-main {
            position: relative; z-index: 2;
            animation: fadeUp .9s .15s ease both;
        }

        .left-badge {
            display: inline-flex; align-items: center; gap: 8px;
            background: rgba(0,188,212,0.12);
            border: 1px solid rgba(0,188,212,0.26);
            border-radius: 100px; padding: 6px 16px;
            margin-bottom: 24px;
        }

        .badge-dot {
            width: 7px; height: 7px;
            background: var(--cyan); border-radius: 50%;
            animation: dotPulse 2.2s ease infinite;
        }

        @keyframes dotPulse {
            0%,100% { box-shadow:0 0 0 0 var(--cyan-glow); }
            50%      { box-shadow:0 0 0 7px transparent; }
        }

        .left-badge span {
            font-size: 11px; font-weight: 700; color: var(--cyan);
            text-transform: uppercase; letter-spacing: .8px;
        }

        .left-main h1 {
            font-family: 'Sora', sans-serif;
            font-size: 46px; font-weight: 800;
            color: #fff; line-height: 1.08;
            letter-spacing: -1.5px; margin-bottom: 18px;
        }

        .left-main h1 .accent { color: var(--cyan); }

        .left-main p {
            font-size: 15px;
            color: rgba(255,255,255,0.45);
            line-height: 1.8; max-width: 310px;
        }

        .left-stats {
            display: flex; gap: 28px; margin-top: 32px;
        }

        .stat-num {
            font-family: 'Sora', sans-serif;
            font-size: 24px; font-weight: 800; color: #fff;
            line-height: 1;
        }

        .stat-num span { color: var(--cyan); }
        .stat-lbl { font-size: 12px; color: rgba(255,255,255,0.35); margin-top: 3px; }

        .stat-divider {
            width: 1px; background: rgba(255,255,255,0.08); align-self: stretch;
        }

        .left-footer {
            position: relative; z-index: 2;
            font-size: 12px; color: rgba(255,255,255,0.25);
            animation: fadeUp .9s .3s ease both;
        }

        .right-panel {
            flex: 1;
            display: flex; align-items: center; justify-content: center;
            padding: 48px 64px;
            background: #f8fafc;
            position: relative;
        }

        .right-panel::before {
            content: '';
            position: absolute; inset: 0;
            background-image: radial-gradient(circle at 1px 1px, rgba(0,188,212,0.07) 1px, transparent 0);
            background-size: 32px 32px;
            pointer-events: none;
        }

        .right-card {
            position: relative; z-index: 1;
            width: 100%; max-width: 400px;
            animation: fadeUp .8s .1s ease both;
        }

        .right-brand {
            font-family: 'Sora', sans-serif;
            font-size: 15px; font-weight: 700;
            color: var(--dark);
            margin-bottom: 40px;
            display: flex; align-items: center; gap: 8px;
        }

        .right-brand i { color: var(--cyan); font-size: 18px; }

        .right-heading {
            font-family: 'Sora', sans-serif;
            font-size: 28px; font-weight: 800;
            color: var(--dark);
            letter-spacing: -.7px; margin-bottom: 6px;
        }

        .right-sub {
            font-size: 14px; color: var(--gray);
            line-height: 1.65; margin-bottom: 30px;
        }

        .right-sub a {
            color: var(--cyan-dark); font-weight: 600;
            text-decoration: none;
            border-bottom: 1px solid rgba(0,151,167,0.3);
            transition: all .2s;
        }

        .right-sub a:hover { color: var(--cyan); border-color: var(--cyan); }

        .error-alert {
            background: #fff5f5;
            border: 1.5px solid #fecaca;
            border-radius: 12px;
            padding: 12px 14px;
            margin-bottom: 20px;
            font-size: 13px; color: #dc2626;
            display: flex; align-items: flex-start; gap: 10px;
            animation: shake .4s ease;
        }

        .error-alert i { font-size: 16px; flex-shrink: 0; margin-top: 1px; }
        .error-content { flex: 1; }
        .error-title   { font-weight: 700; margin-bottom: 2px; }
        .error-message { font-size: 12px; opacity: .82; }

        .error-close {
            background: none; border: none; color: #dc2626;
            cursor: pointer; font-size: 18px; opacity: .5;
            transition: opacity .2s; line-height: 1;
            padding: 0; flex-shrink: 0;
        }

        .error-close:hover { opacity: 1; }

        @keyframes shake {
            0%,100% { transform:translateX(0); }
            25%      { transform:translateX(-8px); }
            75%      { transform:translateX(8px); }
        }

        .form-group { margin-bottom: 16px; }

        .form-label {
            display: block;
            font-size: 11px; font-weight: 700;
            color: var(--gray);
            letter-spacing: .7px; text-transform: uppercase;
            margin-bottom: 7px;
        }

        .input-wrap { position: relative; }

        .input-icon {
            position: absolute; left: 15px; top: 50%;
            transform: translateY(-50%);
            color: #c4c9d4; font-size: 15px;
            transition: color .2s; pointer-events: none;
        }

        .form-input {
            width: 100%;
            padding: 12px 14px 12px 42px;
            border: 1.5px solid var(--gray-light);
            border-radius: 12px;
            font-size: 14px; color: var(--dark);
            background: #fff; outline: none;
            transition: all .25s ease;
            font-family: 'DM Sans', sans-serif;
        }

        .form-input::placeholder { color: #c4c9d4; }
        .form-input:hover { border-color: #c0cad5; }

        .form-input:focus {
            border-color: var(--cyan);
            box-shadow: 0 0 0 4px rgba(0,188,212,0.1);
        }

        .input-wrap:focus-within .input-icon { color: var(--cyan); }

        .password-wrapper { position: relative; }

        .password-toggle {
            position: absolute; right: 13px; top: 50%;
            transform: translateY(-50%);
            background: none; border: none;
            color: #c4c9d4; cursor: pointer;
            font-size: 17px; padding: 4px;
            transition: color .2s; line-height: 1;
        }

        .password-toggle:hover { color: var(--cyan); }

        .form-options {
            display: flex;
            justify-content: space-between; align-items: center;
            margin: 4px 0 24px;
        }

        .checkbox-wrap {
            display: flex; align-items: center; gap: 8px;
            cursor: pointer;
        }

        .checkbox-wrap input[type="checkbox"] {
            appearance: none;
            width: 16px; height: 16px;
            border: 1.5px solid var(--gray-light);
            border-radius: 5px; cursor: pointer;
            transition: all .2s; position: relative; flex-shrink: 0;
        }

        .checkbox-wrap input[type="checkbox"]:checked {
            background: var(--cyan); border-color: var(--cyan);
        }

        .checkbox-wrap input[type="checkbox"]:checked::after {
            content: '';
            position: absolute; left: 4px; top: 1px;
            width: 5px; height: 9px;
            border: 2px solid #fff;
            border-top: none; border-left: none;
            transform: rotate(45deg);
        }

        .checkbox-label { font-size: 13px; color: var(--gray); user-select: none; }

        .forgot-link {
            font-size: 13px; color: var(--cyan-dark);
            font-weight: 600; text-decoration: none;
            transition: color .2s;
        }

        .forgot-link:hover { color: var(--cyan); }

        .btn-login {
            width: 100%; padding: 14px;
            background: var(--dark); color: #fff;
            border: none; border-radius: 12px;
            font-size: 15px; font-weight: 700;
            font-family: 'Sora', sans-serif;
            cursor: pointer;
            transition: all .25s ease;
            position: relative; overflow: hidden;
            letter-spacing: .2px;
        }

        .btn-login::before {
            content: '';
            position: absolute; inset: 0;
            background: linear-gradient(135deg, rgba(0,188,212,.18), transparent 60%);
            opacity: 0; transition: opacity .3s;
        }

        .btn-login:hover {
            background: #111;
            transform: translateY(-2px);
            box-shadow: 0 8px 24px rgba(0,0,0,.18), 0 0 0 1px rgba(0,188,212,.15);
        }

        .btn-login:hover::before { opacity: 1; }
        .btn-login:active { transform: none; box-shadow: none; }

        .divider {
            display: flex; align-items: center; gap: 14px;
            margin: 22px 0;
        }

        .divider-line { flex: 1; height: 1px; background: var(--gray-light); }
        .divider-text { font-size: 12px; color: #c4c9d4; font-weight: 600; letter-spacing: .5px; }

        .register-link {
            text-align: center; font-size: 13px; color: var(--gray);
        }

        .register-link a {
            color: var(--dark); font-weight: 700;
            text-decoration: none;
            font-family: 'Sora', sans-serif;
            transition: color .2s;
        }

        .register-link a:hover { color: var(--cyan-dark); }

        @keyframes fadeUp   { from{opacity:0;transform:translateY(22px)} to{opacity:1;transform:translateY(0)} }
        @keyframes fadeDown { from{opacity:0;transform:translateY(-14px)} to{opacity:1;transform:translateY(0)} }

        @media (max-width: 900px) {
            .left-panel { width: 38%; padding: 36px; }
            .left-main h1 { font-size: 36px; }
            .right-panel { padding: 40px 32px; }
        }

        @media (max-width: 640px) {
            body { flex-direction: column; }

            .left-panel {
                width: 100%; min-height: auto;
                padding: 22px 20px;
                flex-direction: row;
                align-items: center; gap: 14px;
            }

            .left-badge, .left-main p, .left-stats, .left-footer { display: none; }
            .left-main h1 { font-size: 22px; margin-bottom: 0; }
            .right-panel { padding: 28px 20px; }
            .right-brand { margin-bottom: 24px; }
            .right-heading { font-size: 24px; }
        }
    </style>
</head>
<body>

<div class="left-panel">
    <div class="orb orb-1"></div>
    <div class="orb orb-2"></div>
    <div class="orb orb-3"></div>
    <div class="left-grid"></div>
    <div class="left-ring ring-1"></div>
    <div class="left-ring ring-2"></div>
    <div class="left-ring ring-3"></div>

    <div class="left-logo">
        <div class="left-logo-box">
            <i class="bi bi-kanban-fill"></i>
        </div>
        <span class="left-logo-name">TaskManager Pro</span>
    </div>

    <div class="left-main">
        <div class="left-badge">
            <div class="badge-dot"></div>
            <span>Платформа для команд</span>
        </div>

        <h1>С возвращением<br>в <span class="accent">TaskManager</span></h1>

        <p>Войди и продолжай работать над своими проектами прямо с того места, где остановился.</p>

        <div class="left-stats">
            <div>
                <div class="stat-num">10<span>K+</span></div>
                <div class="stat-lbl">Пользователей</div>
            </div>
            <div class="stat-divider"></div>
            <div>
                <div class="stat-num">99<span>%</span></div>
                <div class="stat-lbl">Uptime</div>
            </div>
            <div class="stat-divider"></div>
            <div>
                <div class="stat-num">4<span>.9★</span></div>
                <div class="stat-lbl">Рейтинг</div>
            </div>
        </div>
    </div>

    <div class="left-footer">© 2024 TaskManager Pro. Все права защищены.</div>
</div>

<div class="right-panel">
    <div class="right-card">
        <div class="right-brand">
            <i class="bi bi-kanban-fill"></i>
            TaskManager Pro
        </div>

        <h2 class="right-heading">Вход в аккаунт 👋</h2>
        <p class="right-sub">
            Нет аккаунта? <a href="/auth/register">Зарегистрироваться бесплатно</a>
        </p>

        <#if RequestParameters.error??>
        <div class="error-alert" id="errorAlert">
            <i class="bi bi-exclamation-triangle-fill"></i>
            <div class="error-content">
                <div class="error-title">Ошибка входа</div>
                <div class="error-message">Неверный логин или пароль. Попробуйте снова.</div>
            </div>
            <button class="error-close" onclick="document.getElementById('errorAlert').remove()">
                <i class="bi bi-x"></i>
            </button>
        </div>
    </#if>

    <form action="/auth/login" method="post" id="loginForm">
        <input type="hidden"
               name="${(_csrf.parameterName)!'csrf'}"
               value="${(_csrf.token)!'--no-token--'}"/>

        <div class="form-group">
            <label class="form-label" for="email">Email</label>
            <div class="input-wrap">
                <i class="bi bi-envelope-fill input-icon"></i>
                <input
                        type="email"
                        id="email"
                        name="email"
                        class="form-input"
                        placeholder="example@mail.com"
                        required
                        autocomplete="email"
                >
            </div>
        </div>

        <div class="form-group">
            <label class="form-label" for="password">Пароль</label>
            <div class="password-wrapper">
                <i class="bi bi-lock-fill input-icon" style="position:absolute;left:15px;top:50%;transform:translateY(-50%);color:#c4c9d4;font-size:15px;pointer-events:none;transition:color .2s;z-index:1"></i>
                <input
                        type="password"
                        id="password"
                        name="password"
                        class="form-input"
                        placeholder="Введите пароль"
                        required
                        autocomplete="current-password"
                >
                <button type="button" class="password-toggle" id="togglePassword">
                    <i class="bi bi-eye" id="toggleIcon"></i>
                </button>
            </div>
        </div>

        <div class="form-options">
            <label class="checkbox-wrap">
                <input type="checkbox" name="remember-me">
                <span class="checkbox-label">Запомнить меня</span>
            </label>
            <a href="/auth/forgot-password" class="forgot-link">Забыли пароль?</a>
        </div>

        <button type="submit" class="btn-login">Войти в аккаунт</button>
    </form>

    <div class="divider">
        <div class="divider-line"></div>
        <span class="divider-text">или</span>
        <div class="divider-line"></div>
    </div>

    <div class="register-link">
        Нет аккаунта? <a href="/auth/register">Зарегистрироваться →</a>
    </div>
</div>
</div>

<script>
    const toggleBtn  = document.getElementById('togglePassword');
    const toggleIcon = document.getElementById('toggleIcon');
    const passInput  = document.getElementById('password');
    const lockIcon   = passInput.previousElementSibling;

    toggleBtn.addEventListener('click', () => {
        const isPass = passInput.type === 'password';
        passInput.type = isPass ? 'text' : 'password';
        toggleIcon.className = isPass ? 'bi bi-eye-slash' : 'bi bi-eye';
    });

    passInput.addEventListener('focus',  () => { if(lockIcon) lockIcon.style.color = 'var(--cyan)'; });
    passInput.addEventListener('blur',   () => { if(lockIcon) lockIcon.style.color = '#c4c9d4'; });
</script>
</body>
</html>
