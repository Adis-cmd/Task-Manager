<#import "/layout.ftlh" as main>
<@main.layout>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Sora:wght@400;600;700;800&display=swap" rel="stylesheet">

<style>
    :root {
        --cyan: #00bcd4;
        --cyan-dark: #0097a7;
        --cyan-glow: rgba(0,188,212,0.28);
        --dark: #1a1a1a;
        --gray: #6b7280;
        --gray-light: #e8ecf0;
        --radius: 20px;
    }

    .hero {
        position: relative;
        overflow: hidden;
        border-radius: 28px;
        background: #0a0a0a;
        padding: 110px 72px 110px 72px;
        margin-bottom: 28px;
        display: flex;
        align-items: center;
        gap: 80px;
        min-height: 520px;
    }

    .hero::before {
        content: '';
        position: absolute;
        inset: 0;
        background:
            radial-gradient(ellipse 55% 65% at 5% 50%,  rgba(0,188,212,0.52) 0%, transparent 65%),
            radial-gradient(ellipse 40% 55% at 90% 10%, rgba(0,140,190,0.35) 0%, transparent 65%),
            radial-gradient(ellipse 30% 40% at 70% 90%, rgba(0,100,160,0.25) 0%, transparent 60%),
            #0a0a0a;
        animation: heroBg 14s ease-in-out infinite alternate;
    }

    @keyframes heroBg {
        0%   { filter: hue-rotate(0deg)   brightness(1); }
        50%  { filter: hue-rotate(18deg)  brightness(1.1); }
        100% { filter: hue-rotate(-12deg) brightness(0.95); }
    }

    .hero-grid {
        position: absolute; inset: 0;
        background-image:
            linear-gradient(rgba(255,255,255,0.03) 1px, transparent 1px),
            linear-gradient(90deg, rgba(255,255,255,0.03) 1px, transparent 1px);
        background-size: 52px 52px;
        pointer-events: none;
    }

    .hero-orb {
        position: absolute;
        border-radius: 50%;
        filter: blur(72px);
        pointer-events: none;
        animation: orbDrift ease-in-out infinite;
    }

    .orb-a { width:320px; height:320px; background: radial-gradient(circle,#00e5ff,#00bcd4); top:-90px; left:-60px; opacity:.45; animation-duration:15s; }
    .orb-b { width:220px; height:220px; background: radial-gradient(circle,#00bcd4,#006064); bottom:-30px; right:18%; opacity:.38; animation-duration:20s; animation-direction:reverse; }
    .orb-c { width:140px; height:140px; background: radial-gradient(circle,#80deea,#00acc1); top:40%; right:8%; opacity:.25; animation-duration:25s; }

    @keyframes orbDrift {
        0%,100% { transform: translate(0,0)      scale(1); }
        33%      { transform: translate(22px,-16px) scale(1.05); }
        66%      { transform: translate(-16px,22px) scale(0.96); }
    }

    .hero-ring {
        position: absolute;
        border-radius: 50%;
        border: 1px solid rgba(0,188,212,0.12);
        pointer-events: none;
        animation: ringPulse 7s ease-in-out infinite;
    }
    .ring-1 { width:460px; height:460px; top:-100px; right:-130px; animation-delay:0s; }
    .ring-2 { width:630px; height:630px; top:-185px; right:-215px; animation-delay:2s; }
    .ring-3 { width:800px; height:800px; top:-270px; right:-300px; animation-delay:4s; }

    @keyframes ringPulse {
        0%,100% { opacity:.4; transform:scale(1); }
        50%      { opacity:1;  transform:scale(1.015); }
    }

    .hero-content {
        position: relative; z-index: 2;
        flex: 1; max-width: 560px;
        animation: fadeUp .8s ease both;
    }

    .hero-badge {
        display: inline-flex; align-items: center; gap: 8px;
        background: rgba(0,188,212,.12);
        border: 1px solid rgba(0,188,212,.28);
        border-radius: 100px;
        padding: 6px 16px;
        margin-bottom: 30px;
    }

    .badge-dot {
        width:7px; height:7px;
        background: var(--cyan); border-radius:50%;
        animation: dotPulse 2.2s ease infinite;
    }

    @keyframes dotPulse {
        0%,100% { box-shadow:0 0 0 0 var(--cyan-glow); }
        50%      { box-shadow:0 0 0 7px transparent; }
    }

    .hero-badge span {
        font-size:11px; font-weight:700; color:var(--cyan);
        text-transform:uppercase; letter-spacing:.8px;
    }

    .hero-content h1 {
        font-family:'Sora',sans-serif;
        font-size:58px; font-weight:800;
        color:#fff; line-height:1.06;
        letter-spacing:-2px;
        margin-bottom:22px;
    }

    .hero-content h1 em {
        color:var(--cyan);
        font-style:normal;
        position:relative;
    }

    .hero-content h1 em::after {
        content:'';
        position:absolute;
        bottom:-4px; left:0; right:0; height:3px;
        background:linear-gradient(90deg,var(--cyan),#00e5ff);
        border-radius:10px;
        animation:underlineGrow .8s .6s ease both;
        transform-origin:left;
    }

    @keyframes underlineGrow {
        from { transform:scaleX(0); }
        to   { transform:scaleX(1); }
    }

    .hero-content p {
        font-size:17px; color:rgba(255,255,255,.5);
        line-height:1.8; margin-bottom:38px;
        max-width:440px;
    }

    .hero-actions { display:flex; gap:14px; flex-wrap:wrap; }

    .btn-primary {
        display:inline-flex; align-items:center; gap:8px;
        padding:15px 32px;
        background:var(--cyan); color:#fff;
        border:none; border-radius:12px;
        font-size:15px; font-weight:700;
        font-family:'Sora',sans-serif;
        text-decoration:none; cursor:pointer;
        transition:all .25s ease;
        position:relative; overflow:hidden;
    }

    .btn-primary::after {
        content:'';
        position:absolute; inset:0;
        background:rgba(255,255,255,.12);
        opacity:0; transition:opacity .3s;
    }

    .btn-primary:hover {
        background:var(--cyan-dark);
        transform:translateY(-2px);
        box-shadow:0 10px 28px var(--cyan-glow);
        color:#fff;
    }
    .btn-primary:hover::after { opacity:1; }

    .btn-ghost {
        display:inline-flex; align-items:center; gap:8px;
        padding:15px 28px;
        background:rgba(255,255,255,.07);
        color:rgba(255,255,255,.85);
        border:1px solid rgba(255,255,255,.14);
        border-radius:12px;
        font-size:15px; font-weight:600;
        text-decoration:none; cursor:pointer;
        transition:all .25s ease;
    }

    .btn-ghost:hover {
        background:rgba(255,255,255,.13);
        color:#fff;
        transform:translateY(-2px);
        border-color:rgba(255,255,255,.22);
    }

    .hero-visual {
        position:relative; z-index:2;
        flex-shrink:0; width:360px;
        animation:fadeUp .9s .15s ease both;
    }

    .mock-card {
        background:rgba(255,255,255,.06);
        border:1px solid rgba(255,255,255,.1);
        border-radius:22px;
        padding:26px;
        backdrop-filter:blur(20px);
        animation:cardFloat 7s ease-in-out infinite;
    }

    @keyframes cardFloat {
        0%,100% { transform:translateY(0)  rotate(0deg); }
        50%      { transform:translateY(-12px) rotate(.5deg); }
    }

    .mock-head { display:flex; align-items:center; justify-content:space-between; margin-bottom:18px; }
    .mock-head-title { font-family:'Sora',sans-serif; font-size:14px; font-weight:700; color:rgba(255,255,255,.9); }
    .mock-head-pill {
        font-size:11px; font-weight:700; color:var(--cyan);
        background:rgba(0,188,212,.15);
        border:1px solid rgba(0,188,212,.25);
        border-radius:20px; padding:3px 10px;
    }

    .mock-tasks { display:flex; flex-direction:column; gap:9px; margin-bottom:18px; }

    .mock-task {
        display:flex; align-items:center; gap:10px;
        padding:10px 12px;
        background:rgba(255,255,255,.05);
        border:1px solid rgba(255,255,255,.06);
        border-radius:11px;
        transition:background .2s;
    }

    .mock-cb {
        width:18px; height:18px; border-radius:5px;
        border:1.5px solid rgba(255,255,255,.2);
        flex-shrink:0;
        display:flex; align-items:center; justify-content:center;
    }

    .mock-cb.done { background:var(--cyan); border-color:var(--cyan); }
    .mock-cb.done::after { content:''; width:5px; height:8px; border:2px solid #fff; border-top:none; border-left:none; transform:rotate(45deg) translateY(-1px); }

    .mock-text { font-size:12px; color:rgba(255,255,255,.6); flex:1; }
    .mock-text.s { text-decoration:line-through; opacity:.38; }

    .mtag { font-size:10px; font-weight:700; border-radius:6px; padding:2px 8px; }
    .t-cyan  { background:rgba(0,188,212,.18); color:var(--cyan); }
    .t-green { background:rgba(34,197,94,.18);  color:#22c55e; }
    .t-amber { background:rgba(245,158,11,.18); color:#f59e0b; }

    .mock-prog-label { display:flex; justify-content:space-between; font-size:11px; color:rgba(255,255,255,.35); margin-bottom:6px; }
    .mock-prog-track { height:5px; background:rgba(255,255,255,.08); border-radius:10px; overflow:hidden; }
    .mock-prog-fill  { height:100%; width:66%; background:linear-gradient(90deg,var(--cyan),#00e5ff); border-radius:10px; animation:grow .9s .4s ease both; transform-origin:left; }

    @keyframes grow { from{transform:scaleX(0)} to{transform:scaleX(1)} }

    .mini-card {
        position:absolute;
        background:#fff;
        border-radius:14px;
        padding:12px 16px;
        box-shadow:0 16px 40px rgba(0,0,0,.25);
        display:flex; align-items:center; gap:10px;
        animation:miniFloat 8s ease-in-out infinite;
        white-space:nowrap;
    }

    .mini-card-1 { bottom:-24px; left:-36px; animation-delay:0s; }
    .mini-card-2 { top:-20px;   right:-32px; animation-delay:3s; }

    @keyframes miniFloat {
        0%,100% { transform:translateY(0); }
        50%      { transform:translateY(-8px); }
    }

    .mini-icon { width:32px; height:32px; border-radius:9px; display:flex; align-items:center; justify-content:center; font-size:16px; flex-shrink:0; }
    .mini-info { }
    .mini-val  { font-family:'Sora',sans-serif; font-size:15px; font-weight:800; color:var(--dark); line-height:1; }
    .mini-lbl  { font-size:11px; color:var(--gray); margin-top:1px; }

    .stats-row {
        display:grid; grid-template-columns:repeat(4,1fr);
        gap:16px; margin-bottom:28px;
    }

    .stat-card {
        background:#fff; border:1px solid var(--gray-light);
        border-radius:var(--radius); padding:26px;
        display:flex; align-items:flex-start; gap:14px;
        transition:all .25s ease;
        animation:fadeUp .6s ease both;
    }

    .stat-card:nth-child(1){animation-delay:.05s}
    .stat-card:nth-child(2){animation-delay:.1s}
    .stat-card:nth-child(3){animation-delay:.15s}
    .stat-card:nth-child(4){animation-delay:.2s}

    .stat-card:hover {
        transform:translateY(-3px);
        box-shadow:0 10px 28px rgba(0,0,0,.07);
        border-color:var(--cyan);
    }

    .s-icon { width:48px; height:48px; border-radius:14px; display:flex; align-items:center; justify-content:center; font-size:22px; flex-shrink:0; }
    .ic { background:rgba(0,188,212,.1);  color:var(--cyan); }
    .ig { background:rgba(34,197,94,.1);  color:#22c55e; }
    .ia { background:rgba(245,158,11,.1); color:#f59e0b; }
    .ip { background:rgba(139,92,246,.1); color:#8b5cf6; }

    .s-val  { font-family:'Sora',sans-serif; font-size:28px; font-weight:800; color:var(--dark); line-height:1; }
    .s-lbl  { font-size:13px; color:var(--gray); margin-top:5px; }

    .section-head {
        text-align:center; margin-bottom:44px;
        animation:fadeUp .6s ease both;
    }

    .s-tag {
        display:inline-flex; align-items:center; gap:6px;
        font-size:11px; font-weight:700; color:var(--cyan);
        text-transform:uppercase; letter-spacing:1px;
        margin-bottom:14px;
    }

    .section-head h2 {
        font-family:'Sora',sans-serif;
        font-size:38px; font-weight:800; color:var(--dark);
        letter-spacing:-1.2px; margin-bottom:14px;
    }

    .section-head p {
        font-size:16px; color:var(--gray);
        max-width:480px; margin:0 auto; line-height:1.75;
    }

    .steps-row {
        display:grid; grid-template-columns:repeat(3,1fr);
        gap:24px; margin-bottom:28px; position:relative;
    }

    .steps-row::before {
        content:'';
        position:absolute;
        top:36px; left:calc(16.66% + 24px); right:calc(16.66% + 24px);
        height:1px;
        background:linear-gradient(90deg, var(--gray-light) 0%, var(--cyan) 50%, var(--gray-light) 100%);
        animation:lineGrow 1s .4s ease both;
        transform-origin:left;
    }

    @keyframes lineGrow {
        from{transform:scaleX(0)} to{transform:scaleX(1)}
    }

    .step-card {
        background:#fff; border:1px solid var(--gray-light);
        border-radius:var(--radius); padding:32px 28px;
        text-align:center;
        transition:all .25s ease;
        animation:fadeUp .6s ease both;
        position:relative;
    }

    .step-card:nth-child(1){animation-delay:.05s}
    .step-card:nth-child(2){animation-delay:.15s}
    .step-card:nth-child(3){animation-delay:.25s}

    .step-card:hover { transform:translateY(-4px); box-shadow:0 12px 32px rgba(0,0,0,.08); border-color:var(--cyan); }

    .step-num {
        width:52px; height:52px; border-radius:50%;
        background:var(--cyan); color:#fff;
        font-family:'Sora',sans-serif;
        font-size:18px; font-weight:800;
        display:flex; align-items:center; justify-content:center;
        margin:0 auto 20px;
        box-shadow:0 0 0 8px rgba(0,188,212,.12);
        transition:box-shadow .3s;
    }

    .step-card:hover .step-num { box-shadow:0 0 0 12px rgba(0,188,212,.18); }

    .step-card h3 { font-family:'Sora',sans-serif; font-size:17px; font-weight:700; color:var(--dark); margin-bottom:10px; }
    .step-card p  { font-size:14px; color:var(--gray); line-height:1.7; }

    .features-grid {
        display:grid; grid-template-columns:repeat(3,1fr);
        gap:20px; margin-bottom:28px;
    }

    .feat-card {
        background:#fff; border:1px solid var(--gray-light);
        border-radius:var(--radius); padding:30px;
        transition:all .25s ease;
        animation:fadeUp .6s ease both;
        position:relative; overflow:hidden;
        cursor:default;
    }

    .feat-card::after {
        content:'';
        position:absolute; top:0; left:0; right:0;
        height:3px;
        background:linear-gradient(90deg,var(--cyan),#00e5ff);
        opacity:0; transition:opacity .3s;
    }

    .feat-card:hover { transform:translateY(-4px); box-shadow:0 14px 36px rgba(0,0,0,.08); border-color:transparent; }
    .feat-card:hover::after { opacity:1; }

    .feat-card:nth-child(1){animation-delay:.05s}
    .feat-card:nth-child(2){animation-delay:.1s}
    .feat-card:nth-child(3){animation-delay:.15s}
    .feat-card:nth-child(4){animation-delay:.2s}
    .feat-card:nth-child(5){animation-delay:.25s}
    .feat-card:nth-child(6){animation-delay:.3s}

    .feat-icon { width:54px; height:54px; border-radius:16px; display:flex; align-items:center; justify-content:center; font-size:26px; margin-bottom:18px; }
    .feat-card h3 { font-family:'Sora',sans-serif; font-size:16px; font-weight:700; color:var(--dark); margin-bottom:10px; }
    .feat-card p  { font-size:14px; color:var(--gray); line-height:1.72; }

    .testimonials-grid {
        display:grid; grid-template-columns:repeat(3,1fr);
        gap:20px; margin-bottom:28px;
    }

    .testi-card {
        background:#fff; border:1px solid var(--gray-light);
        border-radius:var(--radius); padding:28px;
        transition:all .25s ease;
        animation:fadeUp .6s ease both;
    }

    .testi-card:nth-child(1){animation-delay:.05s}
    .testi-card:nth-child(2){animation-delay:.12s}
    .testi-card:nth-child(3){animation-delay:.19s}

    .testi-card:hover { transform:translateY(-3px); box-shadow:0 10px 28px rgba(0,0,0,.07); }

    .testi-stars { color:#f59e0b; font-size:14px; letter-spacing:2px; margin-bottom:14px; }
    .testi-text  { font-size:14px; color:var(--gray); line-height:1.75; margin-bottom:18px; font-style:italic; }
    .testi-author { display:flex; align-items:center; gap:10px; }
    .testi-avatar { width:38px; height:38px; border-radius:11px; display:flex; align-items:center; justify-content:center; font-size:18px; flex-shrink:0; }
    .testi-name  { font-family:'Sora',sans-serif; font-size:13px; font-weight:700; color:var(--dark); }
    .testi-role  { font-size:12px; color:var(--gray); }

    .cta-banner {
        position:relative; overflow:hidden;
        border-radius:28px; background:#0a0a0a;
        padding:80px 72px; text-align:center;
    }

    .cta-banner::before {
        content:'';
        position:absolute; inset:0;
        background:
            radial-gradient(ellipse 60% 90% at 50% 110%, rgba(0,188,212,.42) 0%, transparent 60%),
            radial-gradient(ellipse 30% 30% at 20% 20%, rgba(0,100,200,.2) 0%, transparent 60%),
            #0a0a0a;
        animation:heroBg 12s ease-in-out infinite alternate;
    }

    .cta-grid {
        position:absolute; inset:0;
        background-image:
            linear-gradient(rgba(255,255,255,.025) 1px, transparent 1px),
            linear-gradient(90deg, rgba(255,255,255,.025) 1px, transparent 1px);
        background-size:52px 52px;
    }

    .cta-content { position:relative; z-index:2; }

    .cta-content h2 {
        font-family:'Sora',sans-serif;
        font-size:46px; font-weight:800; color:#fff;
        letter-spacing:-1.5px; margin-bottom:14px;
    }

    .cta-content h2 em { color:var(--cyan); font-style:normal; }

    .cta-content p {
        font-size:17px; color:rgba(255,255,255,.45);
        max-width:420px; margin:0 auto 40px;
        line-height:1.8;
    }

    .cta-btns { display:flex; gap:14px; justify-content:center; flex-wrap:wrap; }

    @keyframes fadeUp {
        from { opacity:0; transform:translateY(22px); }
        to   { opacity:1; transform:translateY(0); }
    }

    .mb { margin-bottom:28px; }

    @media (max-width:1100px) {
        .stats-row         { grid-template-columns:repeat(2,1fr); }
        .features-grid     { grid-template-columns:repeat(2,1fr); }
        .testimonials-grid { grid-template-columns:repeat(2,1fr); }
    }

    @media (max-width:900px) {
        .hero              { flex-direction:column; padding:64px 32px; min-height:auto; }
        .hero-content h1   { font-size:42px; }
        .hero-visual       { width:100%; }
        .steps-row         { grid-template-columns:1fr; }
        .steps-row::before { display:none; }
    }

    @media (max-width:600px) {
        .hero-content h1   { font-size:34px; }
        .stats-row         { grid-template-columns:repeat(2,1fr); }
        .features-grid     { grid-template-columns:1fr; }
        .testimonials-grid { grid-template-columns:1fr; }
        .cta-banner        { padding:48px 24px; }
        .cta-content h2    { font-size:32px; }
        .mini-card-1, .mini-card-2 { display:none; }
    }
</style>

<section class="hero mb">
    <div class="hero-grid"></div>
    <div class="hero-orb orb-a"></div>
    <div class="hero-orb orb-b"></div>
    <div class="hero-orb orb-c"></div>
    <div class="hero-ring ring-1"></div>
    <div class="hero-ring ring-2"></div>
    <div class="hero-ring ring-3"></div>

    <div class="hero-content">
        <div class="hero-badge">
            <div class="badge-dot"></div>
            <span>Платформа нового поколения</span>
        </div>

        <h1>Управляй задачами<br>как <em>профессионал</em></h1>

        <p>Организуй проекты, координируй команду и достигай целей. Всё в одном месте — просто, быстро, эффективно.</p>

        <div class="hero-actions">
            <a href="/auth/register" class="btn-primary">
                <i class="bi bi-rocket-takeoff-fill"></i>
                Начать бесплатно
            </a>
            <a href="/auth/login" class="btn-ghost">
                <i class="bi bi-box-arrow-in-right"></i>
                Войти в аккаунт
            </a>
        </div>
    </div>

    <div class="hero-visual">
        <div class="mock-card">
            <div class="mock-head">
                <div class="mock-head-title">🚀 Sprint #4 — UI redesign</div>
                <div class="mock-head-pill">В работе</div>
            </div>

            <div class="mock-tasks">
                <div class="mock-task">
                    <div class="mock-cb done"></div>
                    <div class="mock-text s">Настройка CI/CD pipeline</div>
                    <span class="mtag t-green">Done</span>
                </div>
                <div class="mock-task">
                    <div class="mock-cb done"></div>
                    <div class="mock-text s">Дизайн-система компонентов</div>
                    <span class="mtag t-green">Done</span>
                </div>
                <div class="mock-task">
                    <div class="mock-cb"></div>
                    <div class="mock-text">Разработка REST API v2</div>
                    <span class="mtag t-cyan">In Progress</span>
                </div>
                <div class="mock-task">
                    <div class="mock-cb"></div>
                    <div class="mock-text">Интеграционное тестирование</div>
                    <span class="mtag t-amber">Todo</span>
                </div>
            </div>

            <div class="mock-prog-label">
                <span>Прогресс спринта</span>
                <span style="color:var(--cyan);font-weight:700">66%</span>
            </div>
            <div class="mock-prog-track">
                <div class="mock-prog-fill"></div>
            </div>
        </div>

        <div class="mini-card mini-card-1">
            <div class="mini-icon ig"><i class="bi bi-check-lg" style="color:#22c55e;font-size:18px"></i></div>
            <div class="mini-info">
                <div class="mini-val" style="color:#22c55e">47</div>
                <div class="mini-lbl">Задач выполнено</div>
            </div>
        </div>

        <div class="mini-card mini-card-2">
            <div class="mini-icon ic"><i class="bi bi-people-fill" style="color:var(--cyan);font-size:16px"></i></div>
            <div class="mini-info">
                <div class="mini-val">8</div>
                <div class="mini-lbl">Человек в команде</div>
            </div>
        </div>
    </div>
</section>

<div class="stats-row mb">
    <div class="stat-card">
        <div class="s-icon ic"><i class="bi bi-people-fill"></i></div>
        <div>
            <div class="s-val">10K+</div>
            <div class="s-lbl">Пользователей</div>
        </div>
    </div>
    <div class="stat-card">
        <div class="s-icon ig"><i class="bi bi-check-circle-fill"></i></div>
        <div>
            <div class="s-val">500K+</div>
            <div class="s-lbl">Задач выполнено</div>
        </div>
    </div>
    <div class="stat-card">
        <div class="s-icon ia"><i class="bi bi-kanban-fill"></i></div>
        <div>
            <div class="s-val">25K+</div>
            <div class="s-lbl">Проектов создано</div>
        </div>
    </div>
    <div class="stat-card">
        <div class="s-icon ip"><i class="bi bi-star-fill"></i></div>
        <div>
            <div class="s-val">4.9 ★</div>
            <div class="s-lbl">Средний рейтинг</div>
        </div>
    </div>
</div>

<section class="mb">
    <div class="section-head">
        <div class="s-tag"><i class="bi bi-map"></i> Как это работает</div>
        <h2>Три шага до результата</h2>
        <p>Начни управлять проектами уже через минуту — никаких сложных настроек</p>
    </div>

    <div class="steps-row">
        <div class="step-card">
            <div class="step-num">1</div>
            <h3>Создай аккаунт</h3>
            <p>Зарегистрируйся бесплатно за 30 секунд. Никаких кредитных карт и сложных форм.</p>
        </div>
        <div class="step-card">
            <div class="step-num">2</div>
            <h3>Собери команду</h3>
            <p>Пригласи коллег по email. Назначай роли, права доступа и распределяй задачи.</p>
        </div>
        <div class="step-card">
            <div class="step-num">3</div>
            <h3>Достигай целей</h3>
            <p>Отслеживай прогресс в реальном времени, анализируй результаты и бери новые высоты.</p>
        </div>
    </div>
</section>

<section class="mb">
    <div class="section-head">
        <div class="s-tag"><i class="bi bi-lightning-charge-fill"></i> Возможности</div>
        <h2>Всё что нужно команде</h2>
        <p>Мощные инструменты для управления проектами, которые помогут работать продуктивнее каждый день</p>
    </div>

    <div class="features-grid">
        <div class="feat-card">
            <div class="feat-icon ic"><i class="bi bi-kanban-fill"></i></div>
            <h3>Канбан-доски</h3>
            <p>Визуализируй рабочий процесс с гибкими Kanban-досками. Перетаскивай задачи, отслеживай прогресс в реальном времени.</p>
        </div>
        <div class="feat-card">
            <div class="feat-icon ig"><i class="bi bi-people-fill"></i></div>
            <h3>Командная работа</h3>
            <p>Назначай задачи, ставь дедлайны, общайся в комментариях. Вся команда в едином рабочем пространстве.</p>
        </div>
        <div class="feat-card">
            <div class="feat-icon ia"><i class="bi bi-graph-up-arrow"></i></div>
            <h3>Аналитика и отчёты</h3>
            <p>Детальные отчёты по производительности команды, прогрессу проектов и выполнению задач в срок.</p>
        </div>
        <div class="feat-card">
            <div class="feat-icon ip"><i class="bi bi-bell-fill"></i></div>
            <h3>Умные уведомления</h3>
            <p>Не пропусти ничего важного. Уведомления о дедлайнах, обновлениях и упоминаниях в реальном времени.</p>
        </div>
        <div class="feat-card">
            <div class="feat-icon ic"><i class="bi bi-shield-check"></i></div>
            <h3>Безопасность данных</h3>
            <p>Роли и права доступа, шифрование данных, двухфакторная аутентификация для защиты ваших проектов.</p>
        </div>
        <div class="feat-card">
            <div class="feat-icon ig"><i class="bi bi-phone-fill"></i></div>
            <h3>Работа с любого устройства</h3>
            <p>Адаптивный интерфейс всегда под рукой — дома, в офисе и в дороге. Синхронизация в реальном времени.</p>
        </div>
    </div>
</section>

<section class="mb">
    <div class="section-head">
        <div class="s-tag"><i class="bi bi-chat-quote-fill"></i> Отзывы</div>
        <h2>Нам доверяют команды</h2>
        <p>Что говорят люди, которые уже работают с TaskManager Pro</p>
    </div>

    <div class="testimonials-grid">
        <div class="testi-card">
            <div class="testi-stars">★★★★★</div>
            <div class="testi-text">«Наконец-то инструмент, который не требует трёх дней онбординга. Команда освоилась за час, продуктивность выросла вдвое.»</div>
            <div class="testi-author">
                <div class="testi-avatar ic"><i class="bi bi-person-fill" style="font-size:18px"></i></div>
                <div>
                    <div class="testi-name">Алексей Петров</div>
                    <div class="testi-role">CTO, Starta Digital</div>
                </div>
            </div>
        </div>
        <div class="testi-card">
            <div class="testi-stars">★★★★★</div>
            <div class="testi-text">«Лучший таск-менеджер из всех что я пробовала. Канбан-доски просто идеальны, а уведомления приходят именно тогда, когда нужно.»</div>
            <div class="testi-author">
                <div class="testi-avatar ip"><i class="bi bi-person-fill" style="font-size:18px;color:#8b5cf6"></i></div>
                <div>
                    <div class="testi-name">Мария Смирнова</div>
                    <div class="testi-role">Product Manager, FlowTeam</div>
                </div>
            </div>
        </div>
        <div class="testi-card">
            <div class="testi-stars">★★★★★</div>
            <div class="testi-text">«Перешли с Jira — разница колоссальная. Интерфейс чистый, быстрый, всё интуитивно. Особенно нравится аналитика.»</div>
            <div class="testi-author">
                <div class="testi-avatar ig"><i class="bi bi-person-fill" style="font-size:18px;color:#22c55e"></i></div>
                <div>
                    <div class="testi-name">Денис Козлов</div>
                    <div class="testi-role">Lead Dev, CodeCraft</div>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="cta-banner">
    <div class="cta-grid"></div>
    <div class="cta-content">
        <h2>Готов начать?<br>Это <em>бесплатно</em></h2>
        <p>Зарегистрируйся за 30 секунд и начни управлять проектами уже сегодня. Никаких кредитных карт.</p>
        <div class="cta-btns">
            <a href="/auth/register" class="btn-primary" style="font-size:16px;padding:17px 40px;">
                <i class="bi bi-rocket-takeoff-fill"></i>
                Зарегистрироваться бесплатно
            </a>
            <a href="/auth/login" class="btn-ghost" style="font-size:15px;padding:17px 28px;">
                <i class="bi bi-box-arrow-in-right"></i>
                Войти
            </a>
        </div>
    </div>
</section>

</@main.layout>
