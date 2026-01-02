<#import "layout.ftlh" as main>
<@main.layout>
    <title>TaskManager Pro - Управление проектами</title>
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
        }

        .hero {
            padding: 120px 48px 80px;
            text-align: center;
            max-width: 1200px;
            margin: 0 auto;
        }

        .hero-title {
            font-size: 56px;
            font-weight: 600;
            color: #1a1a1a;
            margin-bottom: 24px;
            line-height: 1.2;
        }

        .hero-subtitle {
            font-size: 20px;
            color: #666;
            margin-bottom: 40px;
            line-height: 1.6;
            max-width: 700px;
            margin-left: auto;
            margin-right: auto;
        }

        .hero-buttons {
            display: flex;
            gap: 16px;
            justify-content: center;
            margin-bottom: 80px;
        }

        .btn-large {
            padding: 16px 32px;
            font-size: 16px;
        }

        .btn-secondary {
            background: #ffffff;
            color: #1a1a1a;
        }

        .btn-secondary:hover {
            background: #f5f5f5;
        }

        .screenshot-container {
            background: #f5f5f5;
            border: 1px solid #e0e0e0;
            border-radius: 8px;
            padding: 24px;
            margin-bottom: 40px;
            min-height: 500px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .screenshot-placeholder {
            color: #999;
            font-size: 16px;
            text-align: center;
        }

        .screenshot-img {
            max-width: 100%;
            height: auto;
            border-radius: 4px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }

        .features {
            padding: 80px 48px;
            background: #ffffff;
        }

        .section-title {
            font-size: 42px;
            font-weight: 600;
            text-align: center;
            margin-bottom: 64px;
            color: #1a1a1a;
        }

        .features-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 48px;
            max-width: 1200px;
            margin: 0 auto;
        }

        .feature-card {
            text-align: center;
        }

        .feature-icon {
            width: 100%;
            height: 240px;
            background: #f5f5f5;
            border: 1px solid #e0e0e0;
            border-radius: 8px;
            margin-bottom: 24px;
            display: flex;
            align-items: center;
            justify-content: center;
            overflow: hidden;
        }

        .feature-icon-placeholder {
            color: #999;
            font-size: 14px;
        }

        .feature-title {
            font-size: 20px;
            font-weight: 600;
            margin-bottom: 12px;
            color: #1a1a1a;
        }

        .feature-description {
            font-size: 15px;
            color: #666;
            line-height: 1.6;
        }

        .showcase {
            padding: 80px 48px;
            background: #f5f5f5;
        }

        .showcase-item {
            max-width: 1200px;
            margin: 0 auto 80px;
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 64px;
            align-items: center;
        }

        .showcase-item:nth-child(even) {
            direction: rtl;
        }

        .showcase-item:nth-child(even) > * {
            direction: ltr;
        }

        .showcase-content h3 {
            font-size: 32px;
            font-weight: 600;
            margin-bottom: 16px;
            color: #1a1a1a;
        }

        .showcase-content p {
            font-size: 16px;
            color: #666;
            line-height: 1.6;
            margin-bottom: 24px;
        }

        .showcase-image {
            width: 100%;
            height: 400px;
            background: #ffffff;
            border: 1px solid #e0e0e0;
            border-radius: 8px;
            display: flex;
            align-items: center;
            justify-content: center;
            overflow: hidden;
        }

        .showcase-image-placeholder {
            color: #999;
            font-size: 14px;
        }

        .cta {
            padding: 120px 48px;
            text-align: center;
            background: #1a1a1a;
            color: #ffffff;
        }

        .cta h2 {
            font-size: 42px;
            font-weight: 600;
            margin-bottom: 24px;
        }

        .cta p {
            font-size: 18px;
            color: #ccc;
            margin-bottom: 40px;
        }

        .cta .btn {
            background: #ffffff;
            color: #1a1a1a;
        }

        .cta .btn:hover {
            background: #f5f5f5;
        }

        .instruction-note {
            background: #fff9e6;
            border: 1px solid #ffe066;
            border-radius: 4px;
            padding: 12px 16px;
            margin: 16px 0;
            font-size: 13px;
            color: #666;
            text-align: left;
        }

        .instruction-note strong {
            color: #1a1a1a;
        }
    </style>
