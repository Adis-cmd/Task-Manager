<#import "/spring.ftl" as spring>

<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Регистрация — TaskManager Pro</title>
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
            font-size: 11px; font-weight: 700;
            color: var(--cyan);
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

        .left-checklist {
            display: flex; flex-direction: column; gap: 10px;
            margin-top: 28px;
        }

        .left-check-item {
            display: flex; align-items: center; gap: 10px;
        }

        .check-icon {
            width: 22px; height: 22px;
            background: rgba(0,188,212,0.15);
            border: 1px solid rgba(0,188,212,0.3);
            border-radius: 6px;
            display: flex; align-items: center; justify-content: center;
            flex-shrink: 0;
            color: var(--cyan); font-size: 12px;
        }

        .check-text {
            font-size: 13px;
            color: rgba(255,255,255,0.55);
        }

        .left-footer {
            position: relative; z-index: 2;
            font-size: 12px;
            color: rgba(255,255,255,0.25);
            animation: fadeUp .9s .3s ease both;
        }

        .right-panel {
            flex: 1;
            display: flex; align-items: center; justify-content: center;
            padding: 48px 64px;
            background: #f8fafc;
            position: relative;
            overflow-y: auto;
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
            width: 100%; max-width: 420px;
            animation: fadeUp .8s .1s ease both;
            padding: 20px 0;
        }

        .right-brand {
            font-family: 'Sora', sans-serif;
            font-size: 15px; font-weight: 700;
            color: var(--dark);
            margin-bottom: 36px;
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

        .register-form-group {
            margin-bottom: 16px;
        }

        .register-form-group label {
            display: block;
            font-size: 11px; font-weight: 700;
            color: var(--gray);
            letter-spacing: .7px; text-transform: uppercase;
            margin-bottom: 7px;
        }

        .register-input-wrapper {
            position: relative;
        }

        .register-input-wrapper i {
            position: absolute;
            left: 15px; top: 50%;
            transform: translateY(-50%);
            color: #c4c9d4; font-size: 15px;
            transition: color .2s;
            pointer-events: none;
        }

        .register-input {
            width: 100%;
            padding: 12px 14px 12px 42px;
            border: 1.5px solid var(--gray-light);
            border-radius: 12px;
            font-size: 14px; color: var(--dark);
            background: #fff; outline: none;
            transition: all .25s ease;
            font-family: 'DM Sans', sans-serif;
        }

        .register-input::placeholder { color: #c4c9d4; }
        .register-input:hover { border-color: #c0cad5; }

        .register-input:focus {
            border-color: var(--cyan);
            box-shadow: 0 0 0 4px rgba(0,188,212,0.1);
        }

        .register-input-wrapper:focus-within i { color: var(--cyan); }

        .password-toggle-btn {
            position: absolute;
            right: 13px; top: 50%;
            transform: translateY(-50%);
            background: none; border: none;
            color: #c4c9d4; cursor: pointer;
            font-size: 17px; padding: 4px;
            transition: color .2s; line-height: 1;
        }

        .password-toggle-btn:hover { color: var(--cyan); }

        .password-strength {
            height: 4px;
            background: var(--gray-light);
            border-radius: 10px; overflow: hidden;
            margin-top: 8px;
        }

        .password-strength-bar {
            height: 100%; width: 0;
            border-radius: 10px;
            transition: width .4s ease, background .4s ease;
        }

        .password-strength-text {
            font-size: 11px; font-weight: 600;
            margin-top: 5px; height: 14px;
            transition: color .3s;
        }

        .password-requirements {
            list-style: none;
            display: flex; flex-direction: column; gap: 5px;
            margin-top: 10px;
        }

        .password-requirements li {
            font-size: 12px;
            color: #c4c9d4;
            display: flex; align-items: center; gap: 7px;
            transition: color .3s;
        }

        .password-requirements li::before {
            content: '';
            width: 14px; height: 14px;
            border-radius: 50%;
            border: 1.5px solid #d1d5db;
            flex-shrink: 0;
            transition: all .3s;
            display: flex; align-items: center; justify-content: center;
        }

        .password-requirements li.met {
            color: #22c55e;
        }

        .password-requirements li.met::before {
            background: #22c55e;
            border-color: #22c55e;
            content: '✓';
            font-size: 9px; color: #fff;
            display: flex; align-items: center; justify-content: center;
            line-height: 1;
        }

        .error-message {
            display: none;
            font-size: 12px; color: #ef4444;
            margin-top: 5px;
            display: flex; align-items: center; gap: 5px;
        }

        .error-message.show { display: flex; }

        .register-btn {
            width: 100%;
            padding: 14px;
            background: var(--dark); color: #fff;
            border: none; border-radius: 12px;
            font-size: 15px; font-weight: 700;
            font-family: 'Sora', sans-serif;
            cursor: pointer;
            transition: all .25s ease;
            display: flex; align-items: center; justify-content: center; gap: 8px;
            margin-top: 8px;
            position: relative; overflow: hidden;
        }

        .register-btn::before {
            content: '';
            position: absolute; inset: 0;
            background: linear-gradient(135deg, rgba(0,188,212,.18), transparent 60%);
            opacity: 0; transition: opacity .3s;
        }

        .register-btn:hover {
            background: #111;
            transform: translateY(-2px);
            box-shadow: 0 8px 24px rgba(0,0,0,.18), 0 0 0 1px rgba(0,188,212,.15);
        }

        .register-btn:hover::before { opacity: 1; }
        .register-btn:active { transform: none; box-shadow: none; }

        .divider {
            display: flex; align-items: center; gap: 14px;
            margin: 22px 0;
        }

        .divider-line { flex: 1; height: 1px; background: var(--gray-light); }
        .divider-text { font-size: 12px; color: #c4c9d4; font-weight: 600; letter-spacing: .5px; }

        .login-link {
            text-align: center; font-size: 13px; color: var(--gray);
        }

        .login-link a {
            color: var(--dark); font-weight: 700;
            text-decoration: none;
            font-family: 'Sora', sans-serif;
            transition: color .2s;
        }

        .login-link a:hover { color: var(--cyan-dark); }

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

            .left-badge, .left-main p, .left-checklist, .left-footer { display: none; }
            .left-main h1 { font-size: 22px; margin-bottom: 0; }
            .right-panel { padding: 28px 20px; }
            .right-brand { margin-bottom: 22px; }
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
            <span>Бесплатно навсегда</span>
        </div>

        <h1>Присоединяйся<br>к <span class="accent">10 000+</span><br>командам</h1>

        <p>Зарегистрируйся за 30 секунд и начни управлять проектами прямо сейчас.</p>

        <div class="left-checklist">
            <div class="left-check-item">
                <div class="check-icon"><i class="bi bi-check-lg"></i></div>
                <span class="check-text">Неограниченные проекты</span>
            </div>
            <div class="left-check-item">
                <div class="check-icon"><i class="bi bi-check-lg"></i></div>
                <span class="check-text">До 10 участников бесплатно</span>
            </div>
            <div class="left-check-item">
                <div class="check-icon"><i class="bi bi-check-lg"></i></div>
                <span class="check-text">Канбан, списки, аналитика</span>
            </div>
            <div class="left-check-item">
                <div class="check-icon"><i class="bi bi-check-lg"></i></div>
                <span class="check-text">Без кредитной карты</span>
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

        <h2 class="right-heading">Создать аккаунт 🚀</h2>
        <p class="right-sub">
            Уже есть аккаунт? <a href="/auth/login">Войти</a>
        </p>

        <form class="register-form" action="/auth/register" method="post" id="registerForm">
            <#if _csrf??>
            <input type="hidden"
                   name="${(_csrf.parameterName)!'csrf-param-name'}"
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
                <button type="button" class="password-toggle-btn" id="togglePassword">
                    <i class="bi bi-eye" id="toggleIcon"></i>
                </button>
            </div>

            <div class="password-strength">
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

        <div class="divider">
            <div class="divider-line"></div>
            <span class="divider-text">или</span>
            <div class="divider-line"></div>
        </div>

        <div class="login-link">
            Уже есть аккаунт? <a href="/auth/login">Войти →</a>
        </div>
    </div>
</div>

<script>
    const toggleBtn  = document.getElementById('togglePassword');
    const toggleIcon = document.getElementById('toggleIcon');
    const passInput  = document.getElementById('password');

    toggleBtn.addEventListener('click', () => {
        const isPass = passInput.type === 'password';
        passInput.type = isPass ? 'text' : 'password';
        toggleIcon.className = isPass ? 'bi bi-eye-slash' : 'bi bi-eye';
    });

    const bar      = document.getElementById('passwordStrengthBar');
    const text     = document.getElementById('passwordStrengthText');
    const reqLen   = document.getElementById('req-length');
    const reqLet   = document.getElementById('req-letter');
    const reqNum   = document.getElementById('req-number');

    const levels = [
        { label: '',          color: '',        width: '0%' },
        { label: 'Слабый',    color: '#ef4444', width: '33%' },
        { label: 'Средний',   color: '#f59e0b', width: '66%' },
        { label: 'Надёжный',  color: '#22c55e', width: '100%' },
    ];

    passInput.addEventListener('input', () => {
        const val = passInput.value;

        const hasLen = val.length >= 8;
        const hasLet = /[a-zA-Zа-яА-Я]/.test(val);
        const hasNum = /\d/.test(val);

        reqLen.classList.toggle('met', hasLen);
        reqLet.classList.toggle('met', hasLet);
        reqNum.classList.toggle('met', hasNum);

        const score = (hasLen ? 1 : 0) + (hasLet ? 1 : 0) + (hasNum ? 1 : 0);
        const level = val.length === 0 ? 0 : score;

        bar.style.width      = levels[level].width;
        bar.style.background = levels[level].color;
        text.textContent     = levels[level].label;
        text.style.color     = levels[level].color;
    });
</script>
</body>
</html>