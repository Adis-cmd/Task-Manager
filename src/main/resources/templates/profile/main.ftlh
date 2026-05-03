<#import "../layout.ftlh" as main>
<@main.layout>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Sora:wght@400;600;700;800&display=swap" rel="stylesheet">

<style>
    :root {
        --cyan: #00bcd4;
        --cyan-dark: #0097a7;
        --cyan-glow: rgba(0,188,212,0.22);
        --dark: #1a1a1a;
        --gray: #6b7280;
        --light: #f8fafc;
        --border: #e8ecf0;
        --r: 16px;
    }

    .profile-page { max-width: 900px; margin: 0 auto; }

    .profile-hero {
        border-radius: 24px;
        background: #0d1f24;
        overflow: hidden;
        position: relative;
        margin-bottom: 24px;
        animation: up .6s ease both;
    }

    .profile-hero::before {
        content: '';
        position: absolute; inset: 0;
        background:
            radial-gradient(ellipse 65% 90% at -5% 50%, rgba(0,188,212,.55) 0%, transparent 60%),
            radial-gradient(ellipse 40% 50% at 80% 10%,  rgba(0,188,212,.18) 0%, transparent 55%),
            radial-gradient(ellipse 30% 40% at 100% 80%, rgba(0,150,170,.2)  0%, transparent 55%);
        animation: heroGlow 10s ease-in-out infinite alternate;
    }

    @keyframes heroGlow {
        0%   { opacity: 1; }
        100% { opacity: .82; }
    }

    .profile-hero-grid {
        position: absolute; inset: 0;
        background-image:
            linear-gradient(rgba(255,255,255,.04) 1px, transparent 1px),
            linear-gradient(90deg, rgba(255,255,255,.04) 1px, transparent 1px);
        background-size: 44px 44px;
    }

    .profile-hero-inner {
        position: relative; z-index: 2;
        padding: 40px 44px;
        display: flex; align-items: center; gap: 28px;
    }

    .p-avatar {
        flex-shrink: 0;
        width: 90px; height: 90px; border-radius: 22px;
        border: 2.5px solid rgba(0,188,212,.5);
        box-shadow: 0 0 0 6px rgba(0,188,212,.12);
        overflow: hidden;
        background: rgba(0,188,212,.15);
        display: flex; align-items: center; justify-content: center;
    }

    .p-avatar img { width: 100%; height: 100%; object-fit: cover; }
    .p-avatar i   { font-size: 42px; color: rgba(255,255,255,.45); }

    .p-info { flex: 1; }

    .p-name {
        font-family: 'Sora', sans-serif;
        font-size: 26px; font-weight: 800;
        color: #fff; letter-spacing: -.7px; margin-bottom: 8px;
    }

    .p-meta {
        display: flex; align-items: center; gap: 14px;
        flex-wrap: wrap; margin-bottom: 18px;
    }

    .p-meta-item {
        display: flex; align-items: center; gap: 6px;
        font-size: 13px; color: rgba(255,255,255,.5);
    }

    .p-meta-item i { color: var(--cyan); font-size: 14px; }

    .p-edit-btn {
        display: inline-flex; align-items: center; gap: 8px;
        padding: 9px 18px;
        background: rgba(255,255,255,.08);
        border: 1px solid rgba(255,255,255,.14);
        border-radius: 10px;
        font-size: 13px; font-weight: 600;
        color: rgba(255,255,255,.82); text-decoration: none;
        transition: all .22s;
    }

    .p-edit-btn:hover {
        background: rgba(0,188,212,.2);
        border-color: rgba(0,188,212,.4);
        color: #fff; transform: translateY(-1px);
    }

    .p-stats { display: flex; gap: 8px; flex-shrink: 0; }

    .p-stat {
        background: rgba(0,188,212,.12);
        border: 1px solid rgba(0,188,212,.25);
        border-radius: 14px; padding: 16px 22px;
        text-align: center; min-width: 90px;
        transition: all .22s;
    }

    .p-stat:hover { background: rgba(0,188,212,.22); border-color: rgba(0,188,212,.4); }

    .p-stat-num {
        font-family: 'Sora', sans-serif;
        font-size: 26px; font-weight: 800;
        color: #fff; line-height: 1;
    }

    .p-stat-lbl { font-size: 11px; color: rgba(255,255,255,.4); margin-top: 4px; }

    .section-bar {
        display: flex; align-items: center; justify-content: space-between;
        margin-bottom: 16px;
        animation: up .6s .08s ease both;
    }

    .section-title {
        display: flex; align-items: center; gap: 10px;
        font-family: 'Sora', sans-serif;
        font-size: 17px; font-weight: 700; color: var(--dark);
    }

    .section-title i { color: var(--cyan); font-size: 19px; }

    .btn-create {
        display: inline-flex; align-items: center; gap: 8px;
        padding: 10px 20px;
        background: var(--dark); color: #fff;
        border: none; border-radius: 10px;
        font-size: 13px; font-weight: 700;
        font-family: 'Sora', sans-serif;
        cursor: pointer; text-decoration: none;
        transition: all .22s; position: relative; overflow: hidden;
    }

    .btn-create::after {
        content: '';
        position: absolute; inset: 0;
        background: linear-gradient(135deg, rgba(0,188,212,.2), transparent 55%);
        opacity: 0; transition: opacity .3s;
    }

    .btn-create:hover {
        background: #111; transform: translateY(-1px); color: #fff;
        box-shadow: 0 6px 18px rgba(0,0,0,.18), 0 0 0 1px rgba(0,188,212,.18);
    }

    .btn-create:hover::after { opacity: 1; }

    .projects-grid {
        display: grid;
        grid-template-columns: repeat(auto-fill, minmax(268px, 1fr));
        gap: 14px;
        animation: up .6s .12s ease both;
    }

    .proj-card {
        background: #fff; border: 1px solid var(--border);
        border-radius: var(--r); padding: 22px;
        cursor: pointer; transition: all .25s ease;
        position: relative; overflow: hidden;
        display: flex; flex-direction: column; gap: 14px;
    }

    .proj-card::before {
        content: '';
        position: absolute; top: 0; left: 0; right: 0; height: 3px;
        background: linear-gradient(90deg, var(--cyan), #00e5ff);
        opacity: 0; transition: opacity .25s;
    }

    .proj-card:hover {
        transform: translateY(-4px);
        box-shadow: 0 14px 36px rgba(0,0,0,.08);
        border-color: transparent;
    }

    .proj-card:hover::before { opacity: 1; }

    .proj-card-top {
        display: flex; align-items: flex-start;
        justify-content: space-between; gap: 10px;
    }

    .proj-icon {
        width: 42px; height: 42px; border-radius: 12px;
        background: rgba(0,188,212,.1);
        display: flex; align-items: center; justify-content: center;
        font-size: 20px; color: var(--cyan); flex-shrink: 0;
    }

    .proj-badge {
        display: inline-flex; align-items: center; gap: 5px;
        font-size: 11px; font-weight: 700;
        border-radius: 8px; padding: 4px 10px; flex-shrink: 0;
    }

    .proj-badge.leader { background:rgba(245,158,11,.12); color:#d97706; border:1px solid rgba(245,158,11,.22); }
    .proj-badge.member { background:rgba(0,188,212,.1); color:var(--cyan-dark); border:1px solid rgba(0,188,212,.2); }

    .proj-name {
        font-family: 'Sora', sans-serif;
        font-size: 15px; font-weight: 700;
        color: var(--dark); line-height: 1.35;
    }

    .proj-leader {
        display: flex; align-items: center; gap: 9px;
        padding-top: 12px; border-top: 1px solid var(--border);
    }

    .proj-leader-ava {
        width: 28px; height: 28px; border-radius: 8px;
        object-fit: cover; flex-shrink: 0;
    }

    .proj-leader-ava-ph {
        width: 28px; height: 28px; border-radius: 8px;
        background: rgba(0,188,212,.1);
        display: flex; align-items: center; justify-content: center;
        font-size: 13px; color: var(--cyan); flex-shrink: 0;
    }

    .proj-leader-lbl { font-size: 11px; color: var(--gray); }
    .proj-leader-name { font-size: 13px; font-weight: 600; color: var(--dark); margin-top: 1px; }

    .empty-state {
        text-align: center; padding: 64px 32px;
        background: #fff; border: 1.5px dashed var(--border);
        border-radius: var(--r);
        animation: up .6s .1s ease both;
    }

    .empty-state i { font-size: 52px; color: #d1d5db; display: block; margin-bottom: 16px; }

    .empty-state h3 {
        font-family: 'Sora', sans-serif;
        font-size: 18px; font-weight: 700; color: var(--dark); margin-bottom: 8px;
    }

    .empty-state p { font-size: 14px; color: var(--gray); margin-bottom: 24px; }

    .flash {
        position: fixed; bottom: 24px; right: 24px;
        display: flex; align-items: center; gap: 10px;
        padding: 13px 18px; border-radius: 14px;
        font-size: 14px; font-weight: 500;
        box-shadow: 0 8px 28px rgba(0,0,0,.13);
        z-index: 900; max-width: 340px;
        animation: slideIn .35s ease both;
        transition: opacity .3s, transform .3s;
    }

    .flash i { font-size: 17px; flex-shrink: 0; }
    .flash-ok  { background:#f0fdf4; border:1px solid #bbf7d0; color:#15803d; }
    .flash-err { background:#fff5f5; border:1px solid #fecaca; color:#dc2626; }

    .flash-close {
        background: none; border: none; color: inherit;
        cursor: pointer; font-size: 18px; opacity: .5;
        transition: opacity .2s; padding: 0; margin-left: 4px; line-height: 1;
    }
    .flash-close:hover { opacity: 1; }

    .modal-overlay {
        position: fixed; inset: 0;
        background: rgba(0,0,0,.4); backdrop-filter: blur(6px);
        z-index: 500; display: flex; align-items: center; justify-content: center;
        padding: 24px; opacity: 0; pointer-events: none; transition: opacity .3s;
    }

    .modal-overlay.active { opacity: 1; pointer-events: all; }

    .modal-box {
        background: #fff; border-radius: 20px;
        width: 100%; max-width: 420px;
        box-shadow: 0 24px 64px rgba(0,0,0,.16); overflow: hidden;
        transform: translateY(20px) scale(.97); transition: transform .3s;
    }

    .modal-overlay.active .modal-box { transform: translateY(0) scale(1); }

    .modal-head {
        display: flex; align-items: center; justify-content: space-between;
        padding: 20px 22px 16px; border-bottom: 1px solid var(--border);
    }

    .modal-head-title {
        display: flex; align-items: center; gap: 9px;
        font-family: 'Sora', sans-serif;
        font-size: 15px; font-weight: 700; color: var(--dark);
    }

    .modal-head-title i { color: var(--cyan); font-size: 17px; }

    .modal-close-btn {
        width: 30px; height: 30px; border-radius: 8px;
        background: #f5f7fa; border: none;
        display: flex; align-items: center; justify-content: center;
        font-size: 17px; color: var(--gray); cursor: pointer; transition: all .2s;
    }

    .modal-close-btn:hover { background: #fee2e2; color: #ef4444; }

    .modal-body { padding: 20px 22px; }

    .modal-label {
        display: block; font-size: 11px; font-weight: 700; color: var(--gray);
        letter-spacing: .7px; text-transform: uppercase; margin-bottom: 8px;
    }

    .modal-input {
        width: 100%; padding: 12px 14px;
        border: 1.5px solid var(--border); border-radius: 12px;
        font-size: 14px; color: var(--dark); background: var(--light);
        outline: none; transition: all .22s; font-family: inherit;
    }

    .modal-input::placeholder { color: #c4c9d4; }
    .modal-input:hover  { border-color: #c0cad5; }
    .modal-input:focus  { border-color: var(--cyan); background: #fff; box-shadow: 0 0 0 4px rgba(0,188,212,.1); }

    .modal-foot {
        display: flex; gap: 10px; justify-content: flex-end;
        padding: 14px 22px 20px; border-top: 1px solid var(--border);
    }

    .modal-btn {
        display: inline-flex; align-items: center; gap: 7px;
        padding: 10px 18px; border-radius: 10px;
        font-size: 14px; font-weight: 700;
        font-family: 'Sora', sans-serif; cursor: pointer; border: none; transition: all .22s;
    }

    .modal-btn-cancel { background: #f5f7fa; color: var(--gray); border: 1px solid var(--border); }
    .modal-btn-cancel:hover { background: var(--border); color: var(--dark); }

    .modal-btn-ok { background: var(--dark); color: #fff; position: relative; overflow: hidden; }
    .modal-btn-ok::after { content:''; position:absolute; inset:0; background:linear-gradient(135deg,rgba(0,188,212,.2),transparent 55%); opacity:0; transition:opacity .3s; }
    .modal-btn-ok:hover { background:#111; box-shadow:0 6px 18px rgba(0,0,0,.18),0 0 0 1px rgba(0,188,212,.15); transform:translateY(-1px); }
    .modal-btn-ok:hover::after { opacity: 1; }

    @keyframes up       { from{opacity:0;transform:translateY(18px)} to{opacity:1;transform:translateY(0)} }
    @keyframes slideIn  { from{opacity:0;transform:translateX(28px)} to{opacity:1;transform:translateX(0)} }

    @media (max-width: 700px) {
        .profile-hero-inner { flex-direction:column; align-items:flex-start; padding:28px 22px; }
        .p-stats { flex-wrap: wrap; }
        .projects-grid { grid-template-columns: 1fr; }
    }
</style>

<div class="profile-page">

    <div class="profile-hero">
        <div class="profile-hero-grid"></div>
        <div class="profile-hero-inner">

            <div class="p-avatar">
                <#if profile.avatar?? && profile.avatar?has_content>
                <img src="/photo/${profile.avatar}" alt="${profile.name}">
                <#else>
                <i class="bi bi-person-fill"></i>
            </#if>
        </div>

        <div class="p-info">
            <div class="p-name">${profile.name}</div>
            <div class="p-meta">
                <div class="p-meta-item">
                    <i class="bi bi-kanban-fill"></i>
                    <span>${profile.projectDto?size} проектов</span>
                </div>
            </div>
            <a href="/profile/edit" class="p-edit-btn">
                <i class="bi bi-pencil-fill"></i>
                Редактировать профиль
            </a>
        </div>

        <div class="p-stats">
            <div class="p-stat">
                <div class="p-stat-num">${profile.projectDto?size}</div>
                <div class="p-stat-lbl">Проектов</div>
            </div>
        </div>

    </div>
</div>

<div class="section-bar">
    <div class="section-title">
        <i class="bi bi-kanban-fill"></i>
        Мои проекты
    </div>
    <button class="btn-create" onclick="openModal()">
        <i class="bi bi-plus-lg"></i>
        Создать проект
    </button>
</div>

<#if profile.projectDto?? && profile.projectDto?has_content>
<div class="projects-grid">
    <#list profile.projectDto as project>
    <div class="proj-card" onclick="location.href='/project/${project.id}'">
        <div class="proj-card-top">
            <div class="proj-icon"><i class="bi bi-kanban"></i></div>
            <span class="proj-badge ${project.userRole?lower_case}">
                        <i class="bi bi-${(project.userRole=='LEADER')?then('star-fill','person-fill')}"></i>
                        ${(project.userRole=='LEADER')?then('Лидер','Участник')}
                    </span>
        </div>
        <div class="proj-name">${project.name}</div>
        <div class="proj-leader">
            <#if project.leader.avatar?? && project.leader.avatar?has_content>
            <img src="/photo/${project.leader.avatar}" alt="${project.leader.name}" class="proj-leader-ava">
            <#else>
            <div class="proj-leader-ava-ph"><i class="bi bi-person-fill"></i></div>
        </#if>
        <div>
            <div class="proj-leader-lbl">Руководитель</div>
            <div class="proj-leader-name">${project.leader.name}</div>
        </div>
    </div>
</div>
</#list>
</div>
<#else>
<div class="empty-state">
    <i class="bi bi-folder-x"></i>
    <h3>Нет проектов</h3>
    <p>Вы пока не участвуете ни в одном проекте</p>
    <button class="btn-create" onclick="openModal()">
        <i class="bi bi-plus-lg"></i>
        Создать первый проект
    </button>
</div>
</#if>

</div>

<#if success??>
<div class="flash flash-ok">
    <i class="bi bi-check-circle-fill"></i>
    <span>${success}</span>
    <button class="flash-close" onclick="closeFlash(this)"><i class="bi bi-x"></i></button>
</div>
</#if>

<#if error??>
<div class="flash flash-err">
    <i class="bi bi-exclamation-circle-fill"></i>
    <span>${error}</span>
    <button class="flash-close" onclick="closeFlash(this)"><i class="bi bi-x"></i></button>
</div>
</#if>

<div class="modal-overlay" id="modal" onclick="closeModal(event)">
    <div class="modal-box" onclick="event.stopPropagation()">
        <div class="modal-head">
            <div class="modal-head-title">
                <i class="bi bi-plus-circle-fill"></i>
                Новый проект
            </div>
            <button class="modal-close-btn" onclick="closeModal()"><i class="bi bi-x"></i></button>
        </div>
        <form action="/project/create" method="post" onsubmit="return validateForm()">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <div class="modal-body">
                <label for="projectName" class="modal-label">Название проекта</label>
                <input type="text" id="projectName" name="name" class="modal-input" placeholder="Введите название..." required autocomplete="off">
            </div>
            <div class="modal-foot">
                <button type="button" class="modal-btn modal-btn-cancel" onclick="closeModal()">Отмена</button>
                <button type="submit" class="modal-btn modal-btn-ok">
                    <i class="bi bi-check-lg"></i> Создать
                </button>
            </div>
        </form>
    </div>
</div>

<script>
    const modal = document.getElementById('modal');

    function openModal() {
        modal.classList.add('active');
        document.body.style.overflow = 'hidden';
        setTimeout(() => document.getElementById('projectName').focus(), 100);
    }

    function closeModal(e) {
        if (e && e.target !== e.currentTarget) return;
        modal.classList.remove('active');
        document.body.style.overflow = '';
        document.getElementById('projectName').value = '';
    }

    function validateForm() {
        const v = document.getElementById('projectName').value.trim();
        if (v.length < 3) { alert('Минимум 3 символа'); return false; }
        return true;
    }

    function closeFlash(btn) {
        const el = btn.closest('.flash');
        el.style.opacity = '0';
        el.style.transform = 'translateX(40px)';
        setTimeout(() => el.remove(), 300);
    }

    document.addEventListener('keydown', e => { if (e.key === 'Escape') closeModal(); });

    document.addEventListener('DOMContentLoaded', () => {
        document.querySelectorAll('.flash').forEach(el =>
            setTimeout(() => closeFlash(el.querySelector('.flash-close')), 5000)
        );
    });
</script>

</@main.layout>