</head>
<body>
<section class="hero">
    <h1 class="hero-title">Управляйте проектами<br>профессионально</h1>
    <p class="hero-subtitle">Мощный инструмент для команд любого размера. Планируйте спринты, отслеживайте задачи и достигайте целей быстрее с TaskManager Pro.</p>
    <div class="hero-buttons">
        <button class="btn btn-large">Попробовать бесплатно</button>
        <button class="btn btn-large btn-secondary">Смотреть демо</button>
    </div>

    <div class="screenshot-container">
        <div class="screenshot-placeholder">
            <strong>Главный скриншот интерфейса</strong><br>
            <div class="instruction-note" style="max-width: 600px; margin: 16px auto;">
                <strong>Как вставить изображение:</strong><br>
                1. Замените этот блок на: &lt;img src="ваш-скриншот.jpg" class="screenshot-img" alt="Интерфейс TaskManager"&gt;<br>
                2. Или используйте background-image в style атрибуте родительского div
            </div>
        </div>
    </div>
</section>

<section class="features" id="features">
    <h2 class="section-title">Всё необходимое для работы</h2>
    <div class="features-grid">
        <div class="feature-card">
            <!-- ВСТАВЬТЕ СКРИНШОТ КАНБАН-ДОСКИ -->
            <div class="feature-icon">
                <div class="feature-icon-placeholder">
                    Скриншот 1:<br>Канбан-доска<br><br>
                    <small>280x240px рекомендуется</small>
                </div>
            </div>
            <h3 class="feature-title">Канбан-доски</h3>
            <p class="feature-description">Визуализируйте рабочий процесс с помощью гибких досок и карточек задач.</p>
        </div>

        <div class="feature-card">
            <div class="feature-icon">
                <div class="feature-icon-placeholder">
                    Скриншот 2:<br>Таймлайн проекта<br><br>
                    <small>280x240px рекомендуется</small>
                </div>
            </div>
            <h3 class="feature-title">Временные шкалы</h3>
            <p class="feature-description">Планируйте проекты и отслеживайте прогресс на интерактивном таймлайне.</p>
        </div>

        <div class="feature-card">
            <!-- ВСТАВЬТЕ СКРИНШОТ ОТЧЁТОВ -->
            <div class="feature-icon">
                <div class="feature-icon-placeholder">
                    Скриншот 3:<br>Аналитика<br><br>
                    <small>280x240px рекомендуется</small>
                </div>
            </div>
            <h3 class="feature-title">Аналитика</h3>
            <p class="feature-description">Получайте детальные отчёты о производительности команды и проектов.</p>
        </div>
    </div>
</section>

<section class="showcase" id="showcase">
    <div class="showcase-item">
        <div class="showcase-content">
            <h3>Организуйте задачи легко</h3>
            <p>Создавайте задачи, назначайте исполнителей, устанавливайте приоритеты и сроки. Перетаскивайте карточки между колонками для изменения статуса.</p>
            <button class="btn">Узнать больше</button>
        </div>
        <div class="showcase-image">
            <div class="showcase-image-placeholder">
                Скриншот: Работа с задачами<br>
                550x400px рекомендуется
            </div>
        </div>
    </div>

    <div class="showcase-item">
        <div class="showcase-content">
            <h3>Совместная работа в команде</h3>
            <p>Комментируйте задачи, упоминайте коллег, прикрепляйте файлы. Вся команда всегда в курсе происходящего.</p>
            <button class="btn">Попробовать</button>
        </div>
        <div class="showcase-image">
            <div class="showcase-image-placeholder">
                Скриншот: Командная работа<br>
                550x400px рекомендуется
            </div>
        </div>
    </div>

    <div class="showcase-item">
        <div class="showcase-content">
            <h3>Отслеживайте прогресс</h3>
            <p>Просматривайте статистику по проектам, анализируйте скорость работы команды и выявляйте узкие места.</p>
            <button class="btn">Подробнее</button>
        </div>
        <div class="showcase-image">
            <div class="showcase-image-placeholder">
                Скриншот: Дашборд<br>
                550x400px рекомендуется
            </div>
        </div>
    </div>
</section>

<section class="cta">
    <h2>Готовы начать?</h2>
    <p>Присоединяйтесь к тысячам команд, которые уже используют TaskManager Pro</p>
    <button class="btn btn-large">Создать бесплатный аккаунт</button>
</section>
</body>
</html>
</@main.layout>