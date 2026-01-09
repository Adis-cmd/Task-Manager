<#import "../layout.ftlh" as main>
<@main.layout ; spring>
<link rel="stylesheet" href="/css/board/detail.css">

<div class="board-detail-wrapper">
    <#if success??>
    <div class="board-flash-message board-flash-success">
        <i class="bi bi-check-circle-fill"></i>
        <span>${success}</span>
        <button onclick="closeBoardFlashMessage(this)" class="board-flash-close">
            <i class="bi bi-x"></i>
        </button>
    </div>
</#if>

<#if error??>
<div class="board-flash-message board-flash-error">
    <i class="bi bi-exclamation-circle-fill"></i>
    <span>${error}</span>
    <button onclick="closeBoardFlashMessage(this)" class="board-flash-close">
        <i class="bi bi-x"></i>
    </button>
</div>
</#if>

<div class="board-detail-header">
    <div class="board-detail-title-section">
        <a href="javascript:history.back()" class="board-detail-back-link">
            <i class="bi bi-arrow-left"></i>
            <span>Назад к проекту</span>
        </a>
        <h1 class="board-detail-name">${board.name}</h1>
    </div>
    <div class="board-detail-actions">
        <button onclick="openAddColumnModal()" class="unified-button unified-button-secondary">
            <i class="bi bi-plus-square-fill"></i>
            <span>Добавить колонку</span>
        </button>
        <button onclick="openCreateTaskModal()" class="unified-button unified-button-primary">
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
            <div class="board-detail-column-actions">
                <span class="board-detail-column-count">${column.taskDtos?size}</span>
                <button onclick="openEditColumnModal(${column.id}, '${column.name?js_string}')" class="board-detail-column-edit-btn" title="Редактировать колонку">
                    <i class="bi bi-pencil-fill"></i>
                </button>
            </div>
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
                <img src="/photo/${task.author.avatar}" alt="${task.author.name}" class="board-detail-task-avatar">
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
    <button onclick="openAddColumnModal()" class="unified-button unified-button-primary" style="margin-top: 20px;">
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
        <button type="button" class="unified-button unified-button-secondary" onclick="closeCreateTaskModal()">
            Отмена
        </button>
        <button type="submit" class="unified-button unified-button-primary">
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
                <button type="button" class="unified-button unified-button-secondary" onclick="closeAddColumnModal()">
                    Отмена
                </button>
                <button type="submit" class="unified-button unified-button-primary">
                    <i class="bi bi-check-circle-fill"></i>
                    Добавить
                </button>
            </div>
        </form>
    </div>
</div>

<div id="editColumnModal" class="board-detail-modal-overlay" onclick="closeEditColumnModal(event)">
    <div class="board-detail-modal-container" onclick="event.stopPropagation()">
        <div class="board-detail-modal-header">
            <h3 class="board-detail-modal-title">
                <i class="bi bi-pencil-fill"></i>
                Редактировать колонку
            </h3>
            <button class="board-detail-modal-close" onclick="closeEditColumnModal()">
                <i class="bi bi-x"></i>
            </button>
        </div>

        <form action="/columns/edit" method="post" onsubmit="return validateEditColumnForm()">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <input type="hidden" name="boardId" value="${board.id}"/>
            <input type="hidden" id="editColumnId" name="id" value=""/>

            <div class="board-detail-modal-body">
                <div class="board-detail-modal-form-group">
                    <label for="editColumnName" class="board-detail-modal-label">Название колонки</label>
                    <input
                            type="text"
                            id="editColumnName"
                            name="name"
                            class="board-detail-modal-input"
                            placeholder="Введите название колонки..."
                            required
                            autocomplete="off"
                    >
                </div>
            </div>

            <div class="board-detail-modal-footer">
                <button type="button" class="unified-button unified-button-secondary" onclick="closeEditColumnModal()">
                    Отмена
                </button>
                <button type="submit" class="unified-button unified-button-primary">
                    <i class="bi bi-check-circle-fill"></i>
                    Сохранить
                </button>
            </div>
        </form>
    </div>
