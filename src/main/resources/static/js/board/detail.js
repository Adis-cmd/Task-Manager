function openCreateTaskModal(columnId) {
    const modal = document.getElementById('createTaskModal');
    modal.classList.add('active');
    document.body.style.overflow = 'hidden';

    if (columnId) {
        document.getElementById('taskColumn').value = columnId;
    }

    setTimeout(() => {
        document.getElementById('taskName').focus();
    }, 100);
}

function closeCreateTaskModal(event) {
    if (event && event.target !== event.currentTarget) {
        return;
    }
    const modal = document.getElementById('createTaskModal');
    modal.classList.remove('active');
    document.body.style.overflow = '';
    document.getElementById('taskName').value = '';
    document.getElementById('taskDescription').value = '';
    document.getElementById('taskPriority').value = 'MEDIUM';
}

function validateTaskForm() {
    const taskName = document.getElementById('taskName').value.trim();
    if (taskName.length === 0) {
        alert('Пожалуйста, введите название задачи');
        return false;
    }
    if (taskName.length < 3) {
        alert('Название задачи должно содержать минимум 3 символа');
        return false;
    }
    return true;
}

function openAddColumnModal() {
    const modal = document.getElementById('addColumnModal');
    modal.classList.add('active');
    document.body.style.overflow = 'hidden';
    setTimeout(() => {
        document.getElementById('columnName').focus();
    }, 100);
}

function closeAddColumnModal(event) {
    if (event && event.target !== event.currentTarget) {
        return;
    }
    const modal = document.getElementById('addColumnModal');
    modal.classList.remove('active');
    document.body.style.overflow = '';
    document.getElementById('columnName').value = '';
}

function validateColumnForm() {
    const columnName = document.getElementById('columnName').value.trim();
    if (columnName.length === 0) {
        alert('Пожалуйста, введите название колонки');
        return false;
    }
    if (columnName.length < 2) {
        alert('Название колонки должно содержать минимум 2 символа');
        return false;
    }
    return true;
}

const priorityNames = {
    'LOW': 'Низкий',
    'MEDIUM': 'Средний',
    'HIGH': 'Высокий',
    'URGENT': 'Срочный'
};

const statusNames = {
    'PENDING': 'Ожидает',
    'IN_PROGRESS': 'В процессе',
    'COMPLETED': 'Завершено'
};

let currentTaskData = null;

function toggleDescription() {
    const descElement = document.getElementById('taskViewDescription');
    const descWrapper = document.getElementById('taskViewDescWrapper');
    const toggleBtn = document.getElementById('toggleDescBtn');

    if (descElement.classList.contains('collapsed')) {
        descElement.classList.remove('collapsed');
        descWrapper.classList.remove('has-fade');
        toggleBtn.innerHTML = '<i class="bi bi-chevron-up"></i> Свернуть';
    } else {
        descElement.classList.add('collapsed');
        descWrapper.classList.add('has-fade');
        toggleBtn.innerHTML = '<i class="bi bi-chevron-down"></i> Развернуть';
    }
}

