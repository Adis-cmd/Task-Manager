<#import "../layout.ftlh" as main>
<@main.layout ; spring>
<link rel="stylesheet" href="/css/board/detail.css">

<div class="board-detail-wrapper">
    <div class="board-detail-header">
        <div class="board-detail-title-section">
            <a href="javascript:history.back()" class="board-detail-back-link">
                <i class="bi bi-arrow-left"></i>
                <span>Назад к проекту</span>
            </a>
            <h1 class="board-detail-name">${board.name}</h1>
        </div>
        <div class="board-detail-actions">
            <button onclick="openAddColumnModal()" class="board-detail-button board-detail-button-secondary">
                <i class="bi bi-plus-square-fill"></i>
                <span>Добавить колонку</span>
            </button>
            <button onclick="openCreateTaskModal()" class="board-detail-button board-detail-button-primary">
                <i class="bi bi-plus-circle-fill"></i>
                <span>Создать задачу</span>
            </button>
        </div>
    </div>

    <div class="board-detail-columns-container">
        <#if board.columnDto?? && board.columnDto?has_content>
        <#list board.columnDto as column>
        <div class="board-detail-column">
            <div class="board-detail-column-header">
                <h2 class="board-detail-column-title">${column.name}</h2>
                <span class="board-detail-column-count">${column.taskDtos?size}</span>
            </div>

            <div class="board-detail-tasks-list">
                <#if column.taskDtos?? && column.taskDtos?has_content>
                <#list column.taskDtos as task>
                <div class="board-detail-task-card" onclick="openTaskDetailModal(${task.id})">
                    <h3 class="board-detail-task-name">${task.name}</h3>

                    <div class="board-detail-task-meta">
                        <#if task.priority??>
                        <span class="board-detail-task-badge board-detail-task-priority-${task.priority?lower_case}">
                                                ${task.priority}
                                            </span>
                    </#if>
                    <#if task.status??>
                    <span class="board-detail-task-badge board-detail-task-status">
                                                ${task.status}
                                            </span>
                </#if>
            </div>

            <div class="board-detail-task-footer">
                <div class="board-detail-task-author">
                    <#if task.author??>
                    <#if task.author.avatar?? && task.author.avatar?has_content>
                    <img src="${task.author.avatar}" alt="${task.author.name}" class="board-detail-task-avatar">
                    <#else>
                    <div class="board-detail-task-avatar-placeholder">
                        <i class="bi bi-person-fill"></i>
                    </div>
                </#if>
                <span class="board-detail-task-author-name">${task.author.name}</span>
            </#if>
        </div>

        <div class="board-detail-task-participants">
            <#if task.participants?? && task.participants?has_content>
            <div class="board-detail-task-participants-list">
                <#list task.participants as participant>
                <#if participant?? && participant_index < 3>
                <#if participant.avatar?? && participant.avatar?has_content>
                <img src="${participant.avatar}" alt="${participant.name}" class="board-detail-task-participant-avatar" title="${participant.name}">
                <#else>
                <div class="board-detail-task-participant-placeholder" title="${participant.name}">
                    <i class="bi bi-person-fill"></i>
                </div>
            </#if>
        </#if>
    </#list>
</div>
</#if>

<#if task.comments?? && task.comments?has_content>
<div class="board-detail-task-comments-count">
    <i class="bi bi-chat-fill"></i>
    <span>${task.comments?size}</span>
</div>
</#if>
</div>
</div>
</div>
</#list>
<#else>
<div class="board-detail-empty-column">
    <i class="bi bi-inbox"></i>
    <div class="board-detail-empty-column-text">Нет задач</div>
</div>
</#if>
</div>

<button onclick="openCreateTaskModal(${column.id})" class="board-detail-add-task-button">
    <i class="bi bi-plus"></i>
    <span>Добавить задачу</span>
</button>
</div>
</#list>
<#else>
<div class="board-detail-empty-column" style="min-width: 100%; padding: 80px 40px;">
    <i class="bi bi-columns-gap" style="font-size: 64px;"></i>
    <div class="board-detail-empty-column-text" style="font-size: 18px;">Нет колонок</div>
    <button onclick="openAddColumnModal()" class="board-detail-button board-detail-button-primary" style="margin-top: 20px;">
        <i class="bi bi-plus-square-fill"></i>
        <span>Добавить колонку</span>
    </button>
</div>
</#if>
</div>
</div>

<div id="createTaskModal" class="board-detail-modal-overlay" onclick="closeCreateTaskModal(event)">
    <div class="board-detail-modal-container" onclick="event.stopPropagation()">
        <div class="board-detail-modal-header">
            <h3 class="board-detail-modal-title">
                <i class="bi bi-plus-circle-fill"></i>
                Создать задачу
            </h3>
            <button class="board-detail-modal-close" onclick="closeCreateTaskModal()">
                <i class="bi bi-x"></i>
            </button>
        </div>

        <form action="/tasks/create" method="post" onsubmit="return validateTaskForm()">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <input type="hidden" name="boardId" value="${board.id}"/>
            <input type="hidden" id="taskColumnId" name="columnId"/>

            <div class="board-detail-modal-body">
                <div class="board-detail-modal-form-group">
                    <label for="taskName" class="board-detail-modal-label">Название задачи</label>
                    <input
                            type="text"
                            id="taskName"
                            name="name"
                            class="board-detail-modal-input"
                            placeholder="Введите название задачи..."
                            required
                            autocomplete="off"
                    >
                </div>

                <div class="board-detail-modal-form-group">
                    <label for="taskDescription" class="board-detail-modal-label">Описание</label>
                    <textarea
                            id="taskDescription"
                            name="description"
                            class="board-detail-modal-textarea"
                            placeholder="Введите описание задачи..."
                    ></textarea>
                </div>

                <div class="board-detail-modal-form-group">
                    <label for="taskPriority" class="board-detail-modal-label">Приоритет</label>
                    <select id="taskPriority" name="priority" class="board-detail-modal-select">
                        <option value="LOW">Низкий</option>
                        <option value="MEDIUM" selected>Средний</option>
                        <option value="HIGH">Высокий</option>
                    </select>
                </div>

                <div class="board-detail-modal-form-group">
                    <label for="taskColumn" class="board-detail-modal-label">Колонка</label>
                    <select id="taskColumn" name="columnId" class="board-detail-modal-select" required>
                        <#if board.columnDto?? && board.columnDto?has_content>
                        <#list board.columnDto as column>
                        <option value="${column.id}">${column.name}</option>
                    </#list>
                </#if>
                </select>
            </div>
    </div>

    <div class="board-detail-modal-footer">
        <button type="button" class="board-detail-modal-button board-detail-modal-button-secondary" onclick="closeCreateTaskModal()">
            Отмена
        </button>
        <button type="submit" class="board-detail-modal-button board-detail-modal-button-primary">
            <i class="bi bi-check-circle-fill"></i>
            Создать задачу
        </button>
    </div>
    </form>
</div>
</div>

<div id="addColumnModal" class="board-detail-modal-overlay" onclick="closeAddColumnModal(event)">
    <div class="board-detail-modal-container" onclick="event.stopPropagation()">
        <div class="board-detail-modal-header">
            <h3 class="board-detail-modal-title">
                <i class="bi bi-plus-square-fill"></i>
                Добавить колонку
            </h3>
            <button class="board-detail-modal-close" onclick="closeAddColumnModal()">
                <i class="bi bi-x"></i>
            </button>
        </div>

        <form action="/columns/create" method="post" onsubmit="return validateColumnForm()">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <input type="hidden" name="boardId" value="${board.id}"/>

            <div class="board-detail-modal-body">
                <div class="board-detail-modal-form-group">
                    <label for="columnName" class="board-detail-modal-label">Название колонки</label>
                    <input
                            type="text"
                            id="columnName"
                            name="name"
                            class="board-detail-modal-input"
                            placeholder="Введите название колонки..."
                            required
                            autocomplete="off"
                    >
                </div>
            </div>

            <div class="board-detail-modal-footer">
                <button type="button" class="board-detail-modal-button board-detail-modal-button-secondary" onclick="closeAddColumnModal()">
                    Отмена
                </button>
                <button type="submit" class="board-detail-modal-button board-detail-modal-button-primary">
                    <i class="bi bi-check-circle-fill"></i>
                    Добавить
                </button>
            </div>
        </form>
    </div>
</div>

<script src="/js/board/detail.js"></script>
</@main.layout>