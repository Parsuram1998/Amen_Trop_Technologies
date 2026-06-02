<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Available Jobs</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap"
rel="stylesheet">

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"/>

<style>

:root{
    --bg:#060606;
    --card:#111111;
    --card2:#171717;
    --border:rgba(255,255,255,0.06);
    --text:#ffffff;
    --muted:#9ca3af;
    --gold:#d4af37;
    --gold-light:#f5d77a;
    --green:#2ea043;
}

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
}

body{
    font-family:'Inter',sans-serif;

    background:
    radial-gradient(circle at top left,#1a1a1a 0%,#080808 45%),
    linear-gradient(to bottom,#060606,#020202);

    color:var(--text);

    min-height:100vh;

    overflow-x:hidden;
}

/* NAVBAR */

.navbar{
    display:flex;
    justify-content:space-between;
    align-items:center;

    padding:20px 42px;

    border-bottom:1px solid rgba(255,255,255,0.04);

    background:rgba(8,8,8,0.92);

    backdrop-filter:blur(18px);

    position:sticky;
    top:0;
    z-index:100;
}

.logo{
    font-size:1.8rem;
    font-weight:800;
    color:var(--gold);
    letter-spacing:1px;
}

.nav-links{
    display:flex;
    align-items:center;
    gap:26px;
}

.nav-links a{
    text-decoration:none;
    color:var(--muted);
    font-size:0.93rem;
    font-weight:600;
    transition:0.25s ease;
}

.nav-links a:hover{
    color:var(--gold-light);
}

/* MAIN */

.main{
    max-width:1320px;
    margin:auto;
    padding:40px 24px 60px;
}

/* HERO */

.hero{
    margin-bottom:38px;
}

.hero-badge{
    display:inline-flex;
    align-items:center;
    gap:8px;

    padding:10px 16px;

    border-radius:30px;

    background:rgba(212,175,55,0.10);

    border:1px solid rgba(212,175,55,0.14);

    color:var(--gold-light);

    font-size:0.82rem;

    font-weight:700;

    margin-bottom:20px;
}

.hero h1{
    font-size:3.2rem;
    font-weight:800;
    line-height:1.1;
    margin-bottom:16px;
}

.hero p{
    max-width:760px;
    color:var(--muted);
    line-height:1.9;
    font-size:1rem;
}

/* GRID */

.jobs-grid{
    display:grid;
    grid-template-columns:repeat(auto-fit,minmax(360px,1fr));
    gap:24px;
}

/* CARD */

.job-card{
    position:relative;

    background:
    linear-gradient(
        145deg,
        rgba(18,18,18,0.96),
        rgba(10,10,10,0.98)
    );

    border:1px solid rgba(255,255,255,0.05);

    border-radius:30px;

    padding:26px;

    overflow:hidden;

    transition:0.28s ease;

    display:flex;
    flex-direction:column;
}

.job-card::before{
    content:"";

    position:absolute;

    top:0;
    left:0;
    right:0;

    height:4px;

    background:
    linear-gradient(
        90deg,
        #d4af37,
        #f5d173
    );
}

.job-card:hover{
    transform:translateY(-6px);

    border-color:rgba(212,175,55,0.16);

    box-shadow:
    0 20px 45px rgba(0,0,0,0.55),
    0 0 25px rgba(212,175,55,0.06);
}

/* TOP */

.job-top{
    display:flex;
    justify-content:space-between;
    align-items:flex-start;
    gap:16px;
    margin-bottom:22px;
}

.job-title{
    font-size:1.35rem;
    font-weight:700;
    line-height:1.4;
    margin-bottom:10px;
}

.company{
    color:var(--gold-light);

    font-size:0.95rem;

    display:flex;

    align-items:flex-start;

    gap:10px;

    line-height:1.6;

    word-break:break-word;
}

/* TYPE */

.job-type{
    padding:10px 16px;

    border-radius:30px;

    background:rgba(212,175,55,0.10);

    border:1px solid rgba(212,175,55,0.14);

    color:var(--gold-light);

    font-size:0.75rem;

    font-weight:700;

    white-space:nowrap;
}

/* META */

.meta-grid{
    display:grid;
    grid-template-columns:1fr 1fr;
    gap:12px;

    margin-bottom:18px;
}

.meta-box{
    background:
    linear-gradient(
        145deg,
        rgba(255,255,255,0.03),
        rgba(255,255,255,0.015)
    );

    border:1px solid rgba(255,255,255,0.05);

    border-radius:18px;

    padding:14px;
}

.meta-label{
    color:var(--muted);

    font-size:0.72rem;

    text-transform:uppercase;

    margin-bottom:8px;

    letter-spacing:0.6px;
}

.meta-value{
    font-size:0.95rem;
    font-weight:600;
    line-height:1.5;
}

/* DESCRIPTION */

.short-desc{
    color:#dddddd;

    font-size:0.9rem;

    line-height:1.8;

    margin-bottom:22px;

    min-height:54px;

    display:-webkit-box;

    -webkit-line-clamp:2;

    -webkit-box-orient:vertical;

    overflow:hidden;
}

/* FOOTER */

.job-footer{
    margin-top:auto;

    display:flex;
    justify-content:space-between;
    align-items:center;
    gap:16px;
}

.status{
    display:flex;
    align-items:center;
    gap:10px;

    color:var(--muted);

    font-size:0.86rem;
}

.dot{
    width:10px;
    height:10px;
    border-radius:50%;
    background:var(--green);

    box-shadow:
    0 0 10px rgba(46,160,67,0.6);
}

/* BUTTON */

.btn{
    display:inline-flex;
    align-items:center;
    justify-content:center;
    gap:10px;

    padding:13px 22px;

    border-radius:18px;

    background:
    linear-gradient(
        135deg,
        #d4af37,
        #f5d173
    );

    color:#000;

    text-decoration:none;

    font-size:0.88rem;

    font-weight:700;

    transition:0.25s ease;
}

.btn:hover{
    transform:translateY(-2px);

    box-shadow:
    0 14px 26px rgba(212,175,55,0.24);
}

/* EMPTY */

.empty{
    background:
    linear-gradient(
        145deg,
        rgba(18,18,18,0.96),
        rgba(10,10,10,0.98)
    );

    border:1px solid rgba(255,255,255,0.05);

    border-radius:32px;

    padding:80px 30px;

    text-align:center;
}

.empty i{
    font-size:3.5rem;
    color:rgba(212,175,55,0.75);
    margin-bottom:22px;
}

.empty h3{
    font-size:1.6rem;
    margin-bottom:12px;
}

.empty p{
    color:var(--muted);
    line-height:1.8;
    max-width:520px;
    margin:auto;
}

/* RESPONSIVE */

@media(max-width:768px){

    .navbar{
        padding:16px 18px;

        flex-direction:column;

        gap:16px;
    }

    .nav-links{
        gap:18px;
        flex-wrap:wrap;
        justify-content:center;
    }

    .main{
        padding:24px 16px 40px;
    }

    .hero h1{
        font-size:2.2rem;
    }

    .hero p{
        font-size:0.94rem;
    }

    .jobs-grid{
        grid-template-columns:1fr;
    }

    .job-card{
        padding:22px;
        border-radius:24px;
    }

    .job-top{
        flex-direction:column;
    }

    .meta-grid{
        grid-template-columns:1fr;
    }

    .job-footer{
        flex-direction:column;
        align-items:flex-start;
    }

    .btn{
        width:100%;
    }
}

</style>

</head>

<body>

<!-- NAVBAR -->

<div class="navbar">

    <div class="logo">
        AMENTROP
    </div>

    <div class="nav-links">

        <a href="${pageContext.request.contextPath}/">
            Home
        </a>

        <a href="${pageContext.request.contextPath}/logout">
            Logout
        </a>

    </div>

</div>

<!-- MAIN -->

<div class="main">

<!-- HERO -->

<div class="hero">

    <div class="hero-badge">
        <i class="fa-solid fa-briefcase"></i>
        Explore Opportunities
    </div>

    <h1>
        Find Your Dream Job
    </h1>

    <p>
        Discover curated fresher and experienced opportunities from top companies.
        Explore openings that match your skills, branch, and career goals.
    </p>

</div>

<!-- JOBS -->

<c:if test="${not empty jobs}">

<div class="jobs-grid">

<c:forEach items="${jobs}" var="j">

<div class="job-card">

    <!-- TOP -->

    <div class="job-top">

        <div>

            <div class="job-title">
                ${j.title}
            </div>

            <div class="company">

                <i class="fa-solid fa-building"></i>

                ${j.companyName}

            </div>

        </div>

        <!-- JOB TYPE -->

        <div class="job-type">

            <c:choose>

                <c:when test="${j.jobType eq 'BOTH'}">
                    Freshers & Experienced
                </c:when>

                <c:otherwise>
                    ${j.jobType}
                </c:otherwise>

            </c:choose>

        </div>

    </div>

    <!-- META -->

    <div class="meta-grid">

        <div class="meta-box">

            <div class="meta-label">
                Location
            </div>

            <div class="meta-value">
                ${j.location}
            </div>

        </div>

        <div class="meta-box">

            <div class="meta-label">
                Domain
            </div>

            <div class="meta-value">
                ${j.domain}
            </div>

        </div>

        <div class="meta-box">

            <div class="meta-label">
                Eligible Branch
            </div>

            <div class="meta-value">

                <c:choose>

                    <c:when test="${empty j.eligibleBranch}">
                        Any Branch
                    </c:when>

                    <c:otherwise>
                        ${j.eligibleBranch}
                    </c:otherwise>

                </c:choose>

            </div>

        </div>

        <div class="meta-box">

            <div class="meta-label">
                Passout Year
            </div>

            <div class="meta-value">

                <c:choose>

                    <c:when test="${empty j.eligibleYearOfPassout}">
                        Any Year
                    </c:when>

                    <c:otherwise>
                        ${j.eligibleYearOfPassout}
                    </c:otherwise>

                </c:choose>

            </div>

        </div>

    </div>

    <!-- DESCRIPTION -->

    <div class="short-desc">

        <c:choose>

            <c:when test="${fn:length(j.description) > 120}">
                ${fn:substring(j.description,0,120)}...
            </c:when>

            <c:otherwise>
                ${j.description}
            </c:otherwise>

        </c:choose>

    </div>

    <!-- FOOTER -->

    <div class="job-footer">

        <div class="status">

            <div class="dot"></div>

            Applications Open

        </div>

        <a class="btn"
           href="${pageContext.request.contextPath}/jobs/details?id=${j.id}">

            View Details

            <i class="fa-solid fa-arrow-right"></i>

        </a>

    </div>

</div>

</c:forEach>

</div>

</c:if>

<!-- EMPTY -->

<c:if test="${empty jobs}">

<div class="empty">

    <i class="fa-solid fa-briefcase"></i>

    <h3>
        No Jobs Available
    </h3>

    <p>
        There are currently no job openings available.
        Please check again later for new opportunities.
    </p>

</div>

</c:if>

</div>

</body>
</html>