function openTaskDetailModal(taskId) {
    const modal = document.getElementById('taskDetailModal');
    modal.classList.add('active');
    document.body.style.overflow = 'hidden';

    document.getElementById('taskViewMode').style.display = 'block';
    document.getElementById('taskViewFooter').style.display = 'flex';
    document.getElementById('taskDetailForm').style.display = 'none';

    const csrfToken = document.querySelector('input[name="_csrf"]').value;

    fetch(`/api/tasks/${taskId}`, {
        method: 'GET',
        headers: {
            'X-CSRF-TOKEN': csrfToken
        }
    })
        .then(response => {
            if (!response.ok) {
                throw new Error('Задача не найдена');
            }
            return response.json();
        })
        .then(task => {
            currentTaskData = task;

            // Заполняем режим просмотра
            document.getElementById('taskDetailTitle').textContent = task.name;
            document.getElementById('taskViewName').textContent = task.name;

            const descElement = document.getElementById('taskViewDescription');
            const descWrapper = document.getElementById('taskViewDescWrapper');
            const description = task.description || '';
            descElement.textContent = description;

            // Проверяем длину описания
            const lineCount = description.split('\n').length;
            const charCount = description.length;
            const toggleBtnContainer = document.getElementById('toggleDescBtnContainer');

            // Показываем кнопку если больше 50 строк или больше 500 символов
            if (lineCount > 50 || charCount > 500) {
                descElement.classList.add('collapsed');
                descWrapper.classList.add('has-fade');
                toggleBtnContainer.style.display = 'block';
                document.getElementById('toggleDescBtn').innerHTML = '<i class="bi bi-chevron-down"></i> Развернуть';
            } else {
                descElement.classList.remove('collapsed');
                descWrapper.classList.remove('has-fade');
                toggleBtnContainer.style.display = 'none';
            }

            const priorityBadge = document.getElementById('taskViewPriority');
            priorityBadge.textContent = priorityNames[task.priority] || task.priority;
            priorityBadge.className = 'task-detail-view-badge priority-' + task.priority;

            const statusBadge = document.getElementById('taskViewStatus');
            statusBadge.textContent = statusNames[task.status] || task.status;
            statusBadge.className = 'task-detail-view-badge status-' + task.status;

            const columnName = getColumnNameById(task.columnId);
            document.getElementById('taskViewColumn').textContent = columnName;

            document.getElementById('taskDetailId').value = task.id;
            document.getElementById('taskDetailForm').action = `/tasks/${taskId}`;

            if (task.author) {
                const authorHtml = `
                    <div class="board-detail-task-author">
                        ${task.author.avatar ?
                            `<img src="/photo/${task.author.avatar}" alt="${task.author.name}" class="board-detail-task-avatar">` :
                            `<div class="board-detail-task-avatar-placeholder"><i class="bi bi-person-fill"></i></div>`
                        }
                        <span>${task.author.name}</span>
                    </div>
                `;
                document.getElementById('taskViewAuthor').innerHTML = authorHtml;
            }

            if (task.createdAt) {
                const createdDate = new Date(task.createdAt);
                const formattedDate = createdDate.toLocaleString('ru-RU', {
                    day: '2-digit',
                    month: '2-digit',
                    year: 'numeric',
                    hour: '2-digit',
                    minute: '2-digit'
                });
                document.getElementById('taskViewCreated').textContent = formattedDate;
            }

            if (task.participants && task.participants.length > 0) {
                const participantsSection = document.getElementById('taskViewParticipantsSection');
                participantsSection.style.display = 'block';

                const participantsHtml = task.participants.map(participant => `
                    <div class="task-detail-participant-item">
                        ${participant.avatar ?
                            `<img src="${participant.avatar}" alt="${participant.name}">` :
                            `<div class="board-detail-task-participant-placeholder"><i class="bi bi-person-fill"></i></div>`
                        }
                        <span>${participant.name}</span>
                    </div>
                `).join('');

                document.getElementById('taskViewParticipants').innerHTML = participantsHtml;
            } else {
                document.getElementById('taskViewParticipantsSection').style.display = 'none';
            }

            if (task.comments && task.comments.length > 0) {
                const commentsSection = document.getElementById('taskViewCommentsSection');
                commentsSection.style.display = 'block';

                document.getElementById('taskViewCommentsCount').textContent = task.comments.length;

                const commentsHtml = task.comments.map(comment => `
                    <div class="task-detail-comment-item">
                        <div class="task-detail-comment-header">
                            ${comment.author.avatar ?
                                `<img src="/photo/${comment.author.avatar}" alt="${comment.author.name}" class="board-detail-task-avatar">` :
                                `<div class="board-detail-task-avatar-placeholder"><i class="bi bi-person-fill"></i></div>`
                            }
                            <div class="task-detail-comment-info">
                                <span class="task-detail-comment-author">${comment.author.name}</span>
                                <span class="task-detail-comment-date">${new Date(comment.createdAt).toLocaleString('ru-RU')}</span>
                            </div>
                        </div>
                        <div class="task-detail-comment-text">${comment.text}</div>
                    </div>
                `).join('');

                document.getElementById('taskViewComments').innerHTML = commentsHtml;
            } else {
                document.getElementById('taskViewCommentsSection').style.display = 'none';
            }
        })
        .catch(error => {
            console.error('Ошибка загрузки задачи:', error);
            alert('Не удалось загрузить данные задачи');
            closeTaskDetailModal();
        });
}

function getColumnNameById(columnId) {
    const columnSelect = document.getElementById('taskDetailColumn');
    const option = columnSelect.querySelector(`option[value="${columnId}"]`);
    return option ? option.textContent : 'Неизвестная колонка';
}

function enableTaskEdit() {
    if (!currentTaskData) return;

    document.getElementById('taskViewMode').style.display = 'none';
    document.getElementById('taskViewFooter').style.display = 'none';

    document.getElementById('taskDetailForm').style.display = 'block';

    document.getElementById('taskDetailName').value = currentTaskData.name;
    document.getElementById('taskDetailDescription').value = currentTaskData.description || '';
    document.getElementById('taskDetailPriority').value = currentTaskData.priority;
    document.getElementById('taskDetailStatus').value = currentTaskData.status;
    document.getElementById('taskDetailColumn').value = currentTaskData.columnId;

    if (currentTaskData.author) {
        const authorHtml = `
            <div class="board-detail-task-author">
                ${currentTaskData.author.avatar ?
                    `<img src="/photo/${currentTaskData.author.avatar}" alt="${currentTaskData.author.name}" class="board-detail-task-avatar">` :
                    `<div class="board-detail-task-avatar-placeholder"><i class="bi bi-person-fill"></i></div>`
                }
                <span>${currentTaskData.author.name}</span>
            </div>
        `;
        document.getElementById('taskEditAuthor').innerHTML = authorHtml;
    }

    if (currentTaskData.createdAt) {
        const createdDate = new Date(currentTaskData.createdAt);
        document.getElementById('taskEditCreated').textContent = createdDate.toLocaleString('ru-RU', {
            day: '2-digit',
            month: '2-digit',
            year: 'numeric',
            hour: '2-digit',
            minute: '2-digit'
        });
    }

    setTimeout(() => {
        document.getElementById('taskDetailName').focus();
    }, 100);
}

function cancelTaskEdit() {
    if (!currentTaskData) return;

    document.getElementById('taskDetailForm').style.display = 'none';
    document.getElementById('taskViewMode').style.display = 'block';
    document.getElementById('taskViewFooter').style.display = 'flex';
}

function closeTaskDetailModal(event) {
    if (event && event.target !== event.currentTarget) {
        return;
    }
    const modal = document.getElementById('taskDetailModal');
    modal.classList.remove('active');
    document.body.style.overflow = '';

    currentTaskData = null;
    document.getElementById('taskDetailForm').reset();
    document.getElementById('taskDetailId').value = '';
}

function validateTaskEditForm() {
    const taskName = document.getElementById('taskDetailName').value.trim();
    if (taskName.length === 0) {
        alert('Пожалуйста, введите название задачи');
        return false;
    }
    if (taskName.length < 3) {
        alert('Название задачи должно содержать минимум 3 символа');
        return false;
    }
    return true;
}

function deleteTask() {
    const taskId = document.getElementById('taskDetailId').value;
    const boardId = document.getElementById('taskDetailBoardId').value;

    if (!taskId) {
        alert('Ошибка: ID задачи не найден');
        return;
    }

    if (confirm('Вы уверены, что хотите удалить эту задачу?')) {
        const form = document.createElement('form');
        form.method = 'POST';
        form.action = `/tasks/${taskId}/delete`;

        const csrfToken = document.querySelector('input[name="_csrf"]').value;
        const csrfInput = document.createElement('input');
        csrfInput.type = 'hidden';
        csrfInput.name = '_csrf';
        csrfInput.value = csrfToken;
        form.appendChild(csrfInput);

        const boardIdInput = document.createElement('input');
        boardIdInput.type = 'hidden';
        boardIdInput.name = 'boardId';
        boardIdInput.value = boardId;
        form.appendChild(boardIdInput);

        document.body.appendChild(form);
        form.submit();
    }
}

document.addEventListener('keydown', function(event) {
    if (event.key === 'Escape') {
        closeCreateTaskModal();
        closeAddColumnModal();
        closeTaskDetailModal();
    }

    if ((event.ctrlKey || event.metaKey) && event.key === 'k') {
        event.preventDefault();
        openCreateTaskModal();
    }
});

const modals = document.querySelectorAll('.board-detail-modal-overlay');
modals.forEach(modal => {
    modal.addEventListener('wheel', function(e) {
        if (e.target === this) {
            e.preventDefault();
        }
    }, { passive: false });
});

function closeBoardFlashMessage(button) {
    const message = button.closest('.board-flash-message');
    message.style.animation = 'fadeOut 0.3s ease-out';
    setTimeout(() => {
        message.remove();
    }, 300);
}

document.addEventListener('DOMContentLoaded', function() {
    const flashMessages = document.querySelectorAll('.board-flash-message');
    flashMessages.forEach(message => {
        setTimeout(() => {
            if (message.parentElement) {
                message.style.animation = 'fadeOut 0.3s ease-out';
                setTimeout(() => {
                    message.remove();
                }, 300);
            }
        }, 5000);
    });
});