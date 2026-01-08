<#import "../layout.ftlh" as main>
<@main.layout ; spring>
<link rel="stylesheet" href="/css/project/detail.css">

<div class="project-detail-wrapper">
    <#if successMessage??>
    <div class="project-detail-alert project-detail-alert-success">
        <i class="bi bi-check-circle-fill"></i>
        <span>${successMessage}</span>
    </div>
</#if>

<#if errorMessage??>
<div class="project-detail-alert project-detail-alert-error">
    <i class="bi bi-exclamation-circle-fill"></i>
    <span>${errorMessage}</span>
</div>
</#if>

<div class="project-detail-header">
    <div class="project-detail-title-section">
        <a href="/profile/main" class="project-detail-back-link">
            <i class="bi bi-arrow-left"></i>
            <span>Назад к проектам</span>
        </a>
        <h1 class="project-detail-name">${project.name}</h1>
    </div>
    <div class="project-detail-actions">
        <button onclick="openAddMemberModal()" class="project-detail-button project-detail-button-secondary">
            <i class="bi bi-person-plus-fill"></i>
            <span>Добавить участника</span>
        </button>
        <button onclick="openCreateBoardModal()" class="project-detail-button project-detail-button-primary">
            <i class="bi bi-plus-circle-fill"></i>
            <span>Создать доску</span>
        </button>
    </div>
</div>

<div class="project-detail-content">
    <div class="project-detail-sidebar">
        <div class="project-detail-card">
            <h2 class="project-detail-card-title">
                <i class="bi bi-people-fill"></i>
                Участники
            </h2>
            <div class="project-detail-members-list">
                <#if project.members?? && project.members?has_content>
                <#list project.members as member>
                <div class="project-detail-member">
                    <#if member.avatarUrl?? && member.avatarUrl?has_content>
                    <img src="/photo/${member.avatarUrl}" alt="${member.name}" class="project-detail-member-avatar">
                    <#else>
                    <div class="project-detail-member-placeholder">
                        <i class="bi bi-person-fill"></i>
                    </div>
                </#if>
                <div class="project-detail-member-info">
                    <div class="project-detail-member-name">${member.name}</div>
                    <div class="project-detail-member-role">${member.role}</div>
                </div>
            </div>
        </#list>
        <#else>
        <div class="project-detail-empty-state" style="padding: 30px 20px; border: none;">
            <i class="bi bi-person-x" style="font-size: 40px; margin-bottom: 8px;"></i>
            <div class="project-detail-empty-title" style="font-size: 16px;">Нет участников</div>
        </div>
    </#if>
</div>
</div>
</div>

<div class="project-detail-main">
    <div class="project-detail-boards-section">
        <div class="project-detail-boards-header">
            <h2 class="project-detail-boards-title">
                <i class="bi bi-kanban-fill"></i>
                Доски проекта
            </h2>
            <#if project.boards?? && project.boards?has_content>
            <button onclick="openCreateBoardModal()" class="project-detail-button project-detail-button-primary">
                <i class="bi bi-plus-circle-fill"></i>
                <span>Создать доску</span>
            </button>
        </#if>
    </div>

    <#if project.boards?? && project.boards?has_content>
    <div class="project-detail-boards-grid">
        <#list project.boards as board>
        <a href="/boards/${board.id}" class="project-detail-board-card">
            <div class="project-detail-board-icon">
                <i class="bi bi-kanban"></i>
            </div>
            <h3 class="project-detail-board-name">${board.name}</h3>
        </a>
    </#list>
</div>
<#else>
<div class="project-detail-empty-state">
    <i class="bi bi-clipboard-x"></i>
    <h3 class="project-detail-empty-title">Нет досок</h3>
    <p class="project-detail-empty-text">Создайте первую доску для проекта</p>
    <button onclick="openCreateBoardModal()" class="project-detail-button project-detail-button-primary">
        <i class="bi bi-plus-circle-fill"></i>
        <span>Создать доску</span>
    </button>
</div>
</#if>
</div>
</div>
</div>
</div>

<div id="createBoardModal" class="project-detail-modal-overlay" onclick="closeCreateBoardModal(event)">
    <div class="project-detail-modal-container" onclick="event.stopPropagation()">
        <div class="project-detail-modal-header">
            <h3 class="project-detail-modal-title">
                <i class="bi bi-plus-circle-fill"></i>
                Создать доску
            </h3>
            <button class="project-detail-modal-close" onclick="closeCreateBoardModal()">
                <i class="bi bi-x"></i>
            </button>
        </div>

        <form action="/boards/create/${project.id}" method="post" onsubmit="return validateBoardForm(event)">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

            <div class="project-detail-modal-body">
                <div id="boardError" class="project-detail-error">
                    <i class="bi bi-exclamation-circle-fill"></i>
                    <span id="boardErrorMessage"></span>
                </div>

                <div class="project-detail-modal-form-group">
                    <label for="boardName" class="project-detail-modal-label">Название доски</label>
                    <input
                            type="text"
                            id="boardName"
                            name="name"
                            class="project-detail-modal-input"
                            placeholder="Введите название доски..."
                            autocomplete="off"
                            maxlength="100"
                    >
                </div>
            </div>

            <div class="project-detail-modal-footer">
                <button type="button" class="project-detail-modal-button project-detail-modal-button-secondary" onclick="closeCreateBoardModal()">
                    Отмена
                </button>
                <button type="submit" class="project-detail-modal-button project-detail-modal-button-primary">
                    <i class="bi bi-check-circle-fill"></i>
                    Создать доску
                </button>
            </div>
        </form>
    </div>
</div>

<div id="addMemberModal" class="project-detail-modal-overlay" onclick="closeAddMemberModal(event)">
    <div class="project-detail-modal-container" onclick="event.stopPropagation()">
        <div class="project-detail-modal-header">
            <h3 class="project-detail-modal-title">
                <i class="bi bi-person-plus-fill"></i>
                Добавить участника
            </h3>
            <button class="project-detail-modal-close" onclick="closeAddMemberModal()">
                <i class="bi bi-x"></i>
            </button>
        </div>

        <form action="/project/member/add" method="post" onsubmit="return validateMemberForm(event)">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <input type="hidden" name="projectId" value="${project.id}"/>

            <div class="project-detail-modal-body">
                <div id="memberError" class="project-detail-error">
                    <i class="bi bi-exclamation-circle-fill"></i>
                    <span id="memberErrorMessage"></span>
                </div>

                <div class="project-detail-modal-form-group">
                    <label for="memberEmail" class="project-detail-modal-label">Email участника</label>
                    <input
                            type="email"
                            id="memberEmail"
                            name="email"
                            class="project-detail-modal-input"
                            placeholder="example@email.com"
                            autocomplete="off"
                    >
                </div>

                <div class="project-detail-modal-form-group">
                    <label for="memberRole" class="project-detail-modal-label">Роль</label>
                    <select
                            id="memberRole"
                            name="role"
                            class="project-detail-modal-input"
                            style="cursor: pointer;"
                    >
                        <option value="" disabled selected>Выберите роль...</option>
                        <option value="MEMBER">Участник (MEMBER)</option>
                        <option value="VIEWER">Наблюдатель (VIEWER)</option>
                    </select>
                </div>

                <div class="project-detail-modal-form-group" style="margin-bottom: 0;">
                    <div style="padding: 12px; background: #f5f5f5; border-radius: 6px; font-size: 13px; color: #666;">
                        <div style="margin-bottom: 6px;"><strong>MEMBER:</strong> Может просматривать, редактировать и создавать задачи</div>
                        <div><strong>VIEWER:</strong> Может только просматривать проект</div>
                    </div>
                </div>
            </div>

            <div class="project-detail-modal-footer">
                <button type="button" class="project-detail-modal-button project-detail-modal-button-secondary" onclick="closeAddMemberModal()">
                    Отмена
                </button>
                <button type="submit" class="project-detail-modal-button project-detail-modal-button-primary">
                    <i class="bi bi-check-circle-fill"></i>
                    Добавить
                </button>
            </div>
        </form>
    </div>
</div>
<script src="/js/project/detail.js"></script>
</@main.layout>