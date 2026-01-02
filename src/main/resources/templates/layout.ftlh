<#import "spring.ftl" as spring>
<#macro layout>

<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>TaskManager Pro</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.11.1/font/bootstrap-icons.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif;
            background: #ffffff;
            color: #1a1a1a;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        .header {
            background: #ffffff;
            border-bottom: 1px solid #e0e0e0;
            padding: 0 48px;
            height: 70px;
            display: grid;
            grid-template-columns: 250px 1fr 250px;
            align-items: center;
            position: sticky;
            top: 0;
            z-index: 100;
            transition: box-shadow 0.3s ease;
        }

        .header.scrolled {
            box-shadow: 0 2px 8px rgba(0,0,0,0.08);
        }

        .logo {
            font-size: 22px;
            font-weight: 600;
            color: #1a1a1a;
            display: flex;
            align-items: center;
            gap: 8px;
            text-decoration: none;
            transition: transform 0.3s ease;
        }

        .logo:hover {
            transform: scale(1.05);
        }

        .logo i {
            font-size: 24px;
            color: #1a1a1a;
        }

        .nav {
            display: flex;
            gap: 40px;
            align-items: center;
            justify-content: center;
        }

        .nav-right {
            display: flex;
            gap: 12px;
            align-items: center;
            justify-content: flex-end;
        }

        .burger-menu {
            display: none;
            flex-direction: column;
            gap: 5px;
            cursor: pointer;
            padding: 8px;
            background: none;
            border: none;
            z-index: 101;
        }

        .burger-line {
            width: 24px;
            height: 2px;
            background: #1a1a1a;
            transition: all 0.3s ease;
        }

        .burger-menu.active .burger-line:nth-child(1) {
            transform: rotate(45deg) translate(7px, 7px);
        }

        .burger-menu.active .burger-line:nth-child(2) {
            opacity: 0;
        }

        .burger-menu.active .burger-line:nth-child(3) {
            transform: rotate(-45deg) translate(7px, -7px);
        }

        .mobile-menu {
            display: none;
            position: fixed;
            top: 70px;
            left: 0;
            right: 0;
            background: #ffffff;
            border-bottom: 1px solid #e0e0e0;
            padding: 24px;
            z-index: 99;
            box-shadow: 0 4px 12px rgba(0,0,0,0.08);
            max-height: calc(100vh - 70px);
            overflow-y: auto;
        }

        .mobile-menu.active {
            display: block;
            animation: slideDown 0.3s ease;
        }

        @keyframes slideDown {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .mobile-nav {
            display: flex;
            flex-direction: column;
            gap: 16px;
        }

        .mobile-nav-link {
            color: #666;
            text-decoration: none;
            font-size: 16px;
            font-weight: 500;
            padding: 12px 16px;
            border-radius: 4px;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .mobile-nav-link i {
            font-size: 18px;
            opacity: 1;
            transform: none;
        }

        .mobile-nav-link:hover,
        .mobile-nav-link.active {
            background: #f5f5f5;
            color: #1a1a1a;
        }

        .mobile-nav-link.active {
            font-weight: 600;
        }

        .mobile-divider {
            height: 1px;
            background: #e0e0e0;
            margin: 8px 0;
        }

        .mobile-btn {
            width: 100%;
            text-align: center;
        }

        .nav-link {
            color: #666;
            text-decoration: none;
            font-size: 15px;
            font-weight: 500;
            transition: all 0.3s ease;
            position: relative;
            display: flex;
            align-items: center;
            gap: 6px;
            padding: 8px 0;
        }

        .nav-link i {
            font-size: 16px;
            opacity: 0;
            transform: translateX(-5px);
            transition: all 0.3s ease;
        }

        .nav-link:hover {
            color: #1a1a1a;
        }

        .nav-link:hover i {
            opacity: 1;
            transform: translateX(0);
        }

        .nav-link::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            width: 0;
            height: 2px;
            background: #1a1a1a;
            transition: width 0.3s ease;
        }

        .nav-link:hover::after,
        .nav-link.active::after {
            width: 100%;
        }

        .nav-link.active {
            color: #1a1a1a;
            font-weight: 600;
        }

        .btn {
            padding: 12px 24px;
            border: 1px solid #1a1a1a;
            border-radius: 4px;
            font-size: 15px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s ease;
            background: #1a1a1a;
            color: #ffffff;
            display: inline-flex;
            align-items: center;
            gap: 8px;
            text-decoration: none;
        }

        .btn:hover {
            background: #333;
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(0,0,0,0.15);
        }

        .btn i {
            font-size: 16px;
        }

        .btn-secondary {
            background: #ffffff;
            color: #1a1a1a;
        }

        .btn-secondary:hover {
            background: #f5f5f5;
        }

        .btn-logout {
            background: transparent;
            border: 1px solid #dc3545;
            color: #dc3545;
            padding: 10px 20px;
        }

        .btn-logout:hover {
            background: #dc3545;
            color: #ffffff;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 2rem;
            flex: 1;
        }

        .footer {
            padding: 48px;
            background: #ffffff;
            border-top: 1px solid #e0e0e0;
            text-align: center;
            color: #666;
            font-size: 14px;
            margin-top: auto;
        }

        .footer-links {
            display: flex;
            justify-content: center;
            gap: 2rem;
            margin-top: 1rem;
        }

        .footer-links a {
            color: #666;
            text-decoration: none;
            transition: color 0.3s ease;
        }

        .footer-links a:hover {
            color: #1a1a1a;
        }

        @media (max-width: 768px) {
            .header {
                grid-template-columns: 1fr auto;
                padding: 0 24px;
            }

            .nav {
                display: none;
            }

            .nav-right {
                display: none;
            }

            .burger-menu {
                display: flex;
            }
        }
    </style>
</head>
<body>

<header class="header" id="header">
    <a href="/" class="logo">
        <i class="bi bi-kanban-fill"></i>
        TaskManager Pro
    </a>

    <nav class="nav">
        <#assign currentPath = springMacroRequestContext.requestUri>

        <a href="/" class="nav-link ${(currentPath == '/')?then('active', '')}">
            <i class="bi bi-house-door-fill"></i>
            Главная
        </a>

        <#if SPRING_SECURITY_CONTEXT?? && SPRING_SECURITY_CONTEXT.authentication??>
        <#assign user = SPRING_SECURITY_CONTEXT.authentication.principal>
    </#if>

    <a href="/projects" class="nav-link ${(currentPath?starts_with('/projects'))?then('active', '')}">
        <i class="bi bi-kanban"></i>
        Проекты
    </a>

    <a href="/tasks" class="nav-link ${(currentPath?starts_with('/tasks'))?then('active', '')}">
        <i class="bi bi-list-check"></i>
        Задачи
    </a>

    <a href="/team" class="nav-link ${(currentPath?starts_with('/team'))?then('active', '')}">
        <i class="bi bi-people-fill"></i>
        Команда
    </a>

    <#if SPRING_SECURITY_CONTEXT?? && SPRING_SECURITY_CONTEXT.authentication??>
    <a href="/profile" class="nav-link ${(currentPath?starts_with('/profile'))?then('active', '')}">
        <i class="bi bi-person-circle"></i>
        Профиль
    </a>

    <#if _csrf??>
    <form action="/logout" method="post" style="display: inline;">
        <input type="hidden" name="${(_csrf.parameterName)!'csrf'}"
               value="${(_csrf.token)!'--no-token--'}"/>
        <button type="submit" class="btn btn-logout">
            <i class="bi bi-box-arrow-right"></i>
            Выйти
        </button>
    </form>
</#if>
<#else>
<a href="/auth/login" class="btn">
    <i class="bi bi-box-arrow-in-right"></i>
    Войти
</a>
</#if>
</nav>
</header>

<div class="container">
    <#nested spring>
</div>

<footer class="footer">
    <p>© 2024 TaskManager Pro. Все права защищены</p>
    <div class="footer-links">
        <a href="/about">О нас</a>
        <a href="/privacy">Политика</a>
        <a href="/terms">Условия</a>
        <a href="/contact">Связаться</a>
    </div>
</footer>

<script>
    // Добавление тени при скролле
    window.addEventListener('scroll', function() {
        const header = document.getElementById('header');
        if (window.scrollY > 0) {
            header.classList.add('scrolled');
        } else {
            header.classList.remove('scrolled');
        }
    });
</script>

</body>
</html>

</#macro>