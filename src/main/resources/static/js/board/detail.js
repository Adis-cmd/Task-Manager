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

    function openTaskDetailModal(taskId) {
        window.location.href = '/tasks/' + taskId;
    }

    document.addEventListener('keydown', function(event) {
        if (event.key === 'Escape') {
            closeCreateTaskModal();
            closeAddColumnModal();
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