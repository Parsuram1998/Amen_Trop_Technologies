<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Job Details</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap"
rel="stylesheet">

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"/>

<style>

:root{
    --bg:#070707;
    --card:#111111;
    --card2:#151515;
    --hover:#1b1b1b;
    --border:rgba(255,255,255,0.06);
    --text:#ffffff;
    --muted:#9ca3af;
    --gold:#d4af37;
    --gold-light:#f5d77a;
    --green:#2ea043;
    --red:#ff4d4d;
}

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
}

body{
    font-family:'Inter',sans-serif;

    background:
    radial-gradient(circle at top left,#1a1a1a 0%,#090909 40%),
    linear-gradient(to bottom,#070707,#030303);

    color:var(--text);

    min-height:100vh;

    overflow-x:hidden;
}

/* NAVBAR */

.navbar{
    display:flex;
    justify-content:space-between;
    align-items:center;

    padding:18px 42px;

    border-bottom:1px solid var(--border);

    background:rgba(10,10,10,0.92);

    backdrop-filter:blur(18px);

    position:sticky;
    top:0;
    z-index:100;
}

.logo{
    font-size:1.5rem;
    font-weight:700;
    color:var(--gold);
    letter-spacing:1px;
}

.nav-links{
    display:flex;
    align-items:center;
    gap:24px;
}

.nav-links a{
    color:var(--muted);
    text-decoration:none;
    transition:0.25s ease;
    font-size:0.92rem;
    font-weight:500;
}

.nav-links a:hover{
    color:var(--gold-light);
}

/* MAIN */

.main{
    max-width:1250px;
    margin:auto;
    padding:34px 24px 50px;
}

/* TOP ACTION */

.top-actions{
    display:flex;
    justify-content:flex-end;
    margin-bottom:18px;
}

.back-btn{
    display:inline-flex;
    align-items:center;
    gap:10px;

    padding:12px 18px;

    border-radius:16px;

    background:rgba(255,255,255,0.03);

    border:1px solid rgba(255,255,255,0.05);

    color:#fff;

    text-decoration:none;

    transition:0.25s ease;

    font-size:0.88rem;

    font-weight:600;
}

.back-btn:hover{
    background:rgba(212,175,55,0.10);
    border-color:rgba(212,175,55,0.15);
    color:var(--gold-light);
}

/* HERO */

.hero-card{
    background:
    linear-gradient(
        145deg,
        rgba(17,17,17,0.96),
        rgba(10,10,10,0.98)
    );

    border:1px solid rgba(255,255,255,0.05);

    border-radius:34px;

    padding:36px;

    margin-bottom:26px;

    box-shadow:
    0 12px 40px rgba(0,0,0,0.55);
}

.job-top{
    display:flex;
    justify-content:space-between;
    gap:30px;
    flex-wrap:wrap;
}

.job-info{
    flex:1;
}

.job-title{
    font-size:2.3rem;
    font-weight:700;
    margin-bottom:14px;
    line-height:1.2;
}

.company{
    display:flex;
    align-items:center;
    gap:10px;

    color:var(--gold-light);

    font-size:1rem;

    margin-bottom:24px;
}

/* TAGS */

.tags{
    display:flex;
    flex-wrap:wrap;
    gap:12px;
}

.tag{
    padding:10px 16px;

    border-radius:30px;

    background:rgba(255,255,255,0.04);

    border:1px solid rgba(255,255,255,0.06);

    color:#fff;

    font-size:0.83rem;

    font-weight:600;
}

/* APPLY */

.apply-area{
    min-width:260px;

    display:flex;
    flex-direction:column;
    justify-content:center;
}

.apply-btn{
    width:100%;

    padding:16px;

    border:none;

    border-radius:18px;

    background:
    linear-gradient(
        135deg,
        #d4af37,
        #f5d173
    );

    color:#000;

    font-weight:700;

    font-size:0.95rem;

    cursor:pointer;

    transition:0.25s ease;
}

.apply-btn:hover{
    transform:translateY(-2px);

    box-shadow:
    0 14px 30px rgba(212,175,55,0.25);
}

/* ALERTS */

.alert{
    padding:14px 18px;
    border-radius:16px;
    margin-bottom:18px;
    font-size:0.9rem;
    font-weight:500;
}

.success{
    background:#2ea04320;
    color:#3fb950;
    border:1px solid #2ea04340;
}

.error{
    background:#ff4d4d18;
    color:#ff7b7b;
    border:1px solid #ff4d4d30;
}

/* CONTENT */

.content-grid{
    display:grid;
    grid-template-columns:2fr 1fr;
    gap:24px;
}

/* CARD */

.card{
    background:
    linear-gradient(
        145deg,
        rgba(17,17,17,0.96),
        rgba(10,10,10,0.98)
    );

    border:1px solid rgba(255,255,255,0.05);

    border-radius:28px;

    padding:28px;
}

/* SECTION TITLE */

.section-title{
    color:var(--gold-light);

    font-size:0.88rem;

    text-transform:uppercase;

    letter-spacing:1px;

    margin-bottom:20px;

    font-weight:700;
}

/* DETAILS */

.details-grid{
    display:grid;
    grid-template-columns:repeat(auto-fit,minmax(220px,1fr));
    gap:18px;
}

.detail-item{
    background:rgba(255,255,255,0.03);

    border:1px solid rgba(255,255,255,0.05);

    border-radius:18px;

    padding:18px;
}

.label{
    color:var(--muted);

    font-size:0.72rem;

    text-transform:uppercase;

    margin-bottom:8px;

    letter-spacing:0.5px;
}

.value{
    font-size:0.95rem;
    font-weight:600;
    line-height:1.5;
}

/* DESCRIPTION */

.description{
    line-height:1.9;
    color:#ededed;
    font-size:0.95rem;
}

/* UPDATE */

.update-card{
    background:rgba(255,255,255,0.03);

    border:1px solid rgba(255,255,255,0.05);

    border-radius:18px;

    padding:18px;

    margin-bottom:14px;
}

.update-card p{
    line-height:1.7;
    margin-bottom:10px;
}

.update-card small{
    color:var(--muted);
}

/* RESPONSIVE */

@media(max-width:992px){

    .content-grid{
        grid-template-columns:1fr;
    }
}

@media(max-width:768px){

    .navbar{
        padding:16px 18px;
        flex-direction:column;
        gap:14px;
    }

    .nav-links{
        gap:16px;
        flex-wrap:wrap;
        justify-content:center;
    }

    .main{
        padding:20px 16px 40px;
    }

    .hero-card,
    .card{
        padding:22px;
        border-radius:24px;
    }

    .job-title{
        font-size:1.7rem;
    }

    .job-top{
        flex-direction:column;
    }

    .details-grid{
        grid-template-columns:1fr;
    }

    .apply-area{
        width:100%;
    }

    .apply-btn{
        width:100%;
    }

    .top-actions{
        justify-content:center;
    }
}
/* NO UPDATES */

.no-updates{
    display:flex;
    flex-direction:column;
    align-items:center;
    justify-content:center;

    text-align:center;

    padding:40px 20px;

    min-height:260px;
}

.no-updates i{
    font-size:2.4rem;
    color:rgba(212,175,55,0.7);
    margin-bottom:18px;
}

.no-updates h4{
    font-size:1.05rem;
    margin-bottom:10px;
    color:#fff;
}

.no-updates p{
    color:var(--muted);
    line-height:1.7;
    font-size:0.9rem;
    max-width:260px;
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

        <a href="${pageContext.request.contextPath}/home">
            Home
        </a>

        <a href="${pageContext.request.contextPath}/jobs">
            Jobs
        </a>

        <a href="${pageContext.request.contextPath}/logout">
            Logout
        </a>

    </div>

</div>

<!-- MAIN -->

<div class="main">

<!-- BACK BUTTON -->

<div class="top-actions">

    <a class="back-btn"
       href="${pageContext.request.contextPath}/jobs">

        <i class="fa-solid fa-arrow-left"></i>

        Back To Jobs

    </a>

</div>

<!-- ALERTS -->

<c:if test="${param.applied eq 'true'}">
    <div class="alert success">
        Application submitted successfully.
    </div>
</c:if>

<c:if test="${param.alreadyApplied eq 'true'}">
    <div class="alert success">
        You have already applied for this job.
    </div>
</c:if>

<c:if test="${param.notEligible eq 'true'}">
    <div class="alert error">
        Your profile does not match this job eligibility.
    </div>
</c:if>

<!-- HERO -->

<div class="hero-card">

    <div class="job-top">

        <div class="job-info">

            <div class="job-title">
                ${job.title}
            </div>

            <div class="company">

                <i class="fa-solid fa-building"></i>

                ${job.companyName}

            </div>

            <!-- TAGS -->

            <div class="tags">

                <div class="tag">
                    ${job.location}
                </div>

                <!-- FIXED JOB TYPE -->

                <div class="tag">

                    <c:choose>

                        <c:when test="${job.jobType eq 'BOTH'}">
                            Freshers & Experienced
                        </c:when>

                        <c:otherwise>
                            ${job.jobType}
                        </c:otherwise>

                    </c:choose>

                </div>

                <div class="tag">
                    ${job.domain}
                </div>

            </div>

        </div>

        <!-- APPLY -->

        <div class="apply-area">

            <c:choose>

                <c:when test="${alreadyApplied}">

                    <div class="alert success">
                        Already Applied
                    </div>

                </c:when>

                <c:otherwise>

                    <form action="${pageContext.request.contextPath}/jobs/apply"
                          method="post">

                        <input type="hidden"
                               name="jobId"
                               value="${job.id}">

                        <button class="apply-btn" type="submit">
                            Apply Now
                        </button>

                    </form>

                </c:otherwise>

            </c:choose>

        </div>

    </div>

</div>

<!-- CONTENT -->

<div class="content-grid">

    <!-- LEFT -->

    <div>

        <!-- DETAILS -->

        <div class="card">

            <div class="section-title">
                Job Details
            </div>

            <div class="details-grid">

                <div class="detail-item">

                    <div class="label">
                        Minimum Experience
                    </div>

                    <div class="value">
                        ${job.minExperience}
                    </div>

                </div>

                <div class="detail-item">

                    <div class="label">
                        Minimum Percentage
                    </div>

                    <div class="value">
                        ${job.minPercentage}
                    </div>

                </div>

                <div class="detail-item">

                    <div class="label">
                        Eligible Branch
                    </div>

                    <div class="value">
                        ${job.eligibleBranch}
                    </div>

                </div>

                <div class="detail-item">

                    <div class="label">
                        Eligible Year Of Passout
                    </div>

                    <div class="value">
                        ${job.eligibleYearOfPassout}
                    </div>

                </div>

            </div>

        </div>

        <!-- DESCRIPTION -->

        <div class="card" style="margin-top:24px;">

            <div class="section-title">
                Job Description
            </div>

            <div class="description">
                ${job.description}
            </div>

        </div>

        <!-- ELIGIBILITY -->

        <div class="card" style="margin-top:24px;">

            <div class="section-title">
                Eligibility Criteria
            </div>

            <div class="description">
                ${job.eligibility}
            </div>

        </div>

    </div>

    <!-- RIGHT -->

<div>

    <div class="card">

        <div class="section-title">
            Latest Updates
        </div>

        <!-- IF UPDATES EXIST -->

        <c:if test="${not empty updates}">

            <c:forEach items="${updates}" var="u">

                <div class="update-card">

                    <p>
                        ${u.updateText}
                    </p>

                    <small>
                        ${u.createdAt}
                    </small>

                </div>

            </c:forEach>

        </c:if>

        <!-- NO UPDATES -->

        <c:if test="${empty updates}">

            <div class="no-updates">

                <i class="fa-regular fa-bell-slash"></i>

                <h4>
                    No Updates Yet
                </h4>

                <p>
                    There are currently no updates available for this job.
                </p>

            </div>

        </c:if>

    </div>

</div>
</body>
</html>