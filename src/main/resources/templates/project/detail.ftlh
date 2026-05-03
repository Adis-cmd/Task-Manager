<#import "../layout.ftlh" as main>
<@main.layout>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Sora:wght@400;500;600;700;800&display=swap" rel="stylesheet">

<style>
    :root {
        /* ── LIGHT ZONE (header, sidebar, modals) ── */
        --light-bg:       #f4f6fb;
        --light-surface:  #ffffff;
        --light-surface2: #f8faff;
        --light-border:   #e2e8f4;
        --light-border2:  #cbd5e8;
        --light-text:     #1a2236;
        --light-text-muted: #64748b;
        --light-text-dim:   #94a3b8;

        /* ── DARK ZONE (kanban columns + cards) ── */
        --dk-bg:       #0d1117;
        --dk-surface:  #161b22;
        --dk-surface2: #1c2230;
        --dk-surface3: #21283a;
        --dk-border:   rgba(255,255,255,.07);
        --dk-border2:  rgba(255,255,255,.12);
        --dk-text:     #e6edf3;
        --dk-muted:    #7d8590;
        --dk-dim:      #4a5568;

        /* ── ACCENTS ── */
        --cyan:       #00bcd4;
        --cyan-dark:  #0097a7;
        --cyan-glow:  rgba(0,188,212,.22);
        --green:      #22c55e;
        --green-bg:   rgba(34,197,94,.13);
        --blue:       #3b82f6;
        --blue-bg:    rgba(59,130,246,.13);
        --orange:     #f59e0b;
        --orange-bg:  rgba(245,158,11,.13);
        --purple:     #a855f7;
        --purple-bg:  rgba(168,85,247,.13);
        --red:        #ef4444;
        --red-bg:     rgba(239,68,68,.13);

        --r:   14px;
        --r-sm: 9px;
        --shadow-light: 0 4px 24px rgba(100,116,139,.12);
        --shadow-dark:  0 8px 32px rgba(0,0,0,.4);
    }

    *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

    html, body {
        height: 100%; overflow: hidden;
        background: var(--light-bg);
        font-family: 'Sora', sans-serif;
        color: var(--light-text);
    }

    /* ══════════════════════════════════════
       ROOT LAYOUT
    ══════════════════════════════════════ */
    .pd {
        display: flex; flex-direction: column;
        height: 100vh; padding: 14px;
        overflow: hidden; gap: 14px;
    }

    .pd-header {
        background: var(--light-surface);
        border: 1px solid var(--light-border);
        border-radius: 18px;
        padding: 18px 24px;
        display: flex; align-items: center;
        justify-content: space-between; gap: 16px;
        flex-shrink: 0;
        box-shadow: var(--shadow-light);
        animation: fadeDown .4s ease both;
    }
    .pd-back {
        display: inline-flex; align-items: center; gap: 5px;
        font-size: 11px; font-weight: 600; letter-spacing: .5px;
        color: var(--light-text-muted); text-decoration: none;
        text-transform: uppercase; transition: color .2s;
        margin-bottom: 6px;
    }
    .pd-back:hover { color: var(--cyan); }
    .pd-back i { font-size: 12px; }
    .pd-title {
        font-size: 20px; font-weight: 800; color: var(--light-text);
        letter-spacing: -.5px;
        display: flex; align-items: center; gap: 10px;
    }
    .pd-title-icon {
        width: 34px; height: 34px; border-radius: 10px;
        background: linear-gradient(135deg, #00bcd4, #0097a7);
        display: flex; align-items: center; justify-content: center;
        font-size: 15px; color: #fff; flex-shrink: 0;
        box-shadow: 0 4px 12px var(--cyan-glow);
    }
    .pd-header-right {
        display: flex; gap: 8px; flex-wrap: wrap; align-items: center;
    }

    .btn {
        display: inline-flex; align-items: center; gap: 6px;
        padding: 9px 16px; border-radius: 10px;
        font-size: 12px; font-weight: 700; font-family: 'Sora', sans-serif;
        cursor: pointer; border: none; text-decoration: none;
        transition: all .2s ease; white-space: nowrap;
    }
    .btn-cyan {
        background: linear-gradient(135deg, var(--cyan), var(--cyan-dark));
        color: #fff;
        box-shadow: 0 4px 14px var(--cyan-glow);
    }
    .btn-cyan:hover { transform: translateY(-1px); box-shadow: 0 6px 20px var(--cyan-glow); color: #fff; }
    .btn-ghost {
        background: var(--light-bg);
        border: 1px solid var(--light-border2);
        color: var(--light-text-muted);
    }
    .btn-ghost:hover { background: #e8f0ff; color: var(--cyan); border-color: var(--cyan); }
    .btn-light {
        background: var(--light-bg); color: var(--light-text-muted);
        border: 1px solid var(--light-border2);
    }
    .btn-light:hover { border-color: var(--cyan); color: var(--cyan); }
    .btn-red { background: var(--red-bg); color: var(--red); border: 1px solid rgba(239,68,68,.25); }
    .btn-red:hover { background: var(--red); color: #fff; }
    .btn-sm { padding: 6px 12px; font-size: 11px; border-radius: 8px; }

    .pd-layout {
        display: flex; gap: 14px;
        flex: 1; min-height: 0; overflow: hidden;
        animation: fadeUp .4s .06s ease both;
    }

    .pd-sidebar {
        width: 226px; flex-shrink: 0;
        overflow-y: auto; overflow-x: hidden;
        display: flex; flex-direction: column; gap: 12px;
    }
    .pd-sidebar::-webkit-scrollbar { width: 3px; }
    .pd-sidebar::-webkit-scrollbar-thumb { background: var(--light-border2); border-radius: 10px; }

    .sb-card {
        background: var(--light-surface);
        border: 1px solid var(--light-border);
        border-radius: var(--r);
        overflow: hidden;
        box-shadow: var(--shadow-light);
    }
    .sb-card-head {
        display: flex; align-items: center; gap: 7px;
        padding: 12px 14px;
        border-bottom: 1px solid var(--light-border);
        font-size: 10px; font-weight: 700;
        color: var(--light-text-muted);
        text-transform: uppercase; letter-spacing: .8px;
        background: var(--light-surface2);
    }
    .sb-card-head i { color: var(--cyan); font-size: 12px; }
    .sb-card-head .cnt {
        margin-left: auto; background: rgba(0,188,212,.1);
        color: var(--cyan); border-radius: 5px;
        padding: 1px 7px; font-size: 10px;
    }

    .member-row {
        display: flex; align-items: center; gap: 9px;
        padding: 10px 14px; border-bottom: 1px solid var(--light-border);
        transition: background .15s;
    }
    .member-row:last-child { border-bottom: none; }
    .member-row:hover { background: var(--light-surface2); }
    .m-ava, .m-ava-ph { width: 30px; height: 30px; border-radius: 9px; object-fit: cover; flex-shrink: 0; }
    .m-ava-ph { background: rgba(0,188,212,.1); border: 1px solid rgba(0,188,212,.2); display: flex; align-items: center; justify-content: center; font-size: 13px; color: var(--cyan); }
    .m-name { font-size: 12px; font-weight: 700; color: var(--light-text); }
    .m-role-txt { font-size: 10px; color: var(--light-text-muted); }
    .m-badge { margin-left: auto; flex-shrink: 0; font-size: 9px; font-weight: 700; border-radius: 4px; padding: 2px 6px; text-transform: uppercase; }
    .mb-leader { background: rgba(245,158,11,.13); color: var(--orange); }
    .mb-member { background: rgba(0,188,212,.1); color: var(--cyan); }
    .mb-viewer { background: var(--light-bg); color: var(--light-text-muted); border: 1px solid var(--light-border2); }

    .sb-add-btn {
        width: 100%; padding: 10px 14px;
        display: flex; align-items: center; justify-content: center; gap: 5px;
        background: none; border: none; border-top: 1px solid var(--light-border);
        font-size: 11px; font-weight: 700; color: var(--light-text-muted);
        cursor: pointer; font-family: 'Sora', sans-serif; transition: all .15s;
    }
    .sb-add-btn:hover { background: rgba(0,188,212,.06); color: var(--cyan); }

    .stat-row {
        display: flex; align-items: center; gap: 9px;
        padding: 10px 14px; border-bottom: 1px solid var(--light-border);
        font-size: 12px;
    }
    .stat-row:last-child { border-bottom: none; }
    .stat-row i { color: var(--cyan); font-size: 13px; flex-shrink: 0; }
    .stat-lbl { color: var(--light-text-muted); flex: 1; font-size: 11px; }
    .stat-val { font-weight: 800; color: var(--light-text); font-size: 14px; }


    .pd-kanban-area {
        flex: 1; min-width: 0;
        display: flex; flex-direction: column;
        min-height: 0; overflow: hidden;
        background: #ffffff;
        border-radius: 20px;
        padding: 14px;
        border: 1px solid var(--light-border);
        box-shadow: var(--shadow-light);
    }
    .kanban-topbar {
        display: flex; align-items: center; justify-content: space-between;
        margin-bottom: 12px; flex-shrink: 0;
    }
    .kanban-title {
        font-size: 12px; font-weight: 700; color: var(--light-text-muted);
        display: flex; align-items: center; gap: 7px; text-transform: uppercase; letter-spacing: .8px;
    }
    .kanban-title i { color: var(--cyan); }

    .kanban-nav { display: flex; align-items: center; gap: 6px; }
    .kanban-nav-btn {
        width: 32px; height: 32px; border-radius: 9px;
        background: var(--light-bg); border: 1px solid var(--light-border2);
        display: flex; align-items: center; justify-content: center;
        font-size: 13px; color: var(--light-text-muted);
        cursor: pointer; transition: all .2s;
    }
    .kanban-nav-btn:hover { background: #e8f0ff; color: var(--cyan); border-color: var(--cyan); }
    .kanban-nav-btn:disabled { opacity: .35; pointer-events: none; }
    .kanban-nav-indicator {
        font-size: 10px; font-weight: 700; color: var(--light-text-dim);
        padding: 0 4px;
    }

    .kanban-scroll {
        flex: 1; min-height: 0;
        overflow-x: auto; overflow-y: hidden;
        padding-bottom: 8px;
        height: 0;
        scroll-behavior: smooth;
    }
    .kanban-scroll::-webkit-scrollbar { height: 7px; }
    .kanban-scroll::-webkit-scrollbar-track { background: #eef0f6; border-radius: 10px; }
    .kanban-scroll::-webkit-scrollbar-thumb { background: #c0cce0; border-radius: 10px; }
    .kanban-scroll::-webkit-scrollbar-thumb:hover { background: var(--cyan); }

    .kanban-cols {
        display: flex; flex-direction: row;
        gap: 12px; height: 100%;
        width: max-content;
        align-items: flex-start;
    }

    .kol {
        width: 300px; flex-shrink: 0;
        background: var(--dk-surface);
        border: 1px solid var(--dk-border);
        border-radius: 18px;
        display: flex; flex-direction: column;
        max-height: 100%;
        overflow: hidden;
        position: relative;
        transition: border-color .25s;
    }
    .kol:hover { border-color: var(--dk-border2); }
    .kol::before {
        content: '';
        position: absolute; top: 0; left: 0; right: 0; height: 3px;
        background: linear-gradient(90deg, var(--cyan), var(--blue));
        border-radius: 18px 18px 0 0;
    }

    .kol-head {
        display: flex; align-items: center; justify-content: space-between;
        padding: 16px 16px 12px; flex-shrink: 0;
    }
    .kol-head-l { display: flex; align-items: center; gap: 10px; }
    .kol-icon {
        width: 32px; height: 32px; border-radius: 10px;
        background: rgba(0,188,212,.1);
        border: 1px solid rgba(0,188,212,.2);
        display: flex; align-items: center; justify-content: center;
        font-size: 14px; color: var(--cyan);
    }
    .kol-name { font-size: 14px; font-weight: 700; color: var(--dk-text); }
    .kol-meta { font-size: 11px; color: var(--dk-muted); margin-top: 1px; }
    .kol-head-r { display: flex; align-items: center; gap: 6px; }
    .kol-cnt {
        font-size: 11px; font-weight: 700;
        background: rgba(255,255,255,.07);
        color: var(--dk-muted);
        border-radius: 6px; padding: 3px 9px;
        border: 1px solid var(--dk-border2);
    }
    .kol-edit-btn {
        width: 28px; height: 28px; border-radius: 8px;
        background: none; border: 1px solid var(--dk-border);
        display: flex; align-items: center; justify-content: center;
        font-size: 11px; color: var(--dk-dim);
        cursor: pointer; transition: all .18s;
    }
    .kol-edit-btn:hover { background: rgba(0,188,212,.08); color: var(--cyan); border-color: rgba(0,188,212,.3); }

    .kol-progress { padding: 0 16px 14px; flex-shrink: 0; }
    .kol-progress-label {
        display: flex; justify-content: space-between;
        margin-bottom: 6px; font-size: 10px; color: var(--dk-muted); font-weight: 600;
    }
    .kol-progress-pct { color: var(--cyan); font-weight: 700; }
    .kol-progress-bar { height: 4px; background: rgba(255,255,255,.06); border-radius: 10px; overflow: hidden; }
    .kol-progress-fill {
        height: 100%; border-radius: 10px;
        background: linear-gradient(90deg, var(--cyan), var(--blue));
        transition: width .5s ease;
    }

    .kol-body {
        flex: 1; padding: 0 10px;
        display: flex; flex-direction: column; gap: 6px;
        overflow-y: auto; overflow-x: hidden;
        min-height: 60px;
        max-height: calc(100vh - 260px);
    }
    .kol-body::-webkit-scrollbar { width: 3px; }
    .kol-body::-webkit-scrollbar-thumb { background: var(--dk-border2); border-radius: 10px; }

    .kol-empty { padding: 28px 12px; text-align: center; color: var(--dk-dim); font-size: 12px; }
    .kol-empty i { font-size: 22px; display: block; margin-bottom: 6px; }

    .kol-foot { padding: 10px; flex-shrink: 0; }
    .kol-add-btn {
        width: 100%; padding: 9px;
        display: flex; align-items: center; justify-content: center; gap: 6px;
        background: none; border: 1px dashed rgba(255,255,255,.1);
        border-radius: 10px; font-size: 11px; font-weight: 600;
        color: var(--dk-dim); cursor: pointer; transition: all .2s;
        font-family: 'Sora', sans-serif;
    }
    .kol-add-btn:hover { border-color: var(--cyan); color: var(--cyan); background: rgba(0,188,212,.05); }

    /* ══════════════════════════════════════
       TASK CARD — DARK
    ══════════════════════════════════════ */
    .task-card {
        background: var(--dk-surface2);
        border: 1px solid var(--dk-border);
        border-radius: 12px;
        padding: 13px 14px;
        cursor: pointer;
        transition: all .2s;
        flex-shrink: 0;
    }
    .task-card:hover {
        background: var(--dk-surface3);
        border-color: var(--dk-border2);
        transform: translateY(-2px);
        box-shadow: 0 6px 24px rgba(0,0,0,.35);
    }
    .tc-top { display: flex; align-items: flex-start; gap: 10px; }
    .tc-check {
        width: 18px; height: 18px; border-radius: 5px;
        border: 1.5px solid var(--dk-border2);
        display: flex; align-items: center; justify-content: center;
        flex-shrink: 0; margin-top: 1px; transition: all .2s; background: transparent;
    }
    .task-card.done .tc-check { background: var(--green); border-color: var(--green); }
    .task-card.done .tc-check::after {
        content: '';
        width: 10px; height: 7px;
        border-left: 2px solid #fff; border-bottom: 2px solid #fff;
        transform: rotate(-45deg) translateY(-1px);
    }
    .tc-body { flex: 1; min-width: 0; }
    .tc-name {
        font-size: 13px; font-weight: 600; color: var(--dk-text);
        line-height: 1.4; margin-bottom: 9px;
    }
    .task-card.done .tc-name { color: var(--dk-muted); text-decoration: line-through; text-decoration-color: rgba(255,255,255,.2); }
    .tc-footer { display: flex; align-items: center; justify-content: space-between; }
    .tc-footer-l { display: flex; align-items: center; gap: 6px; flex-wrap: wrap; }
    .tc-footer-r { display: flex; align-items: center; gap: 4px; }

    .tc-status { font-size: 10px; font-weight: 700; padding: 2px 8px; border-radius: 20px; }
    .ts-completed   { background: var(--green-bg); color: var(--green); }
    .ts-in_progress { background: var(--blue-bg); color: var(--blue); }
    .ts-pending     { background: rgba(255,255,255,.06); color: var(--dk-muted); border: 1px solid var(--dk-border2); }

    .tc-priority { font-size: 10px; font-weight: 700; padding: 2px 7px; border-radius: 5px; }
    .tp-low    { background: var(--green-bg); color: var(--green); }
    .tp-medium { background: var(--orange-bg); color: var(--orange); }
    .tp-high   { background: var(--red-bg); color: var(--red); }
    .tp-urgent { background: var(--purple-bg); color: var(--purple); }

    .tc-author-ava, .tc-author-ph { width: 18px; height: 18px; border-radius: 5px; object-fit: cover; flex-shrink: 0; }
    .tc-author-ph { background: rgba(0,188,212,.15); display: flex; align-items: center; justify-content: center; font-size: 9px; color: var(--cyan); }
    .tc-author-name { font-size: 10px; color: var(--dk-muted); }
    .tc-comments { display: flex; align-items: center; gap: 3px; font-size: 10px; color: var(--dk-dim); }

    .kol-new {
        width: 240px; flex-shrink: 0;
        border: 1.5px dashed rgba(255,255,255,.1);
        border-radius: 18px;
        display: flex; align-items: center; justify-content: center;
        flex-direction: column; gap: 8px;
        min-height: 160px; align-self: flex-start;
        cursor: pointer; transition: all .25s;
        background: none; color: var(--dk-dim);
        font-family: 'Sora', sans-serif;
    }
    .kol-new:hover { border-color: var(--cyan); color: var(--cyan); background: rgba(0,188,212,.04); }
    .kol-new i { font-size: 20px; }
    .kol-new span { font-size: 11px; font-weight: 700; }

    .board-empty {
        background: var(--dk-surface); border: 1px dashed var(--dk-border2);
        border-radius: 18px; padding: 72px 32px; text-align: center;
    }
    .board-empty i { font-size: 48px; color: var(--dk-dim); display: block; margin-bottom: 16px; }
    .board-empty h3 { font-size: 18px; font-weight: 700; color: var(--dk-text); margin-bottom: 8px; }
    .board-empty p  { font-size: 13px; color: var(--dk-muted); margin-bottom: 20px; }

    /* ══════════════════════════════════════
       FLASH
    ══════════════════════════════════════ */
    .flash { position: fixed; bottom: 20px; right: 20px; display: flex; align-items: center; gap: 10px; padding: 12px 16px; border-radius: 12px; font-size: 13px; font-weight: 500; z-index: 9999; max-width: 320px; animation: slideIn .3s ease both; transition: opacity .3s, transform .3s; box-shadow: 0 4px 20px rgba(0,0,0,.15); }
    .flash i { font-size: 15px; flex-shrink: 0; }
    .flash-ok  { background: #f0fdf4; border: 1px solid rgba(34,197,94,.3); color: #16a34a; }
    .flash-err { background: #fef2f2; border: 1px solid rgba(239,68,68,.3); color: var(--red); }
    .flash-close { background: none; border: none; color: inherit; cursor: pointer; font-size: 16px; opacity: .5; padding: 0; margin-left: 4px; transition: opacity .2s; }
    .flash-close:hover { opacity: 1; }

    /* ══════════════════════════════════════
       MODALS — LIGHT
    ══════════════════════════════════════ */
    .modal-overlay { position: fixed; inset: 0; background: rgba(15,23,42,.5); backdrop-filter: blur(10px); z-index: 5000; display: flex; align-items: center; justify-content: center; padding: 24px; opacity: 0; pointer-events: none; transition: opacity .25s; }
    .modal-overlay.active { opacity: 1; pointer-events: all; }
    .modal-box { background: var(--light-surface); border: 1px solid var(--light-border); border-radius: 20px; width: 100%; max-width: 460px; box-shadow: 0 24px 60px rgba(15,23,42,.2); overflow: hidden; transform: translateY(14px) scale(.97); transition: transform .25s; }
    .modal-box-lg { max-width: 560px; }
    .modal-overlay.active .modal-box { transform: translateY(0) scale(1); }

    .modal-head { display: flex; align-items: center; justify-content: space-between; padding: 18px 22px 16px; border-bottom: 1px solid var(--light-border); background: var(--light-surface2); }
    .modal-head-title { display: flex; align-items: center; gap: 9px; font-size: 14px; font-weight: 800; color: var(--light-text); }
    .modal-head-title i { color: var(--cyan); font-size: 16px; }
    .modal-x { width: 30px; height: 30px; border-radius: 8px; background: var(--light-bg); border: 1px solid var(--light-border2); display: flex; align-items: center; justify-content: center; font-size: 16px; color: var(--light-text-muted); cursor: pointer; transition: all .2s; }
    .modal-x:hover { background: var(--red-bg); color: var(--red); border-color: rgba(239,68,68,.25); }

    .modal-body { padding: 20px 22px; max-height: 60vh; overflow-y: auto; }
    .modal-body::-webkit-scrollbar { width: 3px; }
    .modal-body::-webkit-scrollbar-thumb { background: var(--light-border2); border-radius: 8px; }

    .mlabel { display: block; font-size: 10px; font-weight: 700; color: var(--light-text-muted); letter-spacing: .7px; text-transform: uppercase; margin-bottom: 6px; }
    .minput, .mselect, .mtextarea {
        width: 100%; padding: 10px 14px;
        border: 1.5px solid var(--light-border2); border-radius: 10px;
        font-size: 13px; color: var(--light-text);
        background: var(--light-surface2); outline: none;
        transition: all .2s; font-family: inherit; margin-bottom: 14px;
    }
    .mtextarea { resize: vertical; min-height: 90px; }
    .minput::placeholder, .mtextarea::placeholder { color: var(--light-text-dim); }
    .minput:focus, .mselect:focus, .mtextarea:focus { border-color: var(--cyan); box-shadow: 0 0 0 3px rgba(0,188,212,.1); background: #fff; }
    .mselect option { background: var(--light-surface); color: var(--light-text); }
    .mrow { display: grid; grid-template-columns: 1fr 1fr; gap: 14px; }
    .mhint { background: rgba(0,188,212,.06); border: 1px solid rgba(0,188,212,.15); border-radius: 10px; padding: 11px 14px; font-size: 11px; color: var(--light-text-muted); line-height: 1.65; margin-bottom: 14px; }
    .mhint strong { color: var(--light-text); }

    .modal-foot { display: flex; align-items: center; justify-content: space-between; padding: 14px 22px 18px; border-top: 1px solid var(--light-border); background: var(--light-surface2); }
    .modal-foot-r { display: flex; gap: 8px; }

    /* ── Task detail view ── */
    .tv-title { font-size: 18px; font-weight: 800; color: var(--light-text); letter-spacing: -.3px; line-height: 1.35; margin-bottom: 16px; }
    .tv-label { display: flex; align-items: center; gap: 5px; font-size: 10px; font-weight: 700; color: var(--light-text-muted); text-transform: uppercase; letter-spacing: .7px; margin-bottom: 6px; }
    .tv-label i { color: var(--cyan); }
    .tv-text  { font-size: 13px; color: var(--light-text-muted); line-height: 1.7; }

    .tv-grid { display: grid; grid-template-columns: repeat(3,1fr); gap: 10px; margin: 14px 0; }
    .tv-grid-cell { background: var(--light-surface2); border: 1px solid var(--light-border); border-radius: 10px; padding: 10px 12px; }

    .tv-info-row { display: flex; align-items: center; gap: 8px; padding: 9px 0; border-bottom: 1px solid var(--light-border); font-size: 12px; }
    .tv-info-row:last-child { border-bottom: none; }
    .tv-info-row i { color: var(--cyan); width: 14px; flex-shrink: 0; }
    .tv-info-lbl { color: var(--light-text-muted); width: 65px; flex-shrink: 0; }
    .tv-info-val { color: var(--light-text); font-weight: 600; }

    .tv-part-row { display: flex; align-items: center; gap: 8px; padding: 7px 0; border-bottom: 1px solid var(--light-border); font-size: 12px; color: var(--light-text); }
    .tv-part-row:last-child { border-bottom: none; }
    .tv-part-ava { width: 26px; height: 26px; border-radius: 7px; background: rgba(0,188,212,.1); display: flex; align-items: center; justify-content: center; font-size: 12px; color: var(--cyan); flex-shrink: 0; border: 1px solid rgba(0,188,212,.2); }

    .tv-comment { display: flex; gap: 10px; padding: 10px 0; border-bottom: 1px solid var(--light-border); }
    .tv-comment:last-child { border-bottom: none; }
    .tv-c-ava { width: 28px; height: 28px; border-radius: 8px; background: rgba(0,188,212,.1); display: flex; align-items: center; justify-content: center; font-size: 13px; color: var(--cyan); flex-shrink: 0; }
    .tv-c-author { font-size: 11px; font-weight: 700; color: var(--light-text); }
    .tv-c-text   { font-size: 12px; color: var(--light-text-muted); margin-top: 2px; line-height: 1.5; }
    .tv-c-time   { font-size: 10px; color: var(--light-text-dim); margin-top: 3px; }

    /* status / priority badges in modal — colored */
    .tc-status { font-size: 11px; font-weight: 700; padding: 3px 10px; border-radius: 20px; }
    .ts-completed   { background: var(--green-bg); color: var(--green); }
    .ts-in_progress { background: var(--blue-bg); color: var(--blue); }
    .ts-pending     { background: var(--orange-bg); color: var(--orange); }
    .tc-priority { font-size: 11px; font-weight: 700; padding: 3px 10px; border-radius: 6px; }
    .tp-low    { background: var(--green-bg); color: var(--green); }
    .tp-medium { background: var(--orange-bg); color: var(--orange); }
    .tp-high   { background: var(--red-bg); color: var(--red); }
    .tp-urgent { background: var(--purple-bg); color: var(--purple); }

    /* ── Edit form section divider ── */
    .edit-section { background: var(--light-surface2); border: 1px solid var(--light-border); border-radius: 12px; padding: 14px 16px; margin-bottom: 14px; }
    .edit-section-title { font-size: 10px; font-weight: 700; color: var(--light-text-muted); text-transform: uppercase; letter-spacing: .7px; margin-bottom: 12px; display: flex; align-items: center; gap: 6px; }
    .edit-section-title i { color: var(--cyan); }
    .edit-section .minput, .edit-section .mselect, .edit-section .mtextarea { margin-bottom: 0; }

    @keyframes fadeUp   { from { opacity:0; transform:translateY(16px) } to { opacity:1; transform:translateY(0) } }
    @keyframes fadeDown { from { opacity:0; transform:translateY(-12px) } to { opacity:1; transform:translateY(0) } }
    @keyframes slideIn  { from { opacity:0; transform:translateX(24px) } to { opacity:1; transform:translateX(0) } }

    @media (max-width: 860px) {
        html, body { height: auto; overflow: auto; }
        .pd { height: auto; overflow: visible; }
        .pd-layout { flex-direction: column; overflow: visible; }
        .pd-sidebar { width: 100%; overflow: visible; }
        .pd-kanban-area { overflow: visible; min-height: 0; border-radius: 16px; }
        .kanban-scroll { overflow-x: auto; overflow-y: visible; height: auto; min-height: 300px; }
        .kanban-cols { height: auto; }
        .kol { max-height: none; }
        .kol-body { max-height: 340px; }
        .pd-header { flex-direction: column; align-items: flex-start; padding: 16px; }
        .tv-grid { grid-template-columns: 1fr 1fr; }
        .mrow { grid-template-columns: 1fr; }
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

<!-- HEADER -->
<div class="pd-header">
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

    <!-- SIDEBAR -->
    <div class="pd-sidebar">
        <div class="sb-card">
            <div class="sb-card-head">
                <i class="bi bi-people-fill"></i> Участники
                <span class="cnt"><#if project.members??>${project.members?size}<#else>0</#if></span>
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
                <div class="m-role-txt">${member.role}</div>
            </div>
            <span class="m-badge <#if member.role=='LEADER'>mb-leader<#elseif member.role=='MEMBER'>mb-member<#else>mb-viewer</#if>">${member.role}</span>
        </div>
    </#list>
    <#else>
    <div style="padding:20px;text-align:center;color:var(--light-text-dim);font-size:11px">
        <i class="bi bi-person-x" style="font-size:22px;display:block;margin-bottom:6px;color:var(--light-text-dim)"></i>
        Нет участников
    </div>
</#if>
<button class="sb-add-btn" onclick="openModal('addMemberModal')"><i class="bi bi-plus-lg"></i> Добавить</button>
</div>

<div class="sb-card">
    <div class="sb-card-head"><i class="bi bi-bar-chart-fill"></i> Статистика</div>
    <div class="stat-row">
        <i class="bi bi-layout-three-columns"></i>
        <span class="stat-lbl">Колонок</span>
        <span class="stat-val"><#if project.columnDto??>${project.columnDto?size}<#else>0</#if></span>
    </div>
    <div class="stat-row">
        <i class="bi bi-list-check"></i>
        <span class="stat-lbl">Задач</span>
        <span class="stat-val">
                        <#assign tc=0>
                        <#if project.columnDto?? && project.columnDto?has_content>
                            <#list project.columnDto as c><#if c.taskDtos??><#assign tc=tc+c.taskDtos?size></#if></#list>
</#if>
${tc}
</span>
</div>
<div class="stat-row">
    <i class="bi bi-people"></i>
    <span class="stat-lbl">Участников</span>
    <span class="stat-val"><#if project.members??>${project.members?size}<#else>0</#if></span>
</div>
<div class="stat-row">
    <i class="bi bi-check2-circle"></i>
    <span class="stat-lbl">Завершено</span>
    <span class="stat-val" style="color:var(--green)">
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
<!-- /Sidebar -->

<!-- KANBAN DARK ZONE -->
<div class="pd-kanban-area">
    <div class="kanban-topbar">
        <div class="kanban-title"><i class="bi bi-kanban-fill"></i> Доска задач</div>
        <!-- ── Навигация по колонкам ── -->
        <div class="kanban-nav">
            <button class="kanban-nav-btn" id="kanbanScrollLeft" onclick="scrollKanban(-312)" title="Прокрутить влево">
                <i class="bi bi-chevron-left"></i>
            </button>
            <span class="kanban-nav-indicator" id="kanbanNavIndicator"></span>
            <button class="kanban-nav-btn" id="kanbanScrollRight" onclick="scrollKanban(312)" title="Прокрутить вправо">
                <i class="bi bi-chevron-right"></i>
            </button>
        </div>
    </div>

    <#if project.columnDto?? && project.columnDto?has_content>
    <div class="kanban-scroll" id="kanbanScroll">
        <div class="kanban-cols">
            <#list project.columnDto as column>
            <#assign colTotal=0>
            <#assign colDone=0>
            <#if column.taskDtos?? && column.taskDtos?has_content>
            <#assign colTotal=column.taskDtos?size>
            <#list column.taskDtos as t>
            <#if t.status?? && t.status=='COMPLETED'><#assign colDone=colDone+1></#if>
    </#list>
</#if>
<#assign colPct=0>
<#if colTotal gt 0><#assign colPct=(colDone * 100 / colTotal)?round></#if>

<div class="kol">
    <div class="kol-head">
        <div class="kol-head-l">
            <div class="kol-icon"><i class="bi bi-collection-fill"></i></div>
            <div>
                <div class="kol-name">${column.name}</div>
                <div class="kol-meta">${colTotal} задач</div>
            </div>
        </div>
        <div class="kol-head-r">
            <span class="kol-cnt">${colTotal}</span>
            <button class="kol-edit-btn" onclick="openEditColumnModal(${column.id},'${column.name?js_string}')" title="Редактировать">
                <i class="bi bi-pencil-fill"></i>
            </button>
        </div>
    </div>

    <#if colTotal gt 0>
    <div class="kol-progress">
        <div class="kol-progress-label">
            <span>Прогресс</span>
            <span class="kol-progress-pct">${colPct}%</span>
        </div>
        <div class="kol-progress-bar">
            <div class="kol-progress-fill" style="width:${colPct}%"></div>
        </div>
    </div>
</#if>

<div class="kol-body" data-column-id="${column.id}">
    <#if column.taskDtos?? && column.taskDtos?has_content>
    <#list column.taskDtos as task>
    <#assign isDone=(task.status?? && (task.status=='COMPLETED'))>
    <div class="task-card ${isDone?then('done','')}" data-task-id="${task.id}" onclick="openTaskDetail(${task.id})">
        <div class="tc-top">
            <div class="tc-check"></div>
            <div class="tc-body">
                <div class="tc-name">${task.name}</div>
                <div class="tc-footer">
                    <div class="tc-footer-l">
                        <#if task.status??>
                        <span class="tc-status ts-${task.status?lower_case?replace(' ','_')}">
                                                        <#switch task.status>
                                                            <#case 'COMPLETED'>Done<#break>
                                                            <#case 'IN_PROGRESS'>In Progress<#break>
                                                            <#case 'PENDING'>Todo<#break>
                                                            <#default>${task.status}
                                                        </#switch>
                        </span>
                    </#if>
                    <#if task.priority??>
                    <span class="tc-priority tp-${task.priority?lower_case}">${task.priority}</span>
                </#if>
            </div>
            <div class="tc-footer-r">
                <#if task.author??>
                <#if task.author.avatar?? && task.author.avatar?has_content>
                <img src="/photo/${task.author.avatar}" class="tc-author-ava" alt="">
                <#else>
                <div class="tc-author-ph"><i class="bi bi-person-fill"></i></div>
            </#if>
        </#if>
        <#if task.comments?? && task.comments?has_content>
        <div class="tc-comments"><i class="bi bi-chat-fill"></i> ${task.comments?size}</div>
    </#if>
</div>
</div>
</div>
</div>
</div>
</#list>
<#else>
<div class="kol-empty"><i class="bi bi-inbox"></i>Пусто</div>
</#if>
</div>

<div class="kol-foot">
    <button class="kol-add-btn" onclick="openCreateTaskModal(${column.id})">
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
    <p>Создайте первую колонку, чтобы начать работу</p>
    <button class="btn btn-cyan" onclick="openModal('addColumnModal')"><i class="bi bi-plus-square-fill"></i> Добавить колонку</button>
</div>
</#if>
</div>
<!-- /Kanban -->

</div>
</div>


<!-- ══ MODAL: Создать задачу ══ -->
<div id="createTaskModal" class="modal-overlay" onclick="closeModal('createTaskModal',event)">
    <div class="modal-box" onclick="event.stopPropagation()">
        <div class="modal-head">
            <div class="modal-head-title"><i class="bi bi-plus-circle-fill"></i> Создать задачу</div>
            <button class="modal-x" onclick="closeModal('createTaskModal')"><i class="bi bi-x"></i></button>
        </div>
        <form action="/tasks/create" method="post">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <input type="hidden" name="projectId" value="${project.id}"/>
            <div class="modal-body">
                <div class="edit-section" style="margin-bottom:14px">
                    <div class="edit-section-title"><i class="bi bi-card-text"></i> Основное</div>
                    <label class="mlabel">Название</label>
                    <input type="text" id="ctName" name="name" class="minput" placeholder="Название задачи..." required autocomplete="off" style="margin-bottom:12px">
                    <label class="mlabel">Описание</label>
                    <textarea name="description" class="mtextarea" placeholder="Подробное описание задачи..."></textarea>
                </div>
                <div class="edit-section">
                    <div class="edit-section-title"><i class="bi bi-sliders"></i> Параметры</div>
                    <div class="mrow">
                        <div>
                            <label class="mlabel">Приоритет</label>
                            <select name="priority" class="mselect">
                                <option value="LOW">🟢 Низкий</option>
                                <option value="MEDIUM" selected>🟡 Средний</option>
                                <option value="HIGH">🔴 Высокий</option>
                                <option value="URGENT">🟣 Срочный</option>
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
    </div>
    <div class="modal-foot">
        <div></div>
        <div class="modal-foot-r">
            <button type="button" class="btn btn-light" onclick="closeModal('createTaskModal')">Отмена</button>
            <button type="submit" class="btn btn-cyan"><i class="bi bi-check-lg"></i> Создать задачу</button>
        </div>
    </div>
    </form>
</div>
</div>

<!-- ══ MODAL: Добавить колонку ══ -->
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

<!-- ══ MODAL: Редактировать колонку ══ -->
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
                <button type="button" class="btn btn-red btn-sm" onclick="deleteColumn()"><i class="bi bi-trash-fill"></i> Удалить</button>
                <div class="modal-foot-r">
                    <button type="button" class="btn btn-light" onclick="closeModal('editColumnModal')">Отмена</button>
                    <button type="submit" class="btn btn-cyan"><i class="bi bi-check-lg"></i> Сохранить</button>
                </div>
            </div>
        </form>
    </div>
</div>

<!-- ══ MODAL: Добавить участника ══ -->
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
                    <option value="MEMBER">Участник — создаёт и редактирует задачи</option>
                    <option value="VIEWER">Наблюдатель — только просмотр</option>
                </select>
                <div class="mhint">
                    <strong>Участник</strong> — может создавать, редактировать и комментировать задачи<br>
                    <strong>Наблюдатель</strong> — только просматривает доску без возможности изменений
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

<!-- ══ MODAL: Просмотр / редактирование задачи ══ -->
<div id="taskDetailModal" class="modal-overlay" onclick="closeModal('taskDetailModal',event)">
    <div class="modal-box modal-box-lg" onclick="event.stopPropagation()">

        <!-- VIEW header -->
        <div id="tvHeader" class="modal-head">
            <div class="modal-head-title"><i class="bi bi-card-checklist"></i> <span id="tdTitle">Задача</span></div>
            <div style="display:flex;gap:6px;align-items:center">
                <button class="btn btn-ghost btn-sm" onclick="switchToEdit()"><i class="bi bi-pencil-fill"></i> Изменить</button>
                <button class="modal-x" onclick="closeModal('taskDetailModal')"><i class="bi bi-x"></i></button>
            </div>
        </div>

        <!-- EDIT header -->
        <div id="teHeader" class="modal-head" style="display:none">
            <div class="modal-head-title"><i class="bi bi-pencil-fill"></i> Редактирование задачи</div>
            <button class="modal-x" onclick="switchToView()"><i class="bi bi-x"></i></button>
        </div>

        <!-- VIEW MODE body -->
        <div id="tvMode" class="modal-body">
            <div id="tvName" class="tv-title"></div>

            <div class="tv-label"><i class="bi bi-text-paragraph"></i> Описание</div>
            <div id="tvDesc" class="tv-text" style="margin-bottom:16px;padding:10px 12px;background:var(--light-surface2);border:1px solid var(--light-border);border-radius:10px;min-height:44px"></div>

            <div class="tv-grid">
                <div class="tv-grid-cell">
                    <div class="tv-label"><i class="bi bi-flag-fill"></i> Приоритет</div>
                    <span id="tvPriority"></span>
                </div>
                <div class="tv-grid-cell">
                    <div class="tv-label"><i class="bi bi-hourglass-split"></i> Статус</div>
                    <span id="tvStatus"></span>
                </div>
                <div class="tv-grid-cell">
                    <div class="tv-label"><i class="bi bi-columns-gap"></i> Колонка</div>
                    <span id="tvColumn" class="tv-text" style="font-weight:600;color:var(--light-text)"></span>
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
                <div class="tv-label" style="margin-bottom:8px">
                    <i class="bi bi-chat-left-text-fill"></i> Комментарии
                    <span id="tvCommCnt" style="margin-left:6px;background:rgba(0,188,212,.1);color:var(--cyan);font-size:10px;border-radius:4px;padding:1px 8px;font-weight:700"></span>
                </div>
                <div id="tvComments"></div>
            </div>
        </div>

        <!-- EDIT MODE body — action динамически устанавливается через JS -->
        <form id="teForm" action="/tasks/0" method="post" style="display:none">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <input type="hidden" id="teId" name="taskId" value="">
            <input type="hidden" name="projectId" value="${project.id}">
            <div class="modal-body">
                <div class="edit-section" style="margin-bottom:14px">
                    <div class="edit-section-title"><i class="bi bi-card-text"></i> Основное</div>
                    <label class="mlabel">Название <span style="color:var(--red)">*</span></label>
                    <input type="text" id="teName" name="name" class="minput" required autocomplete="off" style="margin-bottom:12px">
                    <label class="mlabel">Описание</label>
                    <textarea id="teDesc" name="description" class="mtextarea" placeholder="Подробное описание..."></textarea>
                </div>
                <div class="edit-section">
                    <div class="edit-section-title"><i class="bi bi-sliders"></i> Параметры</div>
                    <div class="mrow" style="margin-bottom:12px">
                        <div>
                            <label class="mlabel">Приоритет</label>
                            <select id="tePriority" name="priority" class="mselect" style="margin-bottom:0">
                                <option value="LOW">🟢 Низкий</option>
                                <option value="MEDIUM">🟡 Средний</option>
                                <option value="HIGH">🔴 Высокий</option>
                                <option value="URGENT">🟣 Срочный</option>
                            </select>
                        </div>
                        <div>
                            <label class="mlabel">Статус</label>
                            <select id="teStatus" name="status" class="mselect" style="margin-bottom:0">
                                <option value="PENDING">⏳ Ожидает</option>
                                <option value="IN_PROGRESS">🔄 В процессе</option>
                                <option value="COMPLETED">✅ Завершено</option>
                            </select>
                        </div>
                    </div>
                    <label class="mlabel">Колонка</label>
                    <select id="teColumn" name="columnId" class="mselect" required style="margin-bottom:0">
                        <#if project.columnDto?? && project.columnDto?has_content>
                        <#list project.columnDto as col>
                        <option value="${col.id}">${col.name}</option>
                    </#list>
                </#if>
                </select>
            </div>
    </div>
    </form>

    <!-- VIEW footer -->
    <div id="tvFooter" class="modal-foot">
        <button class="btn btn-red btn-sm" onclick="deleteTask()"><i class="bi bi-trash-fill"></i> Удалить</button>
        <div class="modal-foot-r">
            <button class="btn btn-light" onclick="closeModal('taskDetailModal')">Закрыть</button>
        </div>
    </div>

    <!-- EDIT footer -->
    <div id="teFooter" class="modal-foot" style="display:none">
        <button type="button" class="btn btn-red btn-sm" onclick="deleteTask()"><i class="bi bi-trash-fill"></i> Удалить</button>
        <div class="modal-foot-r">
            <button type="button" class="btn btn-light" onclick="switchToView()"><i class="bi bi-arrow-left"></i> Назад</button>
            <button type="button" class="btn btn-cyan" onclick="saveTask()"><i class="bi bi-check-lg"></i> Сохранить</button>
        </div>
    </div>
</div>
</div>


<script>
    /* ══ Modal helpers ══ */
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
        document.querySelectorAll('.modal-overlay.active').forEach(function(m) { m.classList.remove('active'); });
        document.body.style.overflow = '';
    });

    /* ══ Flash auto-close ══ */
    function closeFlash(btn) {
        var el = btn.closest('.flash');
        el.style.opacity = '0'; el.style.transform = 'translateX(40px)';
        setTimeout(function() { el.remove(); }, 300);
    }
    document.addEventListener('DOMContentLoaded', function() {
        document.querySelectorAll('.flash').forEach(function(el) {
            setTimeout(function() { var b = el.querySelector('.flash-close'); if (b) closeFlash(b); }, 5000);
        });
    });

    /* ══ Create task modal ══ */
    function openCreateTaskModal(colId) {
        openModal('createTaskModal');
        if (colId) { var s = document.getElementById('ctCol'); if (s) s.value = colId; }
        setTimeout(function() { var e = document.getElementById('ctName'); if (e) e.focus(); }, 110);
    }

    /* ══ Column modal ══ */
    function openEditColumnModal(id, name) {
        document.getElementById('ecId').value  = id;
        document.getElementById('ecName').value = name;
        openModal('editColumnModal');
        setTimeout(function() { var e = document.getElementById('ecName'); if (e) e.focus(); }, 110);
    }
    function deleteColumn() {
        var colId = document.getElementById('ecId').value;
        if (!colId || !confirm('Удалить колонку и все её задачи?')) return;
        var f = document.createElement('form'); f.method = 'post'; f.action = '/columns/delete';
        f.innerHTML = '<input type="hidden" name="' + csrfParam + '" value="' + csrfToken + '">'
            + '<input type="hidden" name="id" value="' + colId + '">'
            + '<input type="hidden" name="projectId" value="' + projectId + '">';
        document.body.appendChild(f); f.submit();
    }

    /* ══ Task detail ══ */
    var _taskId = null;

    function openTaskDetail(id) {
        _taskId = id;
        switchToView();
        openModal('taskDetailModal');

        document.getElementById('tvName').textContent = 'Загрузка...';
        document.getElementById('tvDesc').textContent = '';

        fetch('/api/tasks/' + id)
            .then(function(r) { return r.json(); })
            .then(function(t) {
                document.getElementById('tdTitle').textContent  = t.name || '';
                document.getElementById('tvName').textContent   = t.name || '';
                document.getElementById('tvDesc').textContent   = t.description || 'Описание не указано';
                document.getElementById('tvColumn').textContent = t.columnName  || '—';
                document.getElementById('tvCreated').textContent= t.createdAt   || '—';
                document.getElementById('tvAuthor').textContent = t.author ? t.author.name : '—';

                var pb = document.getElementById('tvPriority');
                var priorityMap = { LOW:'🟢 Низкий', MEDIUM:'🟡 Средний', HIGH:'🔴 Высокий', URGENT:'🟣 Срочный' };
                pb.textContent = priorityMap[t.priority] || t.priority || '—';
                pb.className = 'tc-priority tp-' + (t.priority || 'low').toLowerCase();

                var sb = document.getElementById('tvStatus');
                var statusMap = { 'COMPLETED':'✅ Done','IN_PROGRESS':'🔄 In Progress','PENDING':'⏳ Todo' };
                sb.textContent = statusMap[t.status] || t.status || '—';
                sb.className = 'tc-status ts-' + (t.status || 'pending').toLowerCase().replace(/\s+/g,'_');

                var pw = document.getElementById('tvParticipantsWrap');
                var pc = document.getElementById('tvParticipants');
                if (t.participants && t.participants.length) {
                    pc.innerHTML = t.participants.map(function(p) {
                        return '<div class="tv-part-row"><div class="tv-part-ava"><i class="bi bi-person-fill"></i></div>' + escapeHtml(p.name) + '</div>';
                    }).join('');
                    pw.style.display = '';
                } else { pw.style.display = 'none'; }

                var cw = document.getElementById('tvCommentsWrap');
                var cc = document.getElementById('tvComments');
                if (t.comments && t.comments.length) {
                    document.getElementById('tvCommCnt').textContent = t.comments.length;
                    cc.innerHTML = t.comments.map(function(c) {
                        return '<div class="tv-comment"><div class="tv-c-ava"><i class="bi bi-person-fill"></i></div><div>'
                            + '<div class="tv-c-author">' + escapeHtml(c.author) + '</div>'
                            + '<div class="tv-c-text">' + escapeHtml(c.text) + '</div>'
                            + '<div class="tv-c-time">' + escapeHtml(c.createdAt || '') + '</div>'
                            + '</div></div>';
                    }).join('');
                    cw.style.display = '';
                } else { cw.style.display = 'none'; }

                /* ── Заполняем форму редактирования ── */
                document.getElementById('teId').value   = t.id;
                document.getElementById('teName').value = t.name || '';
                document.getElementById('teDesc').value = t.description || '';
                if (t.priority) document.getElementById('tePriority').value = t.priority;
                if (t.status)   document.getElementById('teStatus').value   = t.status;
                if (t.columnId) document.getElementById('teColumn').value   = t.columnId;

                /* ── FIX: устанавливаем корректный action формы ── */
                document.getElementById('teForm').action = '/tasks/' + t.id;
            })
            .catch(function(err) { console.warn('Task fetch error:', err); });
    }

    function switchToView() {
        document.getElementById('tvMode').style.display   = '';
        document.getElementById('teForm').style.display   = 'none';
        document.getElementById('tvHeader').style.display = '';
        document.getElementById('teHeader').style.display = 'none';
        document.getElementById('tvFooter').style.display = '';
        document.getElementById('teFooter').style.display = 'none';
    }
    function switchToEdit() {
        document.getElementById('tvMode').style.display   = 'none';
        document.getElementById('teForm').style.display   = '';
        document.getElementById('tvHeader').style.display = 'none';
        document.getElementById('teHeader').style.display = '';
        document.getElementById('tvFooter').style.display = 'none';
        document.getElementById('teFooter').style.display = '';
        setTimeout(function() { var e = document.getElementById('teName'); if (e) e.focus(); }, 80);
    }

    /* ══ FIX: saveTask — правильный URL /tasks/{id} и параметр columnId ══ */
    function saveTask() {
        var taskId   = document.getElementById('teId').value;
        var name     = document.getElementById('teName').value.trim();
        var desc     = document.getElementById('teDesc').value;
        var priority = document.getElementById('tePriority').value;
        var status   = document.getElementById('teStatus').value;
        var columnId = document.getElementById('teColumn').value;

        if (!name) { alert('Введите название задачи'); return; }

        var params = new URLSearchParams();
        params.append(csrfParam,   csrfToken);
        params.append('projectId', projectId);
        params.append('columnId',  columnId);   /* @RequestParam Long columnId */
        params.append('name',      name);
        params.append('description', desc);
        params.append('priority',  priority);
        params.append('status',    status);

        fetch('/tasks/' + taskId, {             /* PathVariable id */
            method: 'POST',
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
            body: params.toString()
        }).then(function(r) {
            if (r.ok || r.redirected) {
                window.location.reload();
            } else {
                return r.text().then(function(t) {
                    console.error('Edit error:', r.status, t);
                    alert('Ошибка сохранения: ' + r.status);
                });
            }
        }).catch(function(err) { console.error(err); alert('Ошибка сети'); });
    }

    function deleteTask() {
        if (!_taskId || !confirm('Удалить задачу? Это действие необратимо.')) return;
        var f = document.createElement('form'); f.method = 'post'; f.action = '/tasks/delete';
        f.innerHTML = '<input type="hidden" name="' + csrfParam + '" value="' + csrfToken + '">'
            + '<input type="hidden" name="taskId" value="' + _taskId + '">'
            + '<input type="hidden" name="projectId" value="' + projectId + '">';
        document.body.appendChild(f); f.submit();
    }

    function escapeHtml(str) {
        if (!str) return '';
        return String(str).replace(/&/g,'&amp;').replace(/</g,'&lt;').replace(/>/g,'&gt;').replace(/"/g,'&quot;');
    }

    /* ══ Навигация по колонкам — кнопки ══ */
    function scrollKanban(delta) {
        var sc = document.getElementById('kanbanScroll');
        if (!sc) return;
        sc.scrollBy({ left: delta, behavior: 'smooth' });
    }

    function updateNavButtons() {
        var sc = document.getElementById('kanbanScroll');
        var btnL = document.getElementById('kanbanScrollLeft');
        var btnR = document.getElementById('kanbanScrollRight');
        var ind  = document.getElementById('kanbanNavIndicator');
        if (!sc) return;

        var atStart = sc.scrollLeft <= 4;
        var atEnd   = sc.scrollLeft + sc.clientWidth >= sc.scrollWidth - 4;

        if (btnL) btnL.disabled = atStart;
        if (btnR) btnR.disabled = atEnd;

        /* Показываем номер "видимой" колонки */
        if (ind) {
            var cols = sc.querySelectorAll('.kol');
            if (cols.length > 0) {
                var colW = cols[0].offsetWidth + 12; /* width + gap */
                var current = Math.round(sc.scrollLeft / colW) + 1;
                ind.textContent = current + ' / ' + cols.length;
            }
        }
    }

    document.addEventListener('DOMContentLoaded', function() {
        var sc = document.getElementById('kanbanScroll');
        if (sc) {
            sc.addEventListener('scroll', updateNavButtons, { passive: true });
            updateNavButtons();
        }

        /* ── Drag-to-scroll (LMB на пустой области доски) ── */
        if (!sc) return;
        var isScrolling = false, scrollStartX, scrollLeft0;
        sc.addEventListener('mousedown', function(e) {
            if (e.target.closest('.task-card') || e.target.closest('button') || e.target.closest('a')) return;
            isScrolling  = true;
            scrollStartX = e.pageX;
            scrollLeft0  = sc.scrollLeft;
            sc.style.cursor = 'grabbing';
            e.preventDefault();
        });
        document.addEventListener('mouseup', function() {
            isScrolling = false;
            if (sc) sc.style.cursor = 'grab';
        });
        document.addEventListener('mousemove', function(e) {
            if (!isScrolling) return;
            sc.scrollLeft = scrollLeft0 - (e.pageX - scrollStartX);
        });
        sc.style.cursor = 'grab';
    });
</script>

</@main.layout>