</div>

<div id="taskDetailModal" class="board-detail-modal-overlay" onclick="closeTaskDetailModal(event)">
    <div class="board-detail-modal-container board-detail-modal-large" onclick="event.stopPropagation()">
        <div class="board-detail-modal-header">
            <h3 class="board-detail-modal-title">
                <i class="bi bi-card-checklist"></i>
                <span id="taskDetailTitle">Детали задачи</span>
            </h3>
            <button class="board-detail-modal-close" onclick="closeTaskDetailModal()">
                <i class="bi bi-x"></i>
            </button>
        </div>

        <div id="taskViewMode" class="board-detail-modal-body">
            <div class="task-detail-view-section">
                <h2 id="taskViewName" class="task-detail-view-title"></h2>
            </div>

            <div class="task-detail-view-section">
                <h4 class="task-detail-view-label">
                    <i class="bi bi-text-paragraph"></i>
                    Описание
                </h4>
                <div id="taskViewDescWrapper" class="task-detail-description-wrapper">
                    <p id="taskViewDescription" class="task-detail-view-text"></p>
                </div>
                <div id="toggleDescBtnContainer" style="display: none;">
                    <button type="button" id="toggleDescBtn" class="unified-button unified-button-secondary" onclick="toggleDescription()">
                        <i class="bi bi-chevron-down"></i> Развернуть
                    </button>
                </div>
            </div>

            <div class="task-detail-view-row">
                <div class="task-detail-view-section">
                    <h4 class="task-detail-view-label">
                        <i class="bi bi-flag-fill"></i>
                        Приоритет
                    </h4>
                    <span id="taskViewPriority" class="task-detail-view-badge"></span>
                </div>

                <div class="task-detail-view-section">
                    <h4 class="task-detail-view-label">
                        <i class="bi bi-hourglass-split"></i>
                        Статус
                    </h4>
                    <span id="taskViewStatus" class="task-detail-view-badge"></span>
                </div>

                <div class="task-detail-view-section">
                    <h4 class="task-detail-view-label">
                        <i class="bi bi-columns-gap"></i>
                        Колонка
                    </h4>
                    <span id="taskViewColumn" class="task-detail-view-text"></span>
                </div>
            </div>

            <div class="task-detail-info-section">
                <div class="task-detail-info-item">
                    <span class="task-detail-info-label">
                        <i class="bi bi-person-fill"></i>
                        Автор:
                    </span>
                    <div id="taskViewAuthor" class="task-detail-info-value"></div>
                </div>
                <div class="task-detail-info-item">
                    <span class="task-detail-info-label">
                        <i class="bi bi-calendar-fill"></i>
                        Создано:
                    </span>
                    <span id="taskViewCreated" class="task-detail-info-value"></span>
                </div>
            </div>

            <div id="taskViewParticipantsSection" class="task-detail-view-section" style="display: none;">
                <h4 class="task-detail-view-label">
                    <i class="bi bi-people-fill"></i>
                    Участники
                </h4>
                <div id="taskViewParticipants" class="task-detail-participants-list"></div>
            </div>

            <div id="taskViewCommentsSection" class="task-detail-view-section" style="display: none;">
                <h4 class="task-detail-view-label">
                    <i class="bi bi-chat-left-text-fill"></i>
                    Комментарии
                    <span id="taskViewCommentsCount" class="task-detail-comments-badge">0</span>
                </h4>
                <div id="taskViewComments" class="task-detail-comments-list"></div>
            </div>
        </div>

        <form id="taskDetailForm" method="post" onsubmit="return validateTaskEditForm()" style="display: none;">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <input type="hidden" id="taskDetailId" name="taskId" value=""/>
            <input type="hidden" id="taskDetailBoardId" name="boardId" value="${board.id}"/>

            <div class="board-detail-modal-body">
                <div class="board-detail-modal-form-group">
                    <label for="taskDetailName" class="board-detail-modal-label">
                        <i class="bi bi-pencil-fill"></i>
                        Название задачи
                    </label>
                    <input
                            type="text"
                            id="taskDetailName"
                            name="name"
                            class="board-detail-modal-input"
                            placeholder="Название задачи..."
                            required
                            autocomplete="off"
                    >
                </div>

                <div class="board-detail-modal-form-group">
                    <label for="taskDetailDescription" class="board-detail-modal-label">
                        <i class="bi bi-text-paragraph"></i>
                        Описание
                    </label>
                    <textarea
                            id="taskDetailDescription"
                            name="description"
                            class="board-detail-modal-textarea"
                            rows="6"
                            placeholder="Описание задачи..."
                    ></textarea>
                </div>

                <div class="board-detail-modal-form-row">
                    <div class="board-detail-modal-form-group">
                        <label for="taskDetailPriority" class="board-detail-modal-label">
                            <i class="bi bi-flag-fill"></i>
                            Приоритет
                        </label>
                        <select id="taskDetailPriority" name="priority" class="board-detail-modal-select">
                            <option value="LOW">Низкий</option>
                            <option value="MEDIUM">Средний</option>
                            <option value="HIGH">Высокий</option>
                            <option value="URGENT">Срочный</option>
                        </select>
                    </div>

                    <div class="board-detail-modal-form-group">
                        <label for="taskDetailStatus" class="board-detail-modal-label">
                            <i class="bi bi-hourglass-split"></i>
                            Статус
                        </label>
                        <select id="taskDetailStatus" name="status" class="board-detail-modal-select">
                            <option value="PENDING">Ожидает</option>
                            <option value="IN_PROGRESS">В процессе</option>
                            <option value="COMPLETED">Завершено</option>
                        </select>
                    </div>
                </div>

                <div class="board-detail-modal-form-group">
                    <label for="taskDetailColumn" class="board-detail-modal-label">
                        <i class="bi bi-columns-gap"></i>
                        Колонка
                    </label>
                    <select id="taskDetailColumn" name="columnId" class="board-detail-modal-select" required>
                        <#if board.columnDto?? && board.columnDto?has_content>
                        <#list board.columnDto as column>
                        <option value="${column.id}">${column.name}</option>
                    </#list>
                </#if>
                </select>
            </div>

            <div class="task-detail-info-section">
                <div class="task-detail-info-item">
                        <span class="task-detail-info-label">
                            <i class="bi bi-person-fill"></i>
                            Автор:
                        </span>
                    <div id="taskEditAuthor" class="task-detail-info-value"></div>
                </div>
                <div class="task-detail-info-item">
                        <span class="task-detail-info-label">
                            <i class="bi bi-calendar-fill"></i>
                            Создано:
                        </span>
                    <span id="taskEditCreated" class="task-detail-info-value"></span>
                </div>
            </div>
    </div>

    <div class="board-detail-modal-footer">
        <button type="button" class="unified-button unified-button-danger" onclick="deleteTask()">
            <i class="bi bi-trash-fill"></i>
            Удалить
        </button>
        <div class="board-detail-modal-footer-right">
            <button type="button" class="unified-button unified-button-secondary" onclick="cancelTaskEdit()">
                Отмена
            </button>
            <button type="submit" class="unified-button unified-button-primary">
                <i class="bi bi-check-circle-fill"></i>
                Сохранить изменения
            </button>
        </div>
    </div>
    </form>

    <div id="taskViewFooter" class="board-detail-modal-footer">
        <button type="button" class="unified-button unified-button-danger" onclick="deleteTask()">
            <i class="bi bi-trash-fill"></i>
            Удалить
        </button>
        <div class="board-detail-modal-footer-right">
            <button type="button" class="unified-button unified-button-secondary" onclick="closeTaskDetailModal()">
                Закрыть
            </button>
            <button type="button" class="unified-button unified-button-primary" onclick="enableTaskEdit()">
                <i class="bi bi-pencil-fill"></i>
                Редактировать
            </button>
        </div>
    </div>
</div>
</div>

<script src="/js/board/detail.js"></script>
</@main.layout>