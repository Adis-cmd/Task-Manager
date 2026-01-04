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

        if (boardName.length > 100) {
            showBoardError('Название доски не должно превышать 100 символов');
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

        const alerts = document.querySelectorAll('.project-detail-alert');
        alerts.forEach(alert => {
            setTimeout(() => {
                alert.style.opacity = '0';
                setTimeout(() => alert.remove(), 300);
            }, 5000);
        });
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