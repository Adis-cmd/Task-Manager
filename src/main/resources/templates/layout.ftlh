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
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
            background: #f0f4f8;
            display: flex;
            min-height: 100vh;
        }

        .sidebar {
            width: 230px;
            min-height: 100vh;
            background: #ffffff;
            border-right: 1px solid #e8ecf0;
            display: flex;
            flex-direction: column;
            position: fixed;
            top: 0;
            left: 0;
            z-index: 200;
            transition: transform 0.3s ease;
        }

        .sidebar-logo {
            display: flex;
            align-items: center;
            gap: 10px;
            padding: 22px 20px;
            text-decoration: none;
            border-bottom: 1px solid #e8ecf0;
        }

        .sidebar-logo-icon {
            width: 36px;
            height: 36px;
            background: #00bcd4;
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #fff;
            font-size: 18px;
            flex-shrink: 0;
        }

        .sidebar-logo-text {
            font-size: 17px;
            font-weight: 700;
            color: #1a1a1a;
        }

        .sidebar-nav {
            flex: 1;
            padding: 16px 12px;
            display: flex;
            flex-direction: column;
            gap: 4px;
        }

        .sidebar-link {
            display: flex;
            align-items: center;
            gap: 12px;
            padding: 11px 14px;
            border-radius: 10px;
            text-decoration: none;
            color: #6b7280;
            font-size: 14px;
            font-weight: 500;
            transition: all 0.2s ease;
        }

        .sidebar-link i {
            font-size: 18px;
            flex-shrink: 0;
        }

        .sidebar-link:hover {
            background: #f0f9fb;
            color: #00bcd4;
        }

        .sidebar-link.active {
            background: #00bcd4;
            color: #ffffff;
            font-weight: 600;
        }

        .sidebar-link.active i {
            color: #ffffff;
        }

        .sidebar-divider {
            height: 1px;
            background: #e8ecf0;
            margin: 8px 12px;
        }

        .sidebar-bottom {
            padding: 12px 12px 20px;
        }

        .sidebar-logout {
            display: flex;
            align-items: center;
            gap: 12px;
            padding: 11px 14px;
            border-radius: 10px;
            text-decoration: none;
            color: #ef4444;
            font-size: 14px;
            font-weight: 500;
            transition: all 0.2s ease;
            background: none;
            border: none;
            cursor: pointer;
            width: 100%;
            font-family: inherit;
        }

        .sidebar-logout i {
            font-size: 18px;
        }

        .sidebar-logout:hover {
            background: #fef2f2;
        }

        .page-wrapper {
            margin-left: 230px;
            flex: 1;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        .header {
            background: #ffffff;
            border-bottom: 1px solid #e8ecf0;
            padding: 0 32px;
            height: 68px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            position: sticky;
            top: 0;
            z-index: 100;
            transition: box-shadow 0.3s ease;
        }

        .header.scrolled {
            box-shadow: 0 2px 8px rgba(0,0,0,0.06);
        }

        .header-search {
            display: flex;
            align-items: center;
            gap: 10px;
            background: #f5f7fa;
            border: 1px solid #e8ecf0;
            border-radius: 10px;
            padding: 9px 16px;
            width: 280px;
            transition: border-color 0.2s;
        }

        .header-search:focus-within {
            border-color: #00bcd4;
        }

        .header-search i {
            color: #9ca3af;
            font-size: 16px;
        }

        .header-search input {
            border: none;
            background: none;
            outline: none;
            font-size: 14px;
            color: #374151;
            width: 100%;
        }

        .header-search input::placeholder {
            color: #9ca3af;
        }

        .header-right {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .header-icon-btn {
            width: 40px;
            height: 40px;
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            background: #f5f7fa;
            border: 1px solid #e8ecf0;
            color: #6b7280;
            font-size: 18px;
            cursor: pointer;
            text-decoration: none;
            transition: all 0.2s;
            position: relative;
        }

        .header-icon-btn:hover {
            background: #f0f9fb;
            color: #00bcd4;
            border-color: #00bcd4;
        }

        .notif-badge {
            position: absolute;
            top: -4px;
            right: -4px;
            width: 16px;
            height: 16px;
            background: #ef4444;
            border-radius: 50%;
            font-size: 10px;
            color: #fff;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: 600;
        }

        .header-profile {
            display: flex;
            align-items: center;
            gap: 10px;
            padding: 6px 12px 6px 6px;
            background: #f5f7fa;
            border: 1px solid #e8ecf0;
            border-radius: 10px;
            text-decoration: none;
            cursor: pointer;
            transition: all 0.2s;
        }

        .header-profile:hover {
            border-color: #00bcd4;
            background: #f0f9fb;
        }

        .header-avatar {
            width: 32px;
            height: 32px;
            border-radius: 8px;
            background: #00bcd4;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #fff;
            font-size: 16px;
        }

        .header-profile-info {
            display: flex;
            flex-direction: column;
        }

        .header-profile-name {
            font-size: 13px;
            font-weight: 600;
            color: #1a1a1a;
            line-height: 1.2;
        }

        .header-profile-role {
            font-size: 11px;
            color: #9ca3af;
        }

        .container {
            flex: 1;
            padding: 32px;
            max-width: 100%;
        }

        .footer {
            padding: 24px 32px;
            background: #ffffff;
            border-top: 1px solid #e8ecf0;
            text-align: center;
            color: #9ca3af;
            font-size: 13px;
        }

        .footer-links {
            display: flex;
            justify-content: center;
            gap: 24px;
            margin-top: 8px;
        }

        .footer-links a {
            color: #9ca3af;
            text-decoration: none;
            transition: color 0.2s;
        }

        .footer-links a:hover {
            color: #00bcd4;
        }

        .burger-menu {
            display: none;
            flex-direction: column;
            gap: 5px;
            cursor: pointer;
            padding: 8px;
            background: none;
            border: none;
            z-index: 300;
        }

        .burger-line {
            width: 22px;
            height: 2px;
            background: #1a1a1a;
            transition: all 0.3s ease;
            border-radius: 2px;
        }

        .burger-menu.active .burger-line:nth-child(1) { transform: rotate(45deg) translate(6px, 6px); }
        .burger-menu.active .burger-line:nth-child(2) { opacity: 0; }
        .burger-menu.active .burger-line:nth-child(3) { transform: rotate(-45deg) translate(6px, -6px); }

        .sidebar-overlay {
            display: none;
            position: fixed;
            inset: 0;
            background: rgba(0,0,0,0.3);
            z-index: 199;
        }

        @media (max-width: 768px) {
            .sidebar {
                transform: translateX(-100%);
            }

            .sidebar.open {
                transform: translateX(0);
            }

            .sidebar-overlay.open {
                display: block;
            }

            .page-wrapper {
                margin-left: 0;
            }

            .burger-menu {
                display: flex;
            }

            .header-search {
                width: 160px;
            }

            .header-profile-info {
                display: none;
            }

            .container {
                padding: 20px 16px;
            }
        }
    </style>
</head>
<body>

<div class="sidebar-overlay" id="sidebarOverlay"></div>

<aside class="sidebar" id="sidebar">
    <a href="/" class="sidebar-logo">
        <div class="sidebar-logo-icon">
            <i class="bi bi-kanban-fill"></i>
        </div>
        <span class="sidebar-logo-text">TaskManager</span>
    </a>

    <nav class="sidebar-nav">
        <#assign currentPath = springMacroRequestContext.requestUri>

        <a href="/" class="sidebar-link ${(currentPath == '/')?then('active', '')}">
            <i class="bi bi-house-door-fill"></i>
            Главная
        </a>

        <a href="/projects" class="sidebar-link ${(currentPath?starts_with('/projects'))?then('active', '')}">
            <i class="bi bi-kanban"></i>
            Проекты
        </a>

        <a href="/tasks" class="sidebar-link ${(currentPath?starts_with('/tasks'))?then('active', '')}">
            <i class="bi bi-list-check"></i>
            Задачи
        </a>

        <a href="/team" class="sidebar-link ${(currentPath?starts_with('/team'))?then('active', '')}">
            <i class="bi bi-people-fill"></i>
            Команда
        </a>

        <div class="sidebar-divider"></div>

        <a href="/profile/main" class="sidebar-link ${(currentPath?starts_with('/profile'))?then('active', '')}">
            <i class="bi bi-person-circle"></i>
            Профиль
        </a>

        <a href="/settings" class="sidebar-link ${(currentPath?starts_with('/settings'))?then('active', '')}">
            <i class="bi bi-gear-fill"></i>
            Настройки
        </a>
    </nav>

    <div class="sidebar-bottom">
        <div class="sidebar-divider"></div>
        <#if SPRING_SECURITY_CONTEXT?? && SPRING_SECURITY_CONTEXT.authentication??>
        <#if _csrf??>
        <form action="/logout" method="post">
            <input type="hidden" name="${(_csrf.parameterName)!'csrf'}"
                   value="${(_csrf.token)!'--no-token--'}"/>
            <button type="submit" class="sidebar-logout">
                <i class="bi bi-box-arrow-right"></i>
                Выйти
            </button>
        </form>
    </#if>
    <#else>
    <a href="/auth/login" class="sidebar-link">
        <i class="bi bi-box-arrow-in-right"></i>
        Войти
    </a>
</#if>
</div>
</aside>

<div class="page-wrapper">

    <header class="header" id="header">
        <div style="display: flex; align-items: center; gap: 12px;">
            <button class="burger-menu" id="burgerMenu">
                <span class="burger-line"></span>
                <span class="burger-line"></span>
                <span class="burger-line"></span>
            </button>

            <div class="header-search">
                <i class="bi bi-search"></i>
                <input type="text" placeholder="Поиск...">
            </div>
        </div>

        <div class="header-right">
            <a href="/notifications" class="header-icon-btn">
                <i class="bi bi-bell-fill"></i>
                <span class="notif-badge">3</span>
            </a>

            <#if SPRING_SECURITY_CONTEXT?? && SPRING_SECURITY_CONTEXT.authentication??>
            <a href="/profile/main" class="header-profile">
                <div class="header-avatar">
                    <i class="bi bi-person-fill"></i>
                </div>
                <div class="header-profile-info">
                    <span class="header-profile-name">${SPRING_SECURITY_CONTEXT.authentication.name!'Пользователь'}</span>
                    <span class="header-profile-role">Участник</span>
                </div>
            </a>
            <#else>
            <a href="/auth/login" class="header-icon-btn">
                <i class="bi bi-box-arrow-in-right"></i>
            </a>
        </#if>
</div>
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

</div>

<script>
    window.addEventListener('scroll', function() {
        const header = document.getElementById('header');
        header.classList.toggle('scrolled', window.scrollY > 0);
    });

    const burgerMenu = document.getElementById('burgerMenu');
    const sidebar = document.getElementById('sidebar');
    const overlay = document.getElementById('sidebarOverlay');

    function toggleSidebar() {
        burgerMenu.classList.toggle('active');
        sidebar.classList.toggle('open');
        overlay.classList.toggle('open');
        document.body.style.overflow = sidebar.classList.contains('open') ? 'hidden' : '';
    }

    burgerMenu.addEventListener('click', toggleSidebar);
    overlay.addEventListener('click', toggleSidebar);
</script>

</body>
</html>

</#macro>
