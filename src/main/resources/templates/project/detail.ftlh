<#import "../layout.ftlh" as main>
<@main.layout>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Sora:wght@400;500;600;700;800&display=swap" rel="stylesheet">

<style>
    :root {
        --cyan:        #00bcd4;
        --cyan-dark:   #0097a7;
        --cyan-light:  #e0f7fa;
        --cyan-glow:   rgba(0,188,212,0.18);
        --cyan-subtle: rgba(0,188,212,0.08);

        --dark:   #0f2027;
        --mid:    #2c4a54;
        --gray:   #6b7d84;
        --border: #d4edf2;
        --bg:     #f0f9fb;
        --surface:#ffffff;
        --light:  #f7fcfd;

        --shadow-xs: 0 1px 4px rgba(0,150,170,.07);
        --shadow-sm: 0 2px 12px rgba(0,150,170,.09);
        --shadow-md: 0 6px 24px rgba(0,150,170,.13);
        --r: 14px;
        --r-sm: 9px;
    }

    *, *::before, *::after { box-sizing: border-box; }

    body { background: var(--bg); }
    .pd { max-width: 100%; }

    .pd-header {
        background: linear-gradient(135deg, #0d2d38 0%, #0a4356 60%, #065f71 100%);
        border-radius: 20px;
        position: relative; overflow: hidden;
        padding: 28px 36px;
        margin-bottom: 18px;
        display: flex; align-items: center;
        justify-content: space-between; gap: 20px;
        box-shadow: 0 8px 32px rgba(0,100,120,.22);
        animation: fadeUp .45s ease both;
    }

    .pd-header::before {
        content: '';
        position: absolute; inset: 0;
        background:
            radial-gradient(ellipse 60% 110% at -8% 50%, rgba(0,188,212,.45) 0%, transparent 60%),
            radial-gradient(ellipse 40% 60% at 92% 15%,  rgba(0,188,212,.18) 0%, transparent 55%),
            radial-gradient(ellipse 30% 40% at 80% 85%,  rgba(0,188,212,.1)  0%, transparent 50%);
    }

    .pd-header-grid {
        position: absolute; inset: 0;
        background-image:
            linear-gradient(rgba(255,255,255,.025) 1px, transparent 1px),
            linear-gradient(90deg, rgba(255,255,255,.025) 1px, transparent 1px);
        background-size: 44px 44px;
    }

    .pd-header-left { position: relative; z-index: 2; }

    .pd-back {
        display: inline-flex; align-items: center; gap: 6px;
        font-size: 11px; font-weight: 600; letter-spacing: .4px;
        color: rgba(255,255,255,.45); text-decoration: none;
        transition: color .2s; margin-bottom: 10px;
        font-family: 'Sora', sans-serif; text-transform: uppercase;
    }
    .pd-back:hover { color: var(--cyan); }

    .pd-title {
        font-family: 'Sora', sans-serif;
        font-size: 22px; font-weight: 800;
        color: #fff; letter-spacing: -.4px;
        display: flex; align-items: center; gap: 12px;
    }

    .pd-title-icon {
        width: 38px; height: 38px; border-radius: 11px;
        background: rgba(0,188,212,.22);
        border: 1px solid rgba(0,188,212,.4);
        display: flex; align-items: center; justify-content: center;
        font-size: 17px; color: var(--cyan); flex-shrink: 0;
        box-shadow: 0 0 18px rgba(0,188,212,.3);
    }

    .pd-header-right {
        position: relative; z-index: 2;
        display: flex; gap: 8px; flex-wrap: wrap; align-items: center;
    }

    .btn {
        display: inline-flex; align-items: center; gap: 7px;
        padding: 10px 18px; border-radius: 10px;
        font-size: 13px; font-weight: 700;
        font-family: 'Sora', sans-serif;
        cursor: pointer; border: none; text-decoration: none;
        transition: all .2s ease; white-space: nowrap;
    }

    .btn-cyan {
        background: var(--cyan); color: #fff;
        box-shadow: 0 4px 14px rgba(0,188,212,.35);
    }
    .btn-cyan:hover { background: var(--cyan-dark); transform: translateY(-2px); box-shadow: 0 7px 20px rgba(0,188,212,.4); color: #fff; }

    .btn-ghost {
        background: rgba(255,255,255,.12); border: 1px solid rgba(255,255,255,.2); color: rgba(255,255,255,.9);
        backdrop-filter: blur(6px);
    }
    .btn-ghost:hover { background: rgba(255,255,255,.22); color: #fff; transform: translateY(-2px); }

    .btn-light {
        background: var(--surface); color: var(--mid); border: 1.5px solid var(--border);
    }
    .btn-light:hover { border-color: var(--cyan); color: var(--cyan-dark); transform: translateY(-1px); box-shadow: var(--shadow-sm); }

    .btn-red { background: #fff5f5; color: #dc2626; border: 1.5px solid #fecaca; }
    .btn-red:hover { background: #dc2626; color: #fff; border-color: #dc2626; }

    .btn-sm { padding: 7px 13px; font-size: 12px; border-radius: 8px; }

    .pd-layout {
        display: grid;
        grid-template-columns: 230px 1fr;
        gap: 16px;
        animation: fadeUp .45s .08s ease both;
    }

    .pd-card {
        background: var(--surface);
        border: 1.5px solid var(--border);
        border-radius: var(--r);
        overflow: hidden;
        margin-bottom: 14px;
        box-shadow: var(--shadow-xs);
        transition: box-shadow .2s;
    }
    .pd-card:last-child { margin-bottom: 0; }
    .pd-card:hover { box-shadow: var(--shadow-sm); }

    .pd-card-head {
        display: flex; align-items: center; gap: 8px;
        padding: 12px 16px;
        background: linear-gradient(to right, var(--cyan-subtle), transparent);
        border-bottom: 1.5px solid var(--border);
        font-family: 'Sora', sans-serif;
        font-size: 11px; font-weight: 700; color: var(--mid);
        text-transform: uppercase; letter-spacing: .7px;
    }
    .pd-card-head i { color: var(--cyan); font-size: 14px; }
    .pd-card-head .count {
        margin-left: auto; font-size: 11px; font-weight: 700;
        background: var(--cyan-light); color: var(--cyan-dark);
        border-radius: 6px; padding: 2px 8px;
    }


    .member-row {
        display: flex; align-items: center; gap: 9px;
        padding: 10px 14px; border-bottom: 1px solid var(--border);
        transition: background .15s;
    }
    .member-row:last-child { border-bottom: none; }
    .member-row:hover { background: var(--light); }

    .m-ava, .m-ava-ph {
        width: 30px; height: 30px; border-radius: 8px;
        object-fit: cover; flex-shrink: 0;
    }
    .m-ava-ph {
        background: var(--cyan-light);
        border: 1.5px solid rgba(0,188,212,.25);
        display: flex; align-items: center; justify-content: center;
        font-size: 13px; color: var(--cyan);
    }

    .m-name { font-size: 13px; font-weight: 600; color: var(--dark); line-height: 1.2; }
    .m-role { font-size: 11px; color: var(--gray); }

    .m-badge {
        margin-left: auto; flex-shrink: 0;
        font-size: 10px; font-weight: 700;
        border-radius: 5px; padding: 2px 7px; text-transform: uppercase;
    }
    .mb-leader { background: rgba(245,158,11,.12); color:#d97706; }
    .mb-member { background: var(--cyan-light); color: var(--cyan-dark); }
    .mb-viewer { background: rgba(107,114,128,.1); color: var(--gray); }

    .card-add-btn {
        width: 100%; padding: 10px 14px;
        display: flex; align-items: center; justify-content: center; gap: 6px;
        background: none; border: none; border-top: 1px solid var(--border);
        font-size: 12px; font-weight: 700; color: var(--cyan-dark);
        cursor: pointer; font-family: 'Sora', sans-serif; transition: background .15s;
    }
    .card-add-btn:hover { background: var(--cyan-subtle); }

    .info-row {
        display: flex; align-items: center; gap: 8px;
        padding: 10px 14px; border-bottom: 1px solid var(--border);
        font-size: 13px;
    }
    .info-row:last-child { border-bottom: none; }
    .info-row i { color: var(--cyan); font-size: 13px; flex-shrink: 0; }
    .info-lbl { color: var(--gray); font-size: 12px; flex: 1; }
    .info-val { font-weight: 700; color: var(--dark); }

    .kanban-topbar {
        display: flex; align-items: center; justify-content: space-between;
        margin-bottom: 14px;
    }

    .kanban-title {
        font-family: 'Sora', sans-serif;
        font-size: 15px; font-weight: 700; color: var(--dark);
        display: flex; align-items: center; gap: 8px;
    }
    .kanban-title i { color: var(--cyan); }

    .kanban-scroll { overflow-x: auto; padding-bottom: 8px; }
    .kanban-scroll::-webkit-scrollbar { height: 5px; }
    .kanban-scroll::-webkit-scrollbar-track { background: transparent; }
    .kanban-scroll::-webkit-scrollbar-thumb { background: var(--border); border-radius: 10px; }

    .kanban-cols {
        display: flex; gap: 12px;
        min-width: max-content; align-items: flex-start;
    }

    .kol {
        width: 272px; flex-shrink: 0;
        background: var(--surface);
        border: 1.5px solid var(--border);
        border-radius: var(--r);
        display: flex; flex-direction: column;
        box-shadow: var(--shadow-xs);
        transition: box-shadow .2s;
    }
    .kol:hover { box-shadow: var(--shadow-sm); }

    .kol-head {
        display: flex; align-items: center; justify-content: space-between;
        padding: 12px 12px 10px;
        background: linear-gradient(to right, var(--cyan-subtle), transparent);
        border-bottom: 1.5px solid var(--border);
        border-radius: var(--r) var(--r) 0 0;
    }

    .kol-head-l { display: flex; align-items: center; gap: 8px; }

    .kol-dot {
        width: 8px; height: 8px; border-radius: 50%;
        background: var(--cyan);
        box-shadow: 0 0 8px rgba(0,188,212,.5);
    }

    .kol-name { font-family: 'Sora', sans-serif; font-size: 13px; font-weight: 700; color: var(--dark); }

    .kol-cnt {
        font-size: 11px; font-weight: 700;
        background: var(--cyan-light); color: var(--cyan-dark);
        border-radius: 6px; padding: 2px 8px;
    }

    .kol-edit {
        width: 26px; height: 26px; border-radius: 7px;
        background: none; border: none;
        display: flex; align-items: center; justify-content: center;
        font-size: 11px; color: var(--gray);
        cursor: pointer; transition: all .18s;
    }
    .kol-edit:hover { background: var(--cyan-light); color: var(--cyan-dark); }

    .kol-body {
        flex: 1; padding: 8px;
        display: flex; flex-direction: column; gap: 7px;
        max-height: calc(100vh - 300px);
        overflow-y: auto; min-height: 56px;
    }
    .kol-body::-webkit-scrollbar { width: 3px; }
    .kol-body::-webkit-scrollbar-thumb { background: var(--border); border-radius: 10px; }

    .kol-foot { padding: 0 8px 8px; flex-shrink: 0; }

    .kol-add {
        width: 100%; padding: 9px;
        display: flex; align-items: center; justify-content: center; gap: 6px;
        background: none; border: 1.5px dashed var(--border);
        border-radius: 9px; font-size: 12px; font-weight: 600;
        color: var(--gray); cursor: pointer; transition: all .2s;
        font-family: 'Sora', sans-serif;
    }
    .kol-add:hover { border-color: var(--cyan); color: var(--cyan-dark); background: var(--cyan-subtle); }

    .kol-empty {
        padding: 22px 12px; text-align: center; color: var(--gray);
    }
    .kol-empty i { font-size: 24px; color: #c5d9df; display: block; margin-bottom: 6px; }
    .kol-empty p { font-size: 12px; }

    .task-card {
        background: var(--light);
        border: 1.5px solid var(--border);
        border-radius: 10px; padding: 12px;
        cursor: pointer; transition: all .2s;
        position: relative; overflow: hidden;
    }
    .task-card::before {
        content: '';
        position: absolute; top: 0; left: 0; bottom: 0; width: 3px;
        border-radius: 10px 0 0 10px;
        background: var(--cyan); opacity: 0; transition: opacity .2s;
    }
    .task-card:hover {
        transform: translateY(-2px);
        box-shadow: var(--shadow-md);
        border-color: rgba(0,188,212,.35);
        background: #fff;
    }
    .task-card:hover::before { opacity: 1; }

    .tc-name { font-size: 13px; font-weight: 600; color: var(--dark); line-height: 1.4; margin-bottom: 8px; }

    .tc-badges { display: flex; gap: 5px; flex-wrap: wrap; margin-bottom: 8px; }

    .badge {
        font-size: 10px; font-weight: 700;
        border-radius: 5px; padding: 2px 7px;
        text-transform: uppercase; letter-spacing: .3px;
    }
    .p-low      { background: rgba(34,197,94,.1);  color: #16a34a; border: 1px solid rgba(34,197,94,.2); }
    .p-medium   { background: rgba(245,158,11,.1); color: #d97706; border: 1px solid rgba(245,158,11,.2); }
    .p-high     { background: rgba(239,68,68,.1);  color: #dc2626; border: 1px solid rgba(239,68,68,.2); }
    .p-urgent   { background: rgba(168,85,247,.1); color: #9333ea; border: 1px solid rgba(168,85,247,.2); }
    .s-pending     { background: rgba(107,114,128,.08); color: var(--gray);       border: 1px solid rgba(107,114,128,.15); }
    .s-in_progress { background: var(--cyan-light);   color: var(--cyan-dark);   border: 1px solid rgba(0,188,212,.25); }
    .s-completed   { background: rgba(34,197,94,.1);   color: #16a34a;           border: 1px solid rgba(34,197,94,.2); }

    .tc-foot { display: flex; align-items: center; justify-content: space-between; }
    .tc-foot-l { display: flex; align-items: center; gap: 5px; }

    .tc-ava, .tc-ava-ph {
        width: 20px; height: 20px; border-radius: 5px; object-fit: cover; flex-shrink: 0;
    }
    .tc-ava-ph { background: var(--cyan-light); display: flex; align-items: center; justify-content: center; font-size: 10px; color: var(--cyan); }

    .tc-author { font-size: 11px; color: var(--gray); }

    .tc-foot-r { display: flex; align-items: center; gap: 5px; }
    .tc-parts { display: flex; }
    .tc-part-ava, .tc-part-ph {
        width: 18px; height: 18px; border-radius: 4px;
        border: 2px solid var(--surface);
        margin-left: -4px; object-fit: cover; flex-shrink: 0;
    }
    .tc-part-ava:first-child, .tc-part-ph:first-child { margin-left: 0; }
    .tc-part-ph { background: var(--cyan-light); display: flex; align-items: center; justify-content: center; font-size: 9px; color: var(--cyan); }

    .tc-comments { display: flex; align-items: center; gap: 3px; font-size: 11px; color: var(--gray); }

    .kol-new {
        width: 200px; flex-shrink: 0;
        border: 2px dashed var(--border);
        border-radius: var(--r);
        display: flex; align-items: center; justify-content: center;
        flex-direction: column; gap: 8px;
        min-height: 140px; cursor: pointer;
        transition: all .22s; background: none;
        color: var(--gray); font-family: 'Sora', sans-serif;
    }
    .kol-new:hover { border-color: var(--cyan); color: var(--cyan-dark); background: var(--cyan-subtle); }
    .kol-new i { font-size: 22px; }
    .kol-new span { font-size: 12px; font-weight: 700; }

    .board-empty {
        background: var(--surface); border: 2px dashed var(--border);
        border-radius: var(--r); padding: 72px 32px; text-align: center;
    }
    .board-empty i { font-size: 52px; color: #c5d9df; display: block; margin-bottom: 16px; }
    .board-empty h3 { font-family:'Sora',sans-serif; font-size:18px; font-weight:700; color:var(--dark); margin-bottom:8px; }
    .board-empty p  { font-size:14px; color:var(--gray); margin-bottom:24px; }

    .flash {
        position: fixed; bottom: 24px; right: 24px;
        display: flex; align-items: center; gap: 10px;
        padding: 13px 18px; border-radius: 13px;
        font-size: 14px; font-weight: 500;
        box-shadow: var(--shadow-md); z-index: 9999; max-width: 340px;
        animation: slideIn .35s ease both; transition: opacity .3s, transform .3s;
    }
    .flash i { font-size: 16px; flex-shrink: 0; }
    .flash-ok  { background: #f0fdf4; border: 1.5px solid #86efac; color: #15803d; }
    .flash-err { background: #fff5f5; border: 1.5px solid #fca5a5; color: #dc2626; }
    .flash-close { background: none; border: none; color: inherit; cursor: pointer; font-size: 18px; opacity: .4; transition: opacity .2s; padding: 0; margin-left: 4px; line-height: 1; }
    .flash-close:hover { opacity: 1; }

    .modal-overlay {
        position: fixed; inset: 0;
        background: rgba(10,60,72,.25); backdrop-filter: blur(8px);
        z-index: 5000; display: flex; align-items: center; justify-content: center;
        padding: 24px; opacity: 0; pointer-events: none; transition: opacity .28s;
    }
    .modal-overlay.active { opacity: 1; pointer-events: all; }

    .modal-box {
        background: var(--surface);
        border: 1.5px solid var(--border);
        border-radius: 20px;
        width: 100%; max-width: 440px;
        box-shadow: 0 24px 64px rgba(0,80,100,.14);
        overflow: hidden;
        transform: translateY(16px) scale(.97); transition: transform .28s;
    }
    .modal-box-lg { max-width: 560px; }
    .modal-overlay.active .modal-box { transform: translateY(0) scale(1); }

    .modal-head {
        display: flex; align-items: center; justify-content: space-between;
        padding: 18px 22px 14px; border-bottom: 1.5px solid var(--border);
        background: linear-gradient(to right, var(--cyan-subtle), transparent);
    }
    .modal-head-title { display:flex; align-items:center; gap:9px; font-family:'Sora',sans-serif; font-size:15px; font-weight:700; color:var(--dark); }
    .modal-head-title i { color:var(--cyan); font-size:16px; }

    .modal-x { width:30px; height:30px; border-radius:8px; background:var(--light); border:1.5px solid var(--border); display:flex; align-items:center; justify-content:center; font-size:17px; color:var(--gray); cursor:pointer; transition:all .2s; }
    .modal-x:hover { background:#fee2e2; color:#ef4444; border-color:#fca5a5; }

    .modal-body { padding: 18px 22px; max-height: 60vh; overflow-y: auto; }
    .modal-body::-webkit-scrollbar { width: 4px; }
    .modal-body::-webkit-scrollbar-thumb { background: var(--border); border-radius: 8px; }

    .mlabel { display:block; font-size:11px; font-weight:700; color:var(--gray); letter-spacing:.7px; text-transform:uppercase; margin-bottom:6px; }

    .minput, .mselect, .mtextarea {
        width: 100%; padding: 11px 14px;
        border: 1.5px solid var(--border); border-radius: 11px;
        font-size: 14px; color: var(--dark);
        background: var(--light); outline: none;
        transition: all .22s; font-family: inherit; margin-bottom: 14px;
    }
    .mtextarea { resize: vertical; min-height: 88px; }
    .minput::placeholder, .mtextarea::placeholder { color: #9bb5bc; }
    .minput:hover, .mselect:hover, .mtextarea:hover { border-color: #9dd4dc; }
    .minput:focus, .mselect:focus, .mtextarea:focus { border-color: var(--cyan); background: #fff; box-shadow: 0 0 0 4px rgba(0,188,212,.1); }

    .mrow { display: grid; grid-template-columns: 1fr 1fr; gap: 12px; }

    .mhint { background: var(--light); border: 1.5px solid var(--border); border-radius: 10px; padding: 11px 14px; font-size: 12px; color: var(--gray); line-height: 1.65; margin-bottom: 14px; }
    .mhint strong { color: var(--dark); }

    .modal-foot { display:flex; align-items:center; justify-content:space-between; padding:14px 22px 18px; border-top:1.5px solid var(--border); background: var(--light); }
    .modal-foot-r { display:flex; gap:8px; }

    .tv-title { font-family:'Sora',sans-serif; font-size:18px; font-weight:800; color:var(--dark); letter-spacing:-.4px; line-height:1.3; margin-bottom:14px; }
    .tv-label { display:flex; align-items:center; gap:6px; font-size:11px; font-weight:700; color:var(--gray); text-transform:uppercase; letter-spacing:.7px; margin-bottom:6px; }
    .tv-label i { color:var(--cyan); }
    .tv-text  { font-size:14px; color:var(--gray); line-height:1.7; }
    .tv-grid  { display:grid; grid-template-columns:repeat(3,1fr); gap:12px; margin:14px 0; }
    .tv-info-row { display:flex; align-items:center; gap:8px; padding:9px 0; border-bottom:1px solid var(--border); font-size:13px; }
    .tv-info-row:last-child { border-bottom: none; }
    .tv-info-row i { color:var(--cyan); width:15px; flex-shrink:0; }
    .tv-info-lbl { color:var(--gray); width:68px; flex-shrink:0; }
    .tv-info-val { color:var(--dark); font-weight:600; }

    .tv-part-row { display:flex; align-items:center; gap:8px; padding:7px 0; border-bottom:1px solid var(--border); font-size:13px; color:var(--dark); }
    .tv-part-row:last-child { border-bottom: none; }
    .tv-part-ava { width:26px; height:26px; border-radius:7px; background:var(--cyan-light); display:flex; align-items:center; justify-content:center; font-size:12px; color:var(--cyan); flex-shrink:0; }

    .tv-comment { display:flex; gap:10px; padding:10px 0; border-bottom:1px solid var(--border); }
    .tv-comment:last-child { border-bottom: none; }
    .tv-c-ava { width:28px; height:28px; border-radius:8px; background:var(--cyan-light); display:flex; align-items:center; justify-content:center; font-size:13px; color:var(--cyan); flex-shrink:0; }
    .tv-c-author { font-size:12px; font-weight:700; color:var(--dark); }
    .tv-c-text   { font-size:13px; color:var(--gray); margin-top:2px; line-height:1.5; }
    .tv-c-time   { font-size:11px; color:#9bb5bc; margin-top:3px; }

    @keyframes fadeUp  { from { opacity:0; transform:translateY(18px) } to { opacity:1; transform:translateY(0) } }
    @keyframes slideIn { from { opacity:0; transform:translateX(28px) } to { opacity:1; transform:translateX(0) } }

    @media (max-width: 860px) {
        .pd-layout { grid-template-columns: 1fr; }
        .pd-header { flex-direction: column; align-items: flex-start; padding: 22px; }
        .tv-grid   { grid-template-columns: 1fr 1fr; }
    }
</style>

<script>
    const csrfParam = '${_csrf.parameterName}';
    const csrfToken = '${_csrf.token}';
    const projectId  = '${project.id}';
</script>

<div class="pd">

    <#if successMessage??>
    <div class="flash flash-ok">
        <i class="bi bi-check-circle-fill"></i>
        <span>${successMessage}</span>
        <button class="flash-close" onclick="closeFlash(this)"><i class="bi bi-x"></i></button>
    </div>
</#if>
<#if errorMessage??>
<div class="flash flash-err">
    <i class="bi bi-exclamation-circle-fill"></i>
    <span>${errorMessage}</span>
    <button class="flash-close" onclick="closeFlash(this)"><i class="bi bi-x"></i></button>
</div>
</#if>

<div class="pd-header">
    <div class="pd-header-grid"></div>
    <div class="pd-header-left">
        <a href="/profile/main" class="pd-back"><i class="bi bi-arrow-left"></i> Мои проекты</a>
        <div class="pd-title">
            <div class="pd-title-icon"><i class="bi bi-kanban-fill"></i></div>
            ${project.name}
        </div>
    </div>
    <div class="pd-header-right">
        <button class="btn btn-ghost" onclick="openModal('addMemberModal')">
            <i class="bi bi-person-plus-fill"></i> Участник
        </button>
        <button class="btn btn-ghost" onclick="openModal('addColumnModal')">
            <i class="bi bi-layout-three-columns"></i> Колонка
        </button>
        <button class="btn btn-cyan" onclick="openCreateTaskModal()">
            <i class="bi bi-plus-lg"></i> Задача
        </button>
    </div>
</div>

<div class="pd-layout">

    <div>
        <div class="pd-card">
            <div class="pd-card-head">
                <i class="bi bi-people-fill"></i> Участники
                <span class="count"><#if project.members??>${project.members?size}<#else>0</#if></span>
            </div>
            <#if project.members?? && project.members?has_content>
            <#list project.members as member>
            <div class="member-row">
                <#if member.avatarUrl?? && member.avatarUrl?has_content>
                <img src="/photo/${member.avatarUrl}" alt="${member.name}" class="m-ava">
                <#else>
                <div class="m-ava-ph"><i class="bi bi-person-fill"></i></div>
            </#if>
            <div style="flex:1;min-width:0">
                <div class="m-name">${member.name}</div>
                <div class="m-role">${member.role}</div>
            </div>
            <span class="m-badge <#if member.role=='LEADER'>mb-leader<#elseif member.role=='MEMBER'>mb-member<#else>mb-viewer</#if>">
                            ${member.role}
                        </span>
        </div>
    </#list>
    <#else>
    <div style="padding:22px 16px;text-align:center;color:var(--gray)">
        <i class="bi bi-person-x" style="font-size:26px;color:#c5d9df;display:block;margin-bottom:6px"></i>
        <div style="font-size:12px">Нет участников</div>
    </div>
</#if>
<button class="card-add-btn" onclick="openModal('addMemberModal')">
    <i class="bi bi-plus-lg"></i> Добавить
</button>
</div>

<div class="pd-card">
    <div class="pd-card-head"><i class="bi bi-bar-chart-fill"></i> Статистика</div>
    <div class="info-row">
        <i class="bi bi-layout-three-columns"></i>
        <span class="info-lbl">Колонок</span>
        <span class="info-val"><#if project.columnDto??>${project.columnDto?size}<#else>0</#if></span>
    </div>
    <div class="info-row">
        <i class="bi bi-list-check"></i>
        <span class="info-lbl">Задач</span>
        <span class="info-val">
                        <#assign tc=0>
                        <#if project.columnDto?? && project.columnDto?has_content>
                            <#list project.columnDto as c><#if c.taskDtos??><#assign tc=tc+c.taskDtos?size></#if></#list>
</#if>
${tc}
</span>
</div>
<div class="info-row">
    <i class="bi bi-people"></i>
    <span class="info-lbl">Участников</span>
    <span class="info-val"><#if project.members??>${project.members?size}<#else>0</#if></span>
</div>
<div class="info-row">
    <i class="bi bi-check2-circle"></i>
    <span class="info-lbl">Завершено</span>
    <span class="info-val" style="color:#16a34a">
                        <#assign done=0>
                        <#if project.columnDto?? && project.columnDto?has_content>
                            <#list project.columnDto as c>
                                <#if c.taskDtos?? && c.taskDtos?has_content>
                                    <#list c.taskDtos as t><#if t.status?? && t.status=='COMPLETED'><#assign done=done+1></#if></#list>
</#if>
</#list>
</#if>
${done}
</span>
</div>
</div>
</div>

<div>
    <div class="kanban-topbar">
        <div class="kanban-title">
            <i class="bi bi-kanban-fill"></i>
            Доска задач
        </div>
    </div>

    <#if project.columnDto?? && project.columnDto?has_content>
    <div class="kanban-scroll">
        <div class="kanban-cols">
            <#list project.columnDto as column>
            <div class="kol">
                <div class="kol-head">
                    <div class="kol-head-l">
                        <div class="kol-dot"></div>
                        <div class="kol-name">${column.name}</div>
                    </div>
                    <div style="display:flex;align-items:center;gap:5px">
                        <span class="kol-cnt"><#if column.taskDtos??>${column.taskDtos?size}<#else>0</#if></span>
                        <button class="kol-edit"
                                onclick="openEditColumnModal(${column.id},'${column.name?js_string}')"
                                title="Редактировать">
                            <i class="bi bi-pencil-fill"></i>
                        </button>
                    </div>
                </div>

                <div class="kol-body">
                    <#if column.taskDtos?? && column.taskDtos?has_content>
                    <#list column.taskDtos as task>
                    <div class="task-card" onclick="openTaskDetail(${task.id})">
                        <div class="tc-name">${task.name}</div>
                        <#if task.priority?? || task.status??>
                        <div class="tc-badges">
                            <#if task.priority??><span class="badge p-${task.priority?lower_case}">${task.priority}</span></#if>
                        <#if task.status??><span class="badge s-${task.status?lower_case?replace(' ','_')}">${task.status}</span></#if>
                </div>
            </#if>
            <div class="tc-foot">
                <div class="tc-foot-l">
                    <#if task.author??>
                    <#if task.author.avatar?? && task.author.avatar?has_content>
                    <img src="/photo/${task.author.avatar}" class="tc-ava" alt="">
                    <#else>
                    <div class="tc-ava-ph"><i class="bi bi-person-fill"></i></div>
                </#if>
                <span class="tc-author">${task.author.name}</span>
            </#if>
        </div>
        <div class="tc-foot-r">
            <#if task.participants?? && task.participants?has_content>
            <div class="tc-parts">
                <#list task.participants as p>
                <#if p_index < 3>
                <#if p.avatar?? && p.avatar?has_content>
                <img src="${p.avatar}" class="tc-part-ava" title="${p.name}" alt="">
                <#else>
                <div class="tc-part-ph" title="${p.name}"><i class="bi bi-person-fill"></i></div>
            </#if>
        </#if>
    </#list>
</div>
</#if>
<#if task.comments?? && task.comments?has_content>
<div class="tc-comments">
    <i class="bi bi-chat-fill"></i> ${task.comments?size}
</div>
</#if>
</div>
</div>
</div>
</#list>
<#else>
<div class="kol-empty">
    <i class="bi bi-inbox"></i>
    <p>Пусто</p>
</div>
</#if>
</div>

<div class="kol-foot">
    <button class="kol-add" onclick="openCreateTaskModal(${column.id})">
        <i class="bi bi-plus-lg"></i> Добавить задачу
    </button>
</div>
</div>
</#list>

<button class="kol-new" onclick="openModal('addColumnModal')">
    <i class="bi bi-plus-square"></i>
    <span>Новая колонка</span>
</button>
</div>
</div>
<#else>
<div class="board-empty">
    <i class="bi bi-columns-gap"></i>
    <h3>Нет колонок</h3>
    <p>Создайте первую колонку, чтобы начать работу над проектом</p>
    <button class="btn btn-cyan" onclick="openModal('addColumnModal')">
        <i class="bi bi-plus-square-fill"></i> Добавить колонку
    </button>
</div>
</#if>
</div>

</div>
</div>


<div id="createTaskModal" class="modal-overlay" onclick="closeModal('createTaskModal',event)">
    <div class="modal-box" onclick="event.stopPropagation()">
        <div class="modal-head">
            <div class="modal-head-title"><i class="bi bi-plus-circle-fill"></i> Создать задачу</div>
            <button class="modal-x" onclick="closeModal('createTaskModal')"><i class="bi bi-x"></i></button>
        </div>
        <form action="/tasks/create" method="post">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <div class="modal-body">
                <label class="mlabel">Название</label>
                <input type="text" id="ctName" name="name" class="minput" placeholder="Введите название задачи..." required autocomplete="off">

                <label class="mlabel">Описание</label>
                <textarea name="description" class="mtextarea" placeholder="Описание (необязательно)"></textarea>

                <div class="mrow">
                    <div>
                        <label class="mlabel">Приоритет</label>
                        <select name="priority" class="mselect">
                            <option value="LOW">Низкий</option>
                            <option value="MEDIUM" selected>Средний</option>
                            <option value="HIGH">Высокий</option>
                            <option value="URGENT">Срочный</option>
                        </select>
                    </div>
                    <div>
                        <label class="mlabel">Колонка</label>
                        <select id="ctCol" name="columnId" class="mselect" required>
                            <#if project.columnDto?? && project.columnDto?has_content>
                            <#list project.columnDto as col>
                            <option value="${col.id}">${col.name}</option>
                        </#list>
                    </#if>
                    </select>
                </div>
            </div>
    </div>
    <div class="modal-foot">
        <div></div>
        <div class="modal-foot-r">
            <button type="button" class="btn btn-light" onclick="closeModal('createTaskModal')">Отмена</button>
            <button type="submit" class="btn btn-cyan"><i class="bi bi-check-lg"></i> Создать</button>
        </div>
    </div>
    </form>
</div>
</div>

<div id="addColumnModal" class="modal-overlay" onclick="closeModal('addColumnModal',event)">
    <div class="modal-box" onclick="event.stopPropagation()">
        <div class="modal-head">
            <div class="modal-head-title"><i class="bi bi-layout-three-columns"></i> Новая колонка</div>
            <button class="modal-x" onclick="closeModal('addColumnModal')"><i class="bi bi-x"></i></button>
        </div>
        <form action="/columns/create" method="post">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <input type="hidden" name="projectId" value="${project.id}"/>
            <div class="modal-body">
                <label class="mlabel">Название колонки</label>
                <input type="text" id="colName" name="name" class="minput" placeholder="Например: В работе..." required autocomplete="off">
            </div>
            <div class="modal-foot">
                <div></div>
                <div class="modal-foot-r">
                    <button type="button" class="btn btn-light" onclick="closeModal('addColumnModal')">Отмена</button>
                    <button type="submit" class="btn btn-cyan"><i class="bi bi-check-lg"></i> Создать</button>
                </div>
            </div>
        </form>
    </div>
</div>

<div id="editColumnModal" class="modal-overlay" onclick="closeModal('editColumnModal',event)">
    <div class="modal-box" onclick="event.stopPropagation()">
        <div class="modal-head">
            <div class="modal-head-title"><i class="bi bi-pencil-fill"></i> Редактировать колонку</div>
            <button class="modal-x" onclick="closeModal('editColumnModal')"><i class="bi bi-x"></i></button>
        </div>
        <form action="/columns/edit" method="post">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <input type="hidden" name="projectId" value="${project.id}"/>
            <input type="hidden" id="ecId" name="id" value="">
            <div class="modal-body">
                <label class="mlabel">Название колонки</label>
                <input type="text" id="ecName" name="name" class="minput" placeholder="Новое название..." required autocomplete="off">
            </div>
            <div class="modal-foot">
                <button type="button" class="btn btn-red btn-sm" onclick="deleteColumn()">
                    <i class="bi bi-trash-fill"></i> Удалить
                </button>
                <div class="modal-foot-r">
                    <button type="button" class="btn btn-light" onclick="closeModal('editColumnModal')">Отмена</button>
                    <button type="submit" class="btn btn-cyan"><i class="bi bi-check-lg"></i> Сохранить</button>
                </div>
            </div>
        </form>
    </div>
</div>

<div id="addMemberModal" class="modal-overlay" onclick="closeModal('addMemberModal',event)">
    <div class="modal-box" onclick="event.stopPropagation()">
        <div class="modal-head">
            <div class="modal-head-title"><i class="bi bi-person-plus-fill"></i> Добавить участника</div>
            <button class="modal-x" onclick="closeModal('addMemberModal')"><i class="bi bi-x"></i></button>
        </div>
        <form action="/project/member/add" method="post">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <input type="hidden" name="projectId" value="${project.id}"/>
            <div class="modal-body">
                <label class="mlabel">Email участника</label>
                <input type="email" name="email" class="minput" placeholder="example@email.com" required autocomplete="off">
                <label class="mlabel">Роль</label>
                <select name="role" class="mselect" required>
                    <option value="" disabled selected>Выберите роль...</option>
                    <option value="MEMBER">Участник</option>
                    <option value="VIEWER">Наблюдатель</option>
                </select>
                <div class="mhint">
                    <strong>Участник</strong> — создаёт и редактирует задачи<br>
                    <strong>Наблюдатель</strong> — только просмотр
                </div>
            </div>
            <div class="modal-foot">
                <div></div>
                <div class="modal-foot-r">
                    <button type="button" class="btn btn-light" onclick="closeModal('addMemberModal')">Отмена</button>
                    <button type="submit" class="btn btn-cyan"><i class="bi bi-check-lg"></i> Добавить</button>
                </div>
            </div>
        </form>
    </div>
</div>

<div id="taskDetailModal" class="modal-overlay" onclick="closeModal('taskDetailModal',event)">
    <div class="modal-box modal-box-lg" onclick="event.stopPropagation()">
        <div class="modal-head">
            <div class="modal-head-title"><i class="bi bi-card-checklist"></i> <span id="tdTitle">Задача</span></div>
            <button class="modal-x" onclick="closeModal('taskDetailModal')"><i class="bi bi-x"></i></button>
        </div>

        <div id="tvMode" class="modal-body">
            <div id="tvName" class="tv-title"></div>
            <div class="tv-label"><i class="bi bi-text-paragraph"></i> Описание</div>
            <div id="tvDesc" class="tv-text" style="margin-bottom:14px"></div>
            <div class="tv-grid">
                <div>
                    <div class="tv-label"><i class="bi bi-flag-fill"></i> Приоритет</div>
                    <span id="tvPriority" class="badge"></span>
                </div>
                <div>
                    <div class="tv-label"><i class="bi bi-hourglass-split"></i> Статус</div>
                    <span id="tvStatus" class="badge"></span>
                </div>
                <div>
                    <div class="tv-label"><i class="bi bi-columns-gap"></i> Колонка</div>
                    <span id="tvColumn" class="tv-text"></span>
                </div>
            </div>
            <div id="tvMeta">
                <div class="tv-info-row">
                    <i class="bi bi-person-fill"></i>
                    <span class="tv-info-lbl">Автор</span>
                    <span id="tvAuthor" class="tv-info-val"></span>
                </div>
                <div class="tv-info-row">
                    <i class="bi bi-calendar-fill"></i>
                    <span class="tv-info-lbl">Создано</span>
                    <span id="tvCreated" class="tv-info-val"></span>
                </div>
            </div>
            <div id="tvParticipantsWrap" style="display:none;margin-top:14px">
                <div class="tv-label"><i class="bi bi-people-fill"></i> Участники</div>
                <div id="tvParticipants"></div>
            </div>
            <div id="tvCommentsWrap" style="display:none;margin-top:14px">
                <div class="tv-label">
                    <i class="bi bi-chat-left-text-fill"></i> Комментарии
                    <span id="tvCommCnt" style="margin-left:6px;background:var(--cyan-light);color:var(--cyan-dark);font-size:11px;border-radius:5px;padding:1px 7px;font-weight:700"></span>
                </div>
                <div id="tvComments"></div>
            </div>
        </div>

        <form id="teForm" action="/tasks/edit" method="post" style="display:none">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <input type="hidden" id="teId" name="taskId" value="">
            <input type="hidden" name="projectId" value="${project.id}">
            <div class="modal-body">
                <label class="mlabel">Название</label>
                <input type="text" id="teName" name="name" class="minput" required autocomplete="off">
                <label class="mlabel">Описание</label>
                <textarea id="teDesc" name="description" class="mtextarea"></textarea>
                <div class="mrow">
                    <div>
                        <label class="mlabel">Приоритет</label>
                        <select id="tePriority" name="priority" class="mselect">
                            <option value="LOW">Низкий</option>
                            <option value="MEDIUM">Средний</option>
                            <option value="HIGH">Высокий</option>
                            <option value="URGENT">Срочный</option>
                        </select>
                    </div>
                    <div>
                        <label class="mlabel">Статус</label>
                        <select id="teStatus" name="status" class="mselect">
                            <option value="PENDING">Ожидает</option>
                            <option value="IN_PROGRESS">В процессе</option>
                            <option value="COMPLETED">Завершено</option>
                        </select>
                    </div>
                </div>
                <label class="mlabel">Колонка</label>
                <select id="teColumn" name="columnId" class="mselect" required>
                    <#if project.columnDto?? && project.columnDto?has_content>
                    <#list project.columnDto as col>
                    <option value="${col.id}">${col.name}</option>
                </#list>
            </#if>
            </select>
    </div>
    </form>

    <div id="tvFooter" class="modal-foot">
        <button class="btn btn-red btn-sm" onclick="deleteTask()">
            <i class="bi bi-trash-fill"></i> Удалить
        </button>
        <div class="modal-foot-r">
            <button class="btn btn-light" onclick="closeModal('taskDetailModal')">Закрыть</button>
            <button class="btn btn-cyan" onclick="switchToEdit()">
                <i class="bi bi-pencil-fill"></i> Редактировать
            </button>
        </div>
    </div>

    <div id="teFooter" class="modal-foot" style="display:none">
        <button class="btn btn-red btn-sm" onclick="deleteTask()">
            <i class="bi bi-trash-fill"></i> Удалить
        </button>
        <div class="modal-foot-r">
            <button class="btn btn-light" onclick="switchToView()">Отмена</button>
            <button class="btn btn-cyan" onclick="document.getElementById('teForm').requestSubmit()">
                <i class="bi bi-check-lg"></i> Сохранить
            </button>
        </div>
    </div>

</div>
</div>


<script>
    function openModal(id) {
        document.getElementById(id).classList.add('active');
        document.body.style.overflow = 'hidden';
    }

    function closeModal(id, e) {
        if (e && e.target !== e.currentTarget) return;
        document.getElementById(id).classList.remove('active');
        document.body.style.overflow = '';
    }

    document.addEventListener('keydown', function(e) {
        if (e.key !== 'Escape') return;
        document.querySelectorAll('.modal-overlay.active').forEach(function(m) {
            m.classList.remove('active');
        });
        document.body.style.overflow = '';
    });

    function closeFlash(btn) {
        const el = btn.closest('.flash');
        el.style.opacity = '0';
        el.style.transform = 'translateX(40px)';
        setTimeout(function() { el.remove(); }, 300);
    }

    document.addEventListener('DOMContentLoaded', function() {
        document.querySelectorAll('.flash').forEach(function(el) {
            setTimeout(function() {
                const btn = el.querySelector('.flash-close');
                if (btn) closeFlash(btn);
            }, 5000);
        });
    });

    function openCreateTaskModal(colId) {
        openModal('createTaskModal');
        if (colId) {
            const sel = document.getElementById('ctCol');
            if (sel) sel.value = colId;
        }
        setTimeout(function() {
            const el = document.getElementById('ctName');
            if (el) el.focus();
        }, 110);
    }
    function openEditColumnModal(id, name) {
        document.getElementById('ecId').value  = id;
        document.getElementById('ecName').value = name;
        openModal('editColumnModal');
        setTimeout(function() {
            const el = document.getElementById('ecName');
            if (el) el.focus();
        }, 110);
    }

    function deleteColumn() {
        const colId = document.getElementById('ecId').value;
        if (!colId || !confirm('Удалить колонку и все её задачи?')) return;

        const f = document.createElement('form');
        f.method = 'post';
        f.action = '/columns/delete';
        f.innerHTML =
            '<input type="hidden" name="' + csrfParam + '" value="' + csrfToken + '">' +
            '<input type="hidden" name="id" value="' + colId + '">' +
            '<input type="hidden" name="projectId" value="' + projectId + '">';
        document.body.appendChild(f);
        f.submit();
    }

    let _taskId = null;

    function openTaskDetail(id) {
        _taskId = id;
        switchToView();
        openModal('taskDetailModal');

        fetch('/tasks/' + id)
            .then(function(r) { return r.json(); })
            .then(function(t) {
                document.getElementById('tdTitle').textContent  = t.name || '';
                document.getElementById('tvName').textContent   = t.name || '';
                document.getElementById('tvDesc').textContent   = t.description || 'Описание не указано';
                document.getElementById('tvColumn').textContent = t.columnName  || '—';
                document.getElementById('tvCreated').textContent= t.createdAt   || '—';
                document.getElementById('tvAuthor').textContent = t.author ? t.author.name : '—';

                const pb = document.getElementById('tvPriority');
                pb.textContent = t.priority || '—';
                pb.className   = 'badge p-' + (t.priority || 'low').toLowerCase();

                const sb = document.getElementById('tvStatus');
                sb.textContent = t.status || '—';
                sb.className   = 'badge s-' + (t.status || 'pending').toLowerCase().replace(/\s+/g, '_');

                const pw = document.getElementById('tvParticipantsWrap');
                const pc = document.getElementById('tvParticipants');
                if (t.participants && t.participants.length) {
                    pc.innerHTML = t.participants.map(function(p) {
                        return '<div class="tv-part-row">' +
                               '<div class="tv-part-ava"><i class="bi bi-person-fill"></i></div>' +
                               escapeHtml(p.name) +
                               '</div>';
                    }).join('');
                    pw.style.display = '';
                } else {
                    pw.style.display = 'none';
                }

                const cw = document.getElementById('tvCommentsWrap');
                const cc = document.getElementById('tvComments');
                if (t.comments && t.comments.length) {
                    document.getElementById('tvCommCnt').textContent = t.comments.length;
                    cc.innerHTML = t.comments.map(function(c) {
                        return '<div class="tv-comment">' +
                               '<div class="tv-c-ava"><i class="bi bi-person-fill"></i></div>' +
                               '<div>' +
                               '<div class="tv-c-author">' + escapeHtml(c.author) + '</div>' +
                               '<div class="tv-c-text">'   + escapeHtml(c.text)   + '</div>' +
                               '<div class="tv-c-time">'   + escapeHtml(c.createdAt || '') + '</div>' +
                               '</div></div>';
                    }).join('');
                    cw.style.display = '';
                } else {
                    cw.style.display = 'none';
                }

                /* prefill edit form */
                document.getElementById('teId').value    = t.id;
                document.getElementById('teName').value  = t.name || '';
                document.getElementById('teDesc').value  = t.description || '';
                if (t.priority)  document.getElementById('tePriority').value = t.priority;
                if (t.status)    document.getElementById('teStatus').value   = t.status;
                if (t.columnId)  document.getElementById('teColumn').value   = t.columnId;
            })
            .catch(function(err) { console.warn('Task fetch error:', err); });
    }

    function switchToView() {
        document.getElementById('tvMode').style.display    = '';
        document.getElementById('teForm').style.display    = 'none';
        document.getElementById('tvFooter').style.display  = '';
        document.getElementById('teFooter').style.display  = 'none';
    }

    function switchToEdit() {
        document.getElementById('tvMode').style.display    = 'none';
        document.getElementById('teForm').style.display    = '';
        document.getElementById('tvFooter').style.display  = 'none';
        document.getElementById('teFooter').style.display  = '';
        setTimeout(function() {
            const el = document.getElementById('teName');
            if (el) el.focus();
        }, 80);
    }

    function deleteTask() {
        if (!_taskId || !confirm('Удалить задачу?')) return;

        const f = document.createElement('form');
        f.method = 'post';
        f.action = '/tasks/delete';
        f.innerHTML =
            '<input type="hidden" name="' + csrfParam + '" value="' + csrfToken + '">' +
            '<input type="hidden" name="taskId" value="' + _taskId + '">' +
            '<input type="hidden" name="projectId" value="' + projectId + '">';
        document.body.appendChild(f);
        f.submit();
    }

    function escapeHtml(str) {
        if (!str) return '';
        return String(str)
            .replace(/&/g, '&amp;')
            .replace(/</g, '&lt;')
            .replace(/>/g, '&gt;')
            .replace(/"/g, '&quot;');
    }
</script>

</@main.layout>
