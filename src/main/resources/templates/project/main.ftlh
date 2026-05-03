<#import "../layout.ftlh" as main>
<@main.layout>

<style>
    .projects-page {
        padding: 32px 40px;
        min-height: 100vh;
        background: #f4f6f9;
    }

    .page-header {
        display: flex;
        align-items: center;
        justify-content: space-between;
        margin-bottom: 32px;
    }

    .page-title {
        font-size: 24px;
        font-weight: 700;
        color: #1a1a2e;
        letter-spacing: -0.3px;
    }

    .page-title span { color: #00bcd4; }

    .btn-create {
        display: flex;
        align-items: center;
        gap: 8px;
        background: #00bcd4;
        color: #ffffff;
        border: none;
        border-radius: 10px;
        padding: 10px 20px;
        font-size: 14px;
        font-weight: 600;
        cursor: pointer;
        text-decoration: none;
        transition: background 0.2s, transform 0.15s;
    }

    .btn-create:hover {
        background: #0097a7;
        transform: translateY(-1px);
    }

    .projects-grid {
        display: grid;
        grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
        gap: 20px;
    }

    /* ---- карточка проекта ---- */
    .proj-card {
        background: #ffffff;
        border: 1px solid #e8ecf0;
        border-top: 3px solid transparent;
        border-radius: 14px;
        padding: 22px;
        cursor: pointer;
        transition: border-top-color 0.2s, box-shadow 0.2s, transform 0.2s;
    }

    .proj-card:hover {
        border-top-color: #00bcd4;
        box-shadow: 0 6px 24px rgba(0, 188, 212, 0.1);
        transform: translateY(-2px);
    }

    .proj-card-top {
        display: flex;
        align-items: center;
        justify-content: space-between;
        margin-bottom: 16px;
    }

    .proj-icon {
        width: 42px;
        height: 42px;
        background: rgba(0, 188, 212, 0.1);
        border-radius: 10px;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 18px;
        color: #00bcd4;
    }

    .proj-badge {
        font-size: 11px;
        font-weight: 600;
        padding: 4px 10px;
        border-radius: 6px;
        display: flex;
        align-items: center;
        gap: 4px;
    }

    .proj-badge.leader {
        background: rgba(255, 193, 7, 0.12);
        color: #d4a017;
    }

    .proj-badge.member {
        background: rgba(0, 188, 212, 0.1);
        color: #0097a7;
    }

    .proj-name {
        font-size: 16px;
        font-weight: 600;
        color: #1a1a2e;
        margin-bottom: 16px;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
    }

    .proj-leader {
        display: flex;
        align-items: center;
        gap: 8px;
        border-top: 1px solid #f0f2f5;
        padding-top: 14px;
    }

    .proj-leader-ava {
        width: 28px;
        height: 28px;
        border-radius: 50%;
        object-fit: cover;
    }

    .proj-leader-ava-ph {
        width: 28px;
        height: 28px;
        border-radius: 50%;
        background: #e8ecf0;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 14px;
        color: #9aa5b4;
        flex-shrink: 0;
    }

    .proj-leader-lbl {
        font-size: 11px;
        color: #9aa5b4;
        line-height: 1;
        margin-bottom: 2px;
    }

    .proj-leader-name {
        font-size: 13px;
        font-weight: 500;
        color: #4a5568;
    }

    /* ---- пусто ---- */
    .empty-state {
        grid-column: 1 / -1;
        text-align: center;
        padding: 80px 20px;
        color: #9aa5b4;
    }

    .empty-state i {
        font-size: 48px;
        display: block;
        margin-bottom: 16px;
        opacity: 0.4;
    }

    .empty-state p {
        font-size: 15px;
        margin-bottom: 20px;
    }

    /* ---- пагинация ---- */
    .pagination {
        display: flex;
        align-items: center;
        justify-content: center;
        gap: 6px;
        margin-top: 40px;
    }

    .page-btn {
        width: 36px;
        height: 36px;
        border-radius: 8px;
        border: 1px solid #e8ecf0;
        background: #ffffff;
        color: #4a5568;
        font-size: 14px;
        display: flex;
        align-items: center;
        justify-content: center;
        cursor: pointer;
        text-decoration: none;
        transition: border-color 0.2s, color 0.2s, background 0.2s;
    }

    .page-btn:hover {
        border-color: #00bcd4;
        color: #00bcd4;
    }

    .page-btn.active {
        background: #00bcd4;
        border-color: #00bcd4;
        color: #ffffff;
        font-weight: 600;
    }

    .page-btn.disabled {
        opacity: 0.35;
        pointer-events: none;
    }
</style>

<div class="projects-page">

    <div class="page-header">
        <h1 class="page-title">Мои <span>проекты</span></h1>
        <a href="/projects/create" class="btn-create">
            <i class="bi bi-plus-lg"></i>
            Создать проект
        </a>
    </div>

    <div class="projects-grid">

        <#if project.content?has_content>
        <#list project.content as p>
        <div class="proj-card" onclick="location.href='/project/${p.id}'">
            <div class="proj-card-top">
                <div class="proj-icon"><i class="bi bi-kanban"></i></div>

            </div>
            <div class="proj-name">${p.name}</div>
            <div class="proj-leader">
                <#if p.leader.avatar?? && p.leader.avatar?has_content>
                <img src="/photo/${p.leader.avatar}" alt="${p.leader.name}" class="proj-leader-ava">
                <#else>
                <div class="proj-leader-ava-ph"><i class="bi bi-person-fill"></i></div>
            </#if>
            <div>
                <div class="proj-leader-lbl">Руководитель</div>
                <div class="proj-leader-name">${p.leader.name}</div>
            </div>
        </div>
    </div>
</#list>
<#else>
<div class="empty-state">
    <i class="bi bi-kanban"></i>
    <p>У вас пока нет проектов</p>
    <a href="/projects/create" class="btn-create" style="display:inline-flex">
        Создать первый проект
    </a>
</div>
</#if>

</div>

<#if project.totalPages gt 1>
<div class="pagination">

    <a href="?page=0&size=${project.size}"
       class="page-btn <#if project.first>disabled</#if>">
        <i class="bi bi-chevron-left"></i>
    </a>

    <#list 0..(project.totalPages - 1) as i>
    <a href="?page=${i}&size=${project.size}"
       class="page-btn <#if i == project.number>active</#if>">
        ${i + 1}
    </a>
</#list>

<a href="?page=${project.totalPages - 1}&size=${project.size}"
   class="page-btn <#if project.last>disabled</#if>">
    <i class="bi bi-chevron-right"></i>
</a>

</div>
</#if>

</div>

</@main.layout>
