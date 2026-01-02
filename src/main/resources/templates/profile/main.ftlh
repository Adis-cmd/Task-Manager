<#import "../layout.ftlh" as main>
<@main.layout ; spring>
<style>
    .profile-wrapper {
        max-width: 1400px;
        margin: 0 auto;
        padding: 40px 20px;
    }

    .profile-header {
        background: #ffffff;
        border: 1px solid #e0e0e0;
        border-radius: 8px;
        padding: 48px;
        margin-bottom: 32px;
        box-shadow: 0 2px 8px rgba(0,0,0,0.08);
        animation: fadeInUp 0.6s ease;
        display: flex;
        align-items: center;
        gap: 40px;
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

    .profile-avatar-section {
        flex-shrink: 0;
    }

    .profile-avatar-img {
        width: 140px;
        height: 140px;
        border-radius: 50%;
        object-fit: cover;
        border: 4px solid #f5f5f5;
        transition: all 0.3s ease;
    }

    .profile-avatar-placeholder {
        width: 140px;
        height: 140px;
        border-radius: 50%;
        background: #f5f5f5;
        display: flex;
        align-items: center;
        justify-content: center;
        border: 4px solid #e0e0e0;
        transition: all 0.3s ease;
    }

    .profile-avatar-placeholder i {
        font-size: 56px;
        color: #999;
    }

    .profile-avatar-img:hover,
    .profile-avatar-placeholder:hover {
        transform: scale(1.05);
        box-shadow: 0 4px 12px rgba(0,0,0,0.15);
    }

    .profile-info {
        flex: 1;
    }

    .profile-name {
        font-size: 36px;
        font-weight: 600;
        color: #1a1a1a;
        margin-bottom: 12px;
    }

    .profile-email {
        font-size: 16px;
        color: #666;
        margin-bottom: 24px;
    }

    .profile-actions {
        display: flex;
        gap: 12px;
    }

    .profile-btn {
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

    .profile-btn:hover {
        background: #333;
        transform: translateY(-2px);
        box-shadow: 0 4px 12px rgba(0,0,0,0.15);
        color: #ffffff;
    }

    .profile-btn i {
        font-size: 16px;
    }

    .profile-tabs {
        background: #ffffff;
        border: 1px solid #e0e0e0;
        border-radius: 8px;
        padding: 0;
        margin-bottom: 32px;
        box-shadow: 0 2px 8px rgba(0,0,0,0.08);
        animation: fadeInUp 0.6s ease 0.1s backwards;
        overflow: hidden;
    }

    .profile-tabs-list {
        display: flex;
        list-style: none;
        margin: 0;
        padding: 0;
    }

    .profile-tab {
        flex: 1;
    }

    .profile-tab-link {
        display: flex;
        align-items: center;
        justify-content: center;
        gap: 10px;
        padding: 20px 32px;
        color: #666;
        text-decoration: none;
        font-size: 15px;
        font-weight: 500;
        transition: all 0.3s ease;
        border-bottom: 3px solid transparent;
        position: relative;
    }

    .profile-tab-link i {
        font-size: 20px;
    }

    .profile-tab-link:hover {
        background: #f5f5f5;
        color: #1a1a1a;
    }

    .profile-tab-link.active {
        color: #1a1a1a;
        background: #f5f5f5;
        border-bottom-color: #1a1a1a;
        font-weight: 600;
    }

    .profile-section {
        background: #ffffff;
        border: 1px solid #e0e0e0;
        border-radius: 8px;
        padding: 40px;
        margin-bottom: 32px;
        box-shadow: 0 2px 8px rgba(0,0,0,0.08);
        animation: fadeInUp 0.6s ease 0.2s backwards;
    }

    .profile-section-title {
        font-size: 28px;
        font-weight: 600;
        color: #1a1a1a;
        margin-bottom: 32px;
        display: flex;
        align-items: center;
        gap: 12px;
    }

    .profile-section-title i {
        font-size: 32px;
    }

    .projects-grid {
        display: grid;
        grid-template-columns: repeat(auto-fill, minmax(340px, 1fr));
        gap: 24px;
    }

    .project-card {
        background: #f5f5f5;
        border: 1px solid #e0e0e0;
        border-radius: 8px;
        padding: 24px;
        transition: all 0.3s ease;
        cursor: pointer;
    }

    .project-card:hover {
        transform: translateY(-4px);
        box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        border-color: #1a1a1a;
    }

    .project-header {
        display: flex;
        align-items: flex-start;
        justify-content: space-between;
        margin-bottom: 16px;
    }

    .project-name {
        font-size: 18px;
        font-weight: 600;
        color: #1a1a1a;
        margin-bottom: 8px;
    }

    .project-role {
        display: inline-flex;
        align-items: center;
        gap: 6px;
        padding: 4px 12px;
        background: #1a1a1a;
        color: #ffffff;
        border-radius: 12px;
        font-size: 12px;
        font-weight: 500;
    }

    .project-role.leader {
        background: #28a745;
    }

    .project-role.member {
        background: #6c757d;
    }

    .project-leader {
        display: flex;
        align-items: center;
        gap: 12px;
        padding-top: 16px;
        border-top: 1px solid #e0e0e0;
    }

    .project-leader-avatar {
        width: 32px;
        height: 32px;
        border-radius: 50%;
        object-fit: cover;
    }

    .project-leader-placeholder {
        width: 32px;
        height: 32px;
        border-radius: 50%;
        background: #e0e0e0;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .project-leader-placeholder i {
        font-size: 16px;
        color: #999;
    }

    .project-leader-info {
        flex: 1;
    }

    .project-leader-label {
        font-size: 11px;
        color: #666;
        text-transform: uppercase;
        letter-spacing: 0.5px;
    }

    .project-leader-name {
        font-size: 14px;
        font-weight: 500;
        color: #1a1a1a;
    }

    .empty-state {
        text-align: center;
        padding: 80px 20px;
    }

    .empty-state i {
        font-size: 72px;
        color: #ccc;
        margin-bottom: 20px;
    }

    .empty-state-title {
        font-size: 24px;
        font-weight: 600;
        color: #1a1a1a;
        margin-bottom: 12px;
    }

    .empty-state-text {
        font-size: 16px;
        color: #666;
        margin-bottom: 32px;
    }

    .btn-create-project {
        padding: 14px 28px;
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

    .btn-create-project:hover {
        background: #333;
        transform: translateY(-2px);
        box-shadow: 0 4px 12px rgba(0,0,0,0.15);
        color: #ffffff;
    }

    .btn-create-project i {
        font-size: 16px;
    }

    @media (max-width: 768px) {
        .profile-header {
            flex-direction: column;
            text-align: center;
            padding: 32px 24px;
        }

        .profile-name {
            font-size: 28px;
        }

        .profile-actions {
            width: 100%;
            flex-direction: column;
        }

        .profile-btn {
            width: 100%;
            justify-content: center;
        }

        .profile-tabs-list {
            flex-direction: column;
        }

        .projects-grid {
            grid-template-columns: 1fr;
        }
    }
</style>

<div class="profile-wrapper">
    <div class="profile-header">
        <div class="profile-avatar-section">
            <#if profile.avatar?? && profile.avatar?has_content>
            <img src="/photo/${profile.avatar}" alt="${profile.name}" class="profile-avatar-img">
            <#else>
            <div class="profile-avatar-placeholder">
                <i class="bi bi-person-fill"></i>
            </div>
        </#if>
    </div>

    <div class="profile-info">
        <h1 class="profile-name">${profile.name}</h1>
        <div class="profile-email">${profile.projectDto?size} проектов</div>
        <div class="profile-actions">
            <a href="/profile/edit" class="profile-btn">
                <i class="bi bi-pencil-fill"></i>
                Редактировать профиль
            </a>
        </div>
    </div>
</div>

<!-- Табы -->
<div class="profile-tabs">
    <ul class="profile-tabs-list">
        <li class="profile-tab">
            <a href="/profile/main" class="profile-tab-link active">
                <i class="bi bi-kanban-fill"></i>
                Проекты
            </a>
        </li>
        <li class="profile-tab">
            <a href="/profile/activity" class="profile-tab-link">
                <i class="bi bi-clock-history"></i>
                Активность
            </a>
        </li>
        <li class="profile-tab">
            <a href="/profile/stats" class="profile-tab-link">
                <i class="bi bi-graph-up"></i>
                Статистика
            </a>
        </li>
    </ul>
</div>

<div class="profile-section">
    <h2 class="profile-section-title">
        <i class="bi bi-kanban-fill"></i>
        Мои проекты
    </h2>

    <#if profile.projectDto?? && profile.projectDto?has_content>
    <div class="projects-grid">
        <#list profile.projectDto as project>
        <div class="project-card" onclick="window.location.href='/projects/${project.id}'">
            <div class="project-header">
                <div>
                    <h3 class="project-name">${project.name}</h3>
                </div>
                <span class="project-role ${project.userRole?lower_case}">
                                    <i class="bi bi-${(project.userRole == 'LEADER')?then('star-fill', 'person-fill')}"></i>
                                    ${(project.userRole == 'LEADER')?then('Лидер', 'Участник')}
                                </span>
            </div>

            <div class="project-leader">
                <#if project.leader.avatar?? && project.leader.avatar?has_content>
                <img src="${project.leader.avatar}" alt="${project.leader.name}" class="project-leader-avatar">
                <#else>
                <div class="project-leader-placeholder">
                    <i class="bi bi-person-fill"></i>
                </div>
            </#if>
            <div class="project-leader-info">
                <div class="project-leader-label">Руководитель</div>
                <div class="project-leader-name">${project.leader.name}</div>
            </div>
        </div>
    </div>
</#list>
</div>
<#else>
<div class="empty-state">
    <i class="bi bi-folder-x"></i>
    <h3 class="empty-state-title">Нет проектов</h3>
    <p class="empty-state-text">Вы пока не участвуете ни в одном проекте</p>
    <a href="/projects/create" class="btn-create-project">
        <i class="bi bi-plus-circle-fill"></i>
        Создать проект
    </a>
</div>
</#if>
</div>
</div>
</@main.layout>