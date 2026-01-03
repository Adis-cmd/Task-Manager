<#import "../layout.ftlh" as main>
<@main.layout ; spring>
<style>
    .profile-wrapper {
        max-width: 1600px;
        margin: 0 auto;
        padding: 40px 20px;
    }

    .profile-header {
        background: #ffffff;
        border: 1px solid #e0e0e0;
        border-radius: 12px;
        padding: 56px 64px;
        margin-bottom: 32px;
        box-shadow: 0 4px 16px rgba(0,0,0,0.06);
        animation: profileFadeInUp 0.6s ease;
        display: flex;
        align-items: center;
        gap: 56px;
        position: relative;
        overflow: hidden;
    }

    .profile-header::before {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        right: 0;
        height: 4px;
        background: linear-gradient(90deg, #1a1a1a 0%, #4a4a4a 100%);
    }

    @keyframes profileFadeInUp {
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
        position: relative;
    }

    .profile-avatar-image {
        width: 160px;
        height: 160px;
        border-radius: 50%;
        object-fit: cover;
        border: 4px solid #f5f5f5;
        transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
        box-shadow: 0 4px 12px rgba(0,0,0,0.1);
    }

    .profile-avatar-placeholder {
        width: 160px;
        height: 160px;
        border-radius: 50%;
        background: linear-gradient(135deg, #f5f5f5 0%, #e0e0e0 100%);
        display: flex;
        align-items: center;
        justify-content: center;
        border: 4px solid #e0e0e0;
        transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
        box-shadow: 0 4px 12px rgba(0,0,0,0.1);
    }

    .profile-avatar-placeholder i {
        font-size: 64px;
        color: #999;
    }

    .profile-info-container {
        flex: 1;
        min-width: 0;
    }

    .profile-user-name {
        font-size: 42px;
        font-weight: 700;
        color: #1a1a1a;
        margin-bottom: 16px;
        letter-spacing: -0.5px;
    }

    .profile-projects-count {
        font-size: 18px;
        color: #666;
        margin-bottom: 28px;
        display: flex;
        align-items: center;
        gap: 10px;
    }

    .profile-projects-count i {
        font-size: 22px;
        color: #999;
    }

    .profile-edit-button {
        padding: 16px 36px;
        border: 2px solid #1a1a1a;
        border-radius: 8px;
        font-size: 16px;
        font-weight: 600;
        background: #1a1a1a;
        color: #ffffff;
        display: inline-flex;
        align-items: center;
        gap: 12px;
        text-decoration: none;
        transition: all 0.3s ease;
    }

    .profile-edit-button:hover {
        background: #333;
        transform: translateY(-2px);
        box-shadow: 0 4px 12px rgba(0,0,0,0.2);
    }

    .profile-edit-button i {
        font-size: 20px;
    }

    .profile-navigation-tabs {
        background: #ffffff;
        border: 1px solid #e0e0e0;
        border-radius: 12px;
        margin-bottom: 32px;
        box-shadow: 0 4px 16px rgba(0,0,0,0.06);
        overflow: hidden;
    }

    .profile-navigation-list {
        display: flex;
        list-style: none;
        margin: 0;
        padding: 0;
        background: #fafafa;
    }

    .profile-navigation-item {
        flex: 1;
    }

    .profile-navigation-link {
        display: flex;
        align-items: center;
        justify-content: center;
        gap: 12px;
        padding: 24px 40px;
        color: #666;
        text-decoration: none;
        font-size: 16px;
        font-weight: 600;
        transition: all 0.3s ease;
        border-bottom: 3px solid transparent;
        position: relative;
    }

    .profile-navigation-link:hover {
        background: #ffffff;
        color: #1a1a1a;
    }

    .profile-navigation-link.active {
        color: #1a1a1a;
        background: #ffffff;
        border-bottom-color: #1a1a1a;
        font-weight: 700;
    }

    .profile-navigation-link i {
        font-size: 22px;
    }

    .profile-content-section {
        background: #ffffff;
        border: 1px solid #e0e0e0;
        border-radius: 12px;
        padding: 48px;
        box-shadow: 0 4px 16px rgba(0,0,0,0.06);
    }

    .profile-section-title {
        font-size: 32px;
        font-weight: 700;
        color: #1a1a1a;
        margin-bottom: 40px;
        display: flex;
        align-items: center;
        justify-content: space-between;
        gap: 14px;
    }

    .profile-section-title-content {
        display: flex;
        align-items: center;
        gap: 14px;
    }

    .profile-section-title i {
        font-size: 36px;
    }

    .profile-projects-grid {
        display: grid;
        grid-template-columns: repeat(auto-fill, minmax(380px, 1fr));
        gap: 28px;
    }

    .profile-project-card {
        background: #fafafa;
        border: 2px solid #e0e0e0;
        border-radius: 12px;
        padding: 32px;
        transition: all 0.3s ease;
        cursor: pointer;
    }

    .profile-project-card:hover {
        transform: translateY(-4px);
        box-shadow: 0 8px 24px rgba(0,0,0,0.12);
        border-color: #1a1a1a;
        background: #ffffff;
    }

    .profile-project-header {
        display: flex;
        align-items: flex-start;
        justify-content: space-between;
        margin-bottom: 20px;
        gap: 16px;
    }

    .profile-project-name {
        font-size: 22px;
        font-weight: 700;
        color: #1a1a1a;
        margin-bottom: 8px;
    }

    .profile-project-role-badge {
        display: inline-flex;
        align-items: center;
        gap: 8px;
        padding: 8px 16px;
        background: #1a1a1a;
        color: #ffffff;
        border-radius: 20px;
        font-size: 13px;
        font-weight: 700;
        text-transform: uppercase;
        white-space: nowrap;
    }

    .profile-project-leader-info {
        display: flex;
        align-items: center;
        gap: 14px;
        padding-top: 20px;
        border-top: 2px solid #e0e0e0;
        margin-top: 20px;
    }

    .profile-project-leader-avatar {
        width: 40px;
        height: 40px;
        border-radius: 50%;
        object-fit: cover;
        border: 2px solid #e0e0e0;
    }

    .profile-project-leader-placeholder {
        width: 40px;
        height: 40px;
        border-radius: 50%;
        background: linear-gradient(135deg, #e0e0e0 0%, #d0d0d0 100%);
        display: flex;
        align-items: center;
        justify-content: center;
        border: 2px solid #d0d0d0;
    }

    .profile-project-leader-placeholder i {
        font-size: 20px;
        color: #999;
    }

    .profile-project-leader-label {
        font-size: 11px;
        color: #999;
        text-transform: uppercase;
        font-weight: 700;
        margin-bottom: 4px;
    }

    .profile-project-leader-name {
        font-size: 15px;
        font-weight: 600;
        color: #1a1a1a;
    }

    .profile-empty-state {
        text-align: center;
        padding: 100px 20px;
    }

    .profile-empty-state i {
        font-size: 96px;
        color: #d0d0d0;
        margin-bottom: 28px;
        display: block;
    }

    .profile-empty-state-title {
        font-size: 30px;
        font-weight: 700;
        color: #1a1a1a;
        margin-bottom: 14px;
    }

    .profile-empty-state-text {
        font-size: 18px;
        color: #666;
        margin-bottom: 36px;
    }

    .profile-create-project-button {
        padding: 16px 32px;
        border: none;
        border-radius: 8px;
        font-size: 17px;
        font-weight: 700;
        cursor: pointer;
        background: #1a1a1a;
        color: #ffffff;
        display: inline-flex;
        align-items: center;
        gap: 12px;
        transition: all 0.3s ease;
    }

    .profile-create-project-button:hover {
        background: #333;
        transform: translateY(-2px);
        box-shadow: 0 6px 20px rgba(0,0,0,0.2);
    }

    .profile-create-project-button i {
        font-size: 22px;
    }

    .profile-modal-overlay {
        display: none;
        position: fixed;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        background: rgba(0, 0, 0, 0.6);
        z-index: 1000;
        backdrop-filter: blur(4px);
    }

    .profile-modal-overlay.active {
        display: flex;
        align-items: center;
        justify-content: center;
        padding: 20px;
    }

    .profile-modal-container {
        background: #ffffff;
        border-radius: 12px;
        width: 100%;
        max-width: 540px;
        box-shadow: 0 20px 60px rgba(0,0,0,0.3);
    }

    .profile-modal-header {
        padding: 32px 40px 24px;
        border-bottom: 2px solid #e0e0e0;
        position: relative;
    }

    .profile-modal-title {
        font-size: 28px;
        font-weight: 700;
        color: #1a1a1a;
        margin: 0;
        display: flex;
        align-items: center;
        gap: 12px;
    }

    .profile-modal-title i {
        font-size: 32px;
    }

    .profile-modal-close {
        position: absolute;
        top: 32px;
        right: 32px;
        background: transparent;
        border: none;
        font-size: 28px;
        cursor: pointer;
        color: #999;
        width: 40px;
        height: 40px;
        border-radius: 8px;
        transition: all 0.3s ease;
    }

    .profile-modal-close:hover {
        background: #f5f5f5;
        color: #1a1a1a;
    }

    .profile-modal-body {
        padding: 32px 40px;
    }

    .profile-modal-form-group {
        margin-bottom: 24px;
    }

    .profile-modal-label {
        display: block;
        font-size: 15px;
        font-weight: 600;
        color: #1a1a1a;
        margin-bottom: 10px;
    }

    .profile-modal-input {
        width: 100%;
        padding: 16px 20px;
        border: 2px solid #e0e0e0;
        border-radius: 8px;
        font-size: 16px;
        color: #1a1a1a;
        box-sizing: border-box;
    }

    .profile-modal-input:focus {
        outline: none;
        border-color: #1a1a1a;
    }

    .profile-modal-footer {
        padding: 24px 40px 32px;
        display: flex;
        gap: 12px;
        justify-content: flex-end;
    }

    .profile-modal-button {
        padding: 14px 32px;
        border: 2px solid #1a1a1a;
        border-radius: 8px;
        font-size: 16px;
        font-weight: 600;
        cursor: pointer;
        transition: all 0.3s ease;
    }

    .profile-modal-button-primary {
        background: #1a1a1a;
        color: #ffffff;
    }

    .profile-modal-button-primary:hover {
        background: #333;
    }

    .profile-modal-button-secondary {
        background: #ffffff;
        color: #1a1a1a;
        border-color: #e0e0e0;
    }

    .profile-modal-button-secondary:hover {
        background: #f5f5f5;
        border-color: #1a1a1a;
    }

    .profile-flash-message {
        position: fixed;
        top: 20px;
        right: 20px;
        padding: 18px 24px;
        border-radius: 8px;
        display: flex;
        align-items: center;
        gap: 12px;
        font-size: 15px;
        font-weight: 600;
        box-shadow: 0 8px 24px rgba(0,0,0,0.15);
        z-index: 2000;
        max-width: 400px;
    }

    .profile-flash-success {
        background: #1a1a1a;
        color: #ffffff;
    }

    .profile-flash-error {
        background: #2d2d2d;
        color: #ffffff;
    }

    .profile-flash-message i {
        font-size: 22px;
    }

    .profile-flash-close {
        background: transparent;
        border: none;
        color: #ffffff;
        font-size: 24px;
        cursor: pointer;
        padding: 0;
        width: 32px;
        height: 32px;
        border-radius: 4px;
        transition: all 0.3s ease;
    }

    .profile-flash-close:hover {
        background: rgba(255,255,255,0.1);
    }
</style>

<div class="profile-wrapper">
    <div class="profile-header">
        <div class="profile-avatar-section">
            <#if profile.avatar?? && profile.avatar?has_content>
            <img src="/photo/${profile.avatar}" alt="${profile.name}" class="profile-avatar-image">
            <#else>
            <div class="profile-avatar-placeholder">
                <i class="bi bi-person-fill"></i>
            </div>
        </#if>
    </div>

    <div class="profile-info-container">
        <h1 class="profile-user-name">${profile.name}</h1>
        <div class="profile-projects-count">
            <i class="bi bi-kanban"></i>
            <span>${profile.projectDto?size} проектов</span>
        </div>
        <a href="/profile/edit" class="profile-edit-button">
            <i class="bi bi-pencil-fill"></i>
            <span>Редактировать профиль</span>
        </a>
    </div>
</div>

<div class="profile-navigation-tabs">
    <ul class="profile-navigation-list">
        <li class="profile-navigation-item">
            <a href="/profile/main" class="profile-navigation-link active">
                <i class="bi bi-kanban-fill"></i>
                Проекты
            </a>
        </li>
        <li class="profile-navigation-item">
            <a href="/profile/activity" class="profile-navigation-link">
                <i class="bi bi-clock-history"></i>
                Активность
            </a>
        </li>
    </ul>
</div>

<div class="profile-content-section">
    <h2 class="profile-section-title">
        <div class="profile-section-title-content">
            <i class="bi bi-kanban-fill"></i>
            Мои проекты
        </div>
        <button onclick="openCreateProjectModal()" class="profile-create-project-button">
            <i class="bi bi-plus-circle-fill"></i>
            <span>Создать проект</span>
        </button>
    </h2>

    <#if profile.projectDto?? && profile.projectDto?has_content>
    <div class="profile-projects-grid">
        <#list profile.projectDto as project>
        <div class="profile-project-card" onclick="window.location.href='/project/${project.id}'">
            <div class="profile-project-header">
                <div>
                    <h3 class="profile-project-name">${project.name}</h3>
                </div>
                <span class="profile-project-role-badge ${project.userRole?lower_case}">
                                <i class="bi bi-${(project.userRole == 'LEADER')?then('star-fill', 'person-fill')}"></i>
                                ${(project.userRole == 'LEADER')?then('Лидер', 'Участник')}
                            </span>
            </div>

            <div class="profile-project-leader-info">
                <#if project.leader.avatar?? && project.leader.avatar?has_content>
                <img src="/photo/${project.leader.avatar}" alt="${project.leader.name}" class="profile-project-leader-avatar">
                <#else>
                <div class="profile-project-leader-placeholder">
                    <i class="bi bi-person-fill"></i>
                </div>
            </#if>
            <div class="profile-project-leader-details">
                <div class="profile-project-leader-label">Руководитель</div>
                <div class="profile-project-leader-name">${project.leader.name}</div>
            </div>
        </div>
    </div>
</#list>
</div>
<#else>
<div class="profile-empty-state">
    <i class="bi bi-folder-x"></i>
    <h3 class="profile-empty-state-title">Нет проектов</h3>
    <p class="profile-empty-state-text">Вы пока не участвуете ни в одном проекте</p>
</div>
</#if>
</div>
</div>

<#if success??>
<div class="profile-flash-message profile-flash-success">
    <i class="bi bi-check-circle-fill"></i>
    <span>${success}</span>
    <button onclick="closeFlashMessage(this)" class="profile-flash-close">
        <i class="bi bi-x"></i>
    </button>
</div>
</#if>

<#if error??>
<div class="profile-flash-message profile-flash-error">
    <i class="bi bi-exclamation-circle-fill"></i>
    <span>${error}</span>
    <button onclick="closeFlashMessage(this)" class="profile-flash-close">
        <i class="bi bi-x"></i>
    </button>
</div>
</#if>

<div id="createProjectModal" class="profile-modal-overlay" onclick="closeCreateProjectModal(event)">
    <div class="profile-modal-container" onclick="event.stopPropagation()">
        <div class="profile-modal-header">
            <h3 class="profile-modal-title">
                <i class="bi bi-plus-circle-fill"></i>
                Создать новый проект
            </h3>
            <button class="profile-modal-close" onclick="closeCreateProjectModal()">
                <i class="bi bi-x"></i>
            </button>
        </div>

        <form action="/project/create" method="post" onsubmit="return validateProjectForm()">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

            <div class="profile-modal-body">
                <div class="profile-modal-form-group">
                    <label for="projectName" class="profile-modal-label">Название проекта</label>
                    <input type="text" id="projectName" name="name" class="profile-modal-input" placeholder="Введите название проекта..." required autocomplete="off">
                </div>
            </div>

            <div class="profile-modal-footer">
                <button type="button" class="profile-modal-button profile-modal-button-secondary" onclick="closeCreateProjectModal()">
                    <span>Отмена</span>
                </button>
                <button type="submit" class="profile-modal-button profile-modal-button-primary">
                    <i class="bi bi-check-circle-fill"></i>
                    <span>Создать проект</span>
                </button>
            </div>
        </form>
    </div>
</div>

<script>
    function openCreateProjectModal() {
        const modal = document.getElementById('createProjectModal');
        modal.classList.add('active');
        document.body.style.overflow = 'hidden';
        setTimeout(() => {
            document.getElementById('projectName').focus();
        }, 100);
    }

    function closeCreateProjectModal(event) {
        if (event && event.target !== event.currentTarget) {
            return;
        }
        const modal = document.getElementById('createProjectModal');
        modal.classList.remove('active');
        document.body.style.overflow = '';
        document.getElementById('projectName').value = '';
    }

    function validateProjectForm() {
        const projectName = document.getElementById('projectName').value.trim();
        if (projectName.length === 0) {
            alert('Пожалуйста, введите название проекта');
            return false;
        }
        if (projectName.length < 3) {
            alert('Название проекта должно содержать минимум 3 символа');
            return false;
        }
        return true;
    }

    document.addEventListener('keydown', function(event) {
        if (event.key === 'Escape') {
            const modal = document.getElementById('createProjectModal');
            if (modal.classList.contains('active')) {
                closeCreateProjectModal();
            }
        }
    });

    function closeFlashMessage(button) {
        const flashMessage = button.closest('.profile-flash-message');
        flashMessage.style.opacity = '0';
        flashMessage.style.transform = 'translateX(100px)';
        setTimeout(() => {
            flashMessage.remove();
        }, 300);
    }

    document.addEventListener('DOMContentLoaded', function() {
        const flashMessages = document.querySelectorAll('.profile-flash-message');
        flashMessages.forEach(function(message) {
            setTimeout(function() {
                const closeButton = message.querySelector('.profile-flash-close');
                if (closeButton) {
                    closeButton.click();
                }
            }, 5000);
        });
    });
</script>
</@main.layout>