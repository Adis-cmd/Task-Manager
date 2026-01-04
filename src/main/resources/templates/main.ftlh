<#import "layout.ftlh" as main>
<@main.layout>
    <title>TaskManager Pro - Управление проектами</title>
    <link rel="stylesheet" href="/css/main.css">
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