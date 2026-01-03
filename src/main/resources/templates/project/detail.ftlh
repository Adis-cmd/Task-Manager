<#import "../layout.ftlh" as main>
<@main.layout ; spring>
<style>
    .project-detail-wrapper {
        max-width: 1400px;
        margin: 0 auto;
        padding: 30px 20px;
    }

    .project-detail-header {
        background: #ffffff;
        border: 1px solid #e0e0e0;
        border-radius: 8px;
        padding: 32px 40px;
        margin-bottom: 30px;
        display: flex;
        justify-content: space-between;
        align-items: center;
        gap: 30px;
    }

    .project-detail-title-section {
        flex: 1;
    }

    .project-detail-back-link {
        display: inline-flex;
        align-items: center;
        gap: 6px;
        color: #666;
        text-decoration: none;
        font-size: 14px;
        font-weight: 600;
        margin-bottom: 12px;
        transition: all 0.2s;
    }

    .project-detail-back-link:hover {
        color: #000;
    }

    .project-detail-back-link i {
        font-size: 16px;
    }

    .project-detail-name {
        font-size: 32px;
        font-weight: 700;
        color: #000000;
        margin: 0;
    }

    .project-detail-actions {
        display: flex;
        gap: 12px;
    }

    .project-detail-button {
        padding: 10px 20px;
        border-radius: 20px;
        font-size: 14px;
        font-weight: 700;
        cursor: pointer;
        transition: all 0.2s;
        display: inline-flex;
        align-items: center;
        gap: 8px;
        text-decoration: none;
        white-space: nowrap;
    }

    .project-detail-button-primary {
        background: #000000;
        color: #ffffff;
        border: none;
    }

    .project-detail-button-primary:hover {
        background: #333;
    }

    .project-detail-button-secondary {
        background: #ffffff;
        color: #000000;
        border: 1px solid #ddd;
    }

    .project-detail-button-secondary:hover {
        background: #f5f5f5;
        border-color: #999;
    }

    .project-detail-button i {
        font-size: 16px;
    }

    .project-detail-content {
        display: grid;
        grid-template-columns: 320px 1fr;
        gap: 30px;
    }

    .project-detail-sidebar {
        display: flex;
        flex-direction: column;
        gap: 24px;
    }

    .project-detail-card {
        background: #ffffff;
        border: 1px solid #e0e0e0;
        border-radius: 8px;
        padding: 24px;
    }

    .project-detail-card-title {
        font-size: 18px;
        font-weight: 700;
        color: #000000;
        margin: 0 0 20px 0;
        display: flex;
        align-items: center;
        gap: 10px;
    }

    .project-detail-card-title i {
        font-size: 20px;
    }

    .project-detail-members-list {
        display: flex;
        flex-direction: column;
        gap: 12px;
    }

    .project-detail-member {
        display: flex;
        align-items: center;
        gap: 12px;
        padding: 10px;
        border-radius: 6px;
        background: #fafafa;
        transition: all 0.2s;
    }

    .project-detail-member:hover {
        background: #f0f0f0;
    }

    .project-detail-member-avatar {
        width: 40px;
        height: 40px;
        border-radius: 50%;
        object-fit: cover;
        border: 2px solid #e0e0e0;
        flex-shrink: 0;
    }

    .project-detail-member-placeholder {
        width: 40px;
        height: 40px;
        border-radius: 50%;
        background: #f5f5f5;
        display: flex;
        align-items: center;
        justify-content: center;
        border: 2px solid #e0e0e0;
        flex-shrink: 0;
    }

    .project-detail-member-placeholder i {
        font-size: 20px;
        color: #999;
    }

    .project-detail-member-info {
        flex: 1;
        min-width: 0;
    }

    .project-detail-member-name {
        font-size: 14px;
        font-weight: 600;
        color: #000000;
        margin-bottom: 2px;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
    }

    .project-detail-member-role {
        font-size: 11px;
        font-weight: 600;
        color: #999;
        text-transform: uppercase;
        letter-spacing: 0.5px;
    }

    .project-detail-main {
        display: flex;
        flex-direction: column;
        gap: 24px;
    }

    .project-detail-boards-section {
        background: #ffffff;
        border: 1px solid #e0e0e0;
        border-radius: 8px;
        padding: 32px;
    }

    .project-detail-boards-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 24px;
    }

    .project-detail-boards-title {
        font-size: 24px;
        font-weight: 700;
        color: #000000;
        margin: 0;
        display: flex;
        align-items: center;
        gap: 12px;
    }

    .project-detail-boards-title i {
        font-size: 26px;
    }

    .project-detail-boards-grid {
        display: grid;
        grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
        gap: 20px;
    }

    .project-detail-board-card {
        background: #ffffff;
        border: 1px solid #e0e0e0;
        border-radius: 8px;
        padding: 24px;
        cursor: pointer;
        transition: all 0.2s;
        text-decoration: none;
        display: block;
    }

    .project-detail-board-card:hover {
        box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        border-color: #999;
    }

    .project-detail-board-icon {
        width: 48px;
        height: 48px;
        background: #000000;
        border-radius: 8px;
        display: flex;
        align-items: center;
        justify-content: center;
        margin-bottom: 16px;
    }

    .project-detail-board-icon i {
        font-size: 24px;
        color: #ffffff;
    }

    .project-detail-board-name {
        font-size: 16px;
        font-weight: 700;
        color: #000000;
        margin: 0;
        line-height: 1.3;
    }

    .project-detail-empty-state {
        text-align: center;
        padding: 60px 40px;
        border: 1px dashed #ddd;
        border-radius: 8px;
        background: #fafafa;
    }

    .project-detail-empty-state i {
        font-size: 64px;
        color: #ddd;
        margin-bottom: 16px;
        display: block;
    }

    .project-detail-empty-title {
        font-size: 20px;
        font-weight: 700;
        color: #000000;
        margin-bottom: 8px;
    }

    .project-detail-empty-text {
        font-size: 14px;
        color: #666;
        margin-bottom: 24px;
    }

    /* Modal Styles */
    .project-detail-modal-overlay {
        display: none;
        position: fixed;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        background: rgba(0, 0, 0, 0.5);
        z-index: 1000;
    }

    .project-detail-modal-overlay.active {
        display: flex;
        align-items: center;
        justify-content: center;
        padding: 20px;
    }

    .project-detail-modal-container {
        background: #ffffff;
        border-radius: 12px;
        width: 100%;
        max-width: 480px;
        box-shadow: 0 8px 24px rgba(0,0,0,0.2);
    }

    .project-detail-modal-header {
        padding: 24px 28px;
        border-bottom: 1px solid #e0e0e0;
        position: relative;
    }

    .project-detail-modal-title {
        font-size: 20px;
        font-weight: 700;
        color: #000000;
        margin: 0;
        display: flex;
        align-items: center;
        gap: 10px;
    }

    .project-detail-modal-title i {
        font-size: 22px;
    }

    .project-detail-modal-close {
        position: absolute;
        top: 24px;
        right: 24px;
        background: transparent;
        border: none;
        font-size: 24px;
        cursor: pointer;
        color: #999;
        width: 32px;
        height: 32px;
        display: flex;
        align-items: center;
        justify-content: center;
        border-radius: 6px;
        transition: all 0.2s;
    }

    .project-detail-modal-close:hover {
        background: #f5f5f5;
        color: #000;
    }

    .project-detail-modal-body {
        padding: 24px 28px;
    }

    .project-detail-modal-form-group {
        margin-bottom: 20px;
    }

    .project-detail-modal-label {
        display: block;
        font-size: 14px;
        font-weight: 600;
        color: #000000;
        margin-bottom: 8px;
    }

    .project-detail-modal-input {
        width: 100%;
        padding: 12px 16px;
        border: 1px solid #ddd;
        border-radius: 6px;
        font-size: 15px;
        color: #000000;
        transition: all 0.2s;
        box-sizing: border-box;
    }

    .project-detail-modal-input:focus {
        outline: none;
        border-color: #000;
        box-shadow: 0 0 0 3px rgba(0, 0, 0, 0.05);
    }

    .project-detail-modal-input::placeholder {
        color: #999;
    }

    .project-detail-modal-footer {
        padding: 20px 28px;
        display: flex;
        gap: 10px;
        justify-content: flex-end;
        border-top: 1px solid #e0e0e0;
    }

    .project-detail-modal-button {
        padding: 10px 24px;
        border-radius: 6px;
        font-size: 14px;
        font-weight: 600;
        cursor: pointer;
        transition: all 0.2s;
        display: inline-flex;
        align-items: center;
        gap: 8px;
    }

    .project-detail-modal-button-primary {
        background: #000000;
        color: #ffffff;
        border: none;
    }

    .project-detail-modal-button-primary:hover {
        background: #333;
    }

    .project-detail-modal-button-secondary {
        background: #ffffff;
        color: #000000;
        border: 1px solid #ddd;
    }

    .project-detail-modal-button-secondary:hover {
        background: #f5f5f5;
    }

    /* Validation Styles */
    .project-detail-error {
        padding: 12px 16px;
        background: #fee;
        border: 1px solid #fcc;
        border-radius: 6px;
        color: #c33;
        font-size: 14px;
        margin-bottom: 16px;
        display: none;
        align-items: center;
        gap: 10px;
    }

    .project-detail-error.show {
        display: flex;
    }

    .project-detail-error i {
        font-size: 18px;
        flex-shrink: 0;
    }

    .project-detail-modal-input.error {
        border-color: #f44;
        background: #fff5f5;
    }

    .project-detail-modal-input.error:focus {
        border-color: #f44;
        box-shadow: 0 0 0 3px rgba(255, 68, 68, 0.1);
    }

    @media (max-width: 1024px) {
        .project-detail-content {
            grid-template-columns: 1fr;
        }

        .project-detail-sidebar {
            order: 2;
        }

        .project-detail-main {
            order: 1;
        }
    }

    @media (max-width: 768px) {
        .project-detail-header {
            flex-direction: column;
            align-items: flex-start;
            padding: 24px;
        }

        .project-detail-name {
            font-size: 26px;
        }

        .project-detail-actions {
            width: 100%;
            flex-direction: column;
        }

        .project-detail-button {
            width: 100%;
            justify-content: center;
        }

        .project-detail-boards-grid {
            grid-template-columns: 1fr;
        }

        .project-detail-boards-section {
            padding: 24px 20px;
        }

        .project-detail-boards-header {
            flex-direction: column;
            align-items: flex-start;
            gap: 16px;
        }

        .project-detail-modal-footer {
            flex-direction: column;
        }

        .project-detail-modal-button {
            width: 100%;
            justify-content: center;
        }
    }
</style>

<div class="project-detail-wrapper">
    <!-- Header -->
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

<!-- Main Content -->
<div class="project-detail-main">
    <!-- Boards Section -->
    <div class="project-detail-boards-section">
        <div class="project-detail-boards-header">
            <h2 class="project-detail-boards-title">
                <i class="bi bi-kanban-fill"></i>
                Мои проекты
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

<!-- Modal для создания доски -->
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

        <form action="/boards/create" method="post" onsubmit="return validateBoardForm(event)">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <input type="hidden" name="projectId" value="${project.id}"/>

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
                            placeholder="Введите название..."
                            autocomplete="off"
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

<!-- Modal для добавления участника -->
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

<script>
    function openCreateBoardModal() {
        const modal = document.getElementById('createBoardModal');
        modal.classList.add('active');
        document.body.style.overflow = 'hidden';
        clearBoardError();
        setTimeout(() => {
            document.getElementById('boardName').focus();
        }, 100);
    }

    function closeCreateBoardModal(event) {
        if (event && event.target !== event.currentTarget) {
            return;
        }
        const modal = document.getElementById('createBoardModal');
        modal.classList.remove('active');
        document.body.style.overflow = '';
        document.getElementById('boardName').value = '';
        clearBoardError();
    }

    function showBoardError(message) {
        const errorDiv = document.getElementById('boardError');
        const errorMessage = document.getElementById('boardErrorMessage');
        const input = document.getElementById('boardName');

        errorMessage.textContent = message;
        errorDiv.classList.add('show');
        input.classList.add('error');

        setTimeout(() => {
            errorDiv.classList.remove('show');
            input.classList.remove('error');
        }, 4000);
    }

    function clearBoardError() {
        const errorDiv = document.getElementById('boardError');
        const input = document.getElementById('boardName');
        errorDiv.classList.remove('show');
        input.classList.remove('error');
    }

    function validateBoardForm(event) {
        event.preventDefault();
        clearBoardError();

        const boardName = document.getElementById('boardName').value.trim();

        if (boardName.length === 0) {
            showBoardError('Пожалуйста, введите название доски');
            return false;
        }

        if (boardName.length < 3) {
            showBoardError('Название доски должно содержать минимум 3 символа');
            return false;
        }

        event.target.submit();
        return true;
    }

    function openAddMemberModal() {
        const modal = document.getElementById('addMemberModal');
        modal.classList.add('active');
        document.body.style.overflow = 'hidden';
        clearMemberError();
        setTimeout(() => {
            document.getElementById('memberEmail').focus();
        }, 100);
    }

    function closeAddMemberModal(event) {
        if (event && event.target !== event.currentTarget) {
            return;
        }
        const modal = document.getElementById('addMemberModal');
        modal.classList.remove('active');
        document.body.style.overflow = '';
        document.getElementById('memberEmail').value = '';
        document.getElementById('memberRole').value = '';
        clearMemberError();
    }

    function showMemberError(message) {
        const errorDiv = document.getElementById('memberError');
        const errorMessage = document.getElementById('memberErrorMessage');
        const emailInput = document.getElementById('memberEmail');
        const roleInput = document.getElementById('memberRole');

        errorMessage.textContent = message;
        errorDiv.classList.add('show');

        if (message.includes('email')) {
            emailInput.classList.add('error');
        }
        if (message.includes('роль')) {
            roleInput.classList.add('error');
        }

        setTimeout(() => {
            errorDiv.classList.remove('show');
            emailInput.classList.remove('error');
            roleInput.classList.remove('error');
        }, 4000);
    }

    function clearMemberError() {
        const errorDiv = document.getElementById('memberError');
        const emailInput = document.getElementById('memberEmail');
        const roleInput = document.getElementById('memberRole');
        errorDiv.classList.remove('show');
        emailInput.classList.remove('error');
        roleInput.classList.remove('error');
    }

    function validateMemberForm(event) {
        event.preventDefault();
        clearMemberError();

        const memberEmail = document.getElementById('memberEmail').value.trim();
        const memberRole = document.getElementById('memberRole').value;

        if (memberEmail.length === 0) {
            showMemberError('Пожалуйста, введите email участника');
            return false;
        }

        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (!emailRegex.test(memberEmail)) {
            showMemberError('Пожалуйста, введите корректный email адрес');
            return false;
        }

        if (!memberRole) {
            showMemberError('Пожалуйста, выберите роль для участника');
            return false;
        }

        event.target.submit();
        return true;
    }

    document.addEventListener('DOMContentLoaded', function() {
        const boardNameInput = document.getElementById('boardName');
        const memberEmailInput = document.getElementById('memberEmail');
        const memberRoleInput = document.getElementById('memberRole');

        if (boardNameInput) {
            boardNameInput.addEventListener('input', clearBoardError);
        }

        if (memberEmailInput) {
            memberEmailInput.addEventListener('input', clearMemberError);
        }

        if (memberRoleInput) {
            memberRoleInput.addEventListener('change', clearMemberError);
        }
    });

    document.addEventListener('keydown', function(event) {
        if (event.key === 'Escape') {
            const createBoardModal = document.getElementById('createBoardModal');
            const addMemberModal = document.getElementById('addMemberModal');

            if (createBoardModal.classList.contains('active')) {
                closeCreateBoardModal();
            }
            if (addMemberModal.classList.contains('active')) {
                closeAddMemberModal();
            }
        }
    });
</script>
</@main.layout>