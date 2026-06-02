<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Professional Profile</title>

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
    --sidebar:#0e0e0e;
    --card:#111111;
    --hover:#1c1c1c;
    --border:rgba(255,255,255,0.06);
    --text:#ffffff;
    --muted:#9ca3af;
    --gold:#d4af37;
    --gold-light:#f5d77a;
}

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
}

html{
    background:#060606;
}

body{
    font-family:'Inter',sans-serif;

    background:
    radial-gradient(circle at top left,#1a1a1a 0%,#090909 45%),
    linear-gradient(to bottom,#060606,#020202);

    color:var(--text);

    min-height:100vh;

    overflow-x:hidden;

    overscroll-behavior:none;
}

/* LAYOUT */

.layout{
    display:flex;
    min-height:100vh;
}

/* SIDEBAR */

.sidebar{
    width:260px;

    background:
    linear-gradient(
        to bottom,
        #121212,
        #090909
    );

    border-right:1px solid rgba(255,255,255,0.05);

    padding:26px 18px;

    position:sticky;
    top:0;

    height:100vh;

    flex-shrink:0;
}

.logo{
    font-size:1.8rem;

    font-weight:800;

    color:var(--gold);

    margin-bottom:34px;

    letter-spacing:1px;
}

/* NAV */

.nav{
    display:flex;
    flex-direction:column;
    gap:10px;
}

.nav a{
    display:flex;
    align-items:center;
    gap:12px;

    padding:13px 15px;

    border-radius:16px;

    color:#d1d5db;

    text-decoration:none;

    font-size:0.92rem;

    font-weight:600;

    transition:0.25s ease;
}

.nav a:hover{
    background:rgba(212,175,55,0.10);

    color:var(--gold-light);
}

.nav a.active{
    background:rgba(212,175,55,0.14);

    color:var(--gold-light);
}

/* MAIN */

.main{
    flex:1;

    padding:34px 24px 50px;
}

/* HEADER */

.header{
    margin-bottom:24px;
}

.header-badge{
    display:inline-flex;
    align-items:center;
    gap:8px;

    padding:9px 14px;

    border-radius:30px;

    background:rgba(212,175,55,0.10);

    border:1px solid rgba(212,175,55,0.14);

    color:var(--gold-light);

    font-size:0.78rem;

    font-weight:700;

    margin-bottom:16px;
}

.header h2{
    font-size:2.5rem;

    font-weight:800;

    margin-bottom:10px;

    line-height:1.1;
}

.header p{
    color:var(--muted);

    line-height:1.8;

    max-width:700px;

    font-size:0.92rem;
}

/* PROFILE CARD */

.profile-card{
    background:
    linear-gradient(
        145deg,
        rgba(18,18,18,0.96),
        rgba(10,10,10,0.98)
    );

    border:1px solid rgba(255,255,255,0.05);

    border-radius:28px;

    padding:28px;

    box-shadow:
    0 16px 40px rgba(0,0,0,0.42);
}

/* TOP */

.top{
    display:flex;
    justify-content:space-between;
    align-items:flex-start;

    gap:20px;

    margin-bottom:22px;

    padding-bottom:20px;

    border-bottom:1px solid rgba(255,255,255,0.05);
}

.title{
    font-size:1.8rem;

    font-weight:700;

    line-height:1.3;

    margin-bottom:6px;
}

.subtitle{
    color:var(--muted);

    font-size:0.92rem;
}

/* BADGES */

.badges{
    display:flex;
    flex-wrap:wrap;
    gap:10px;
}

.badge{
    padding:9px 14px;

    border-radius:30px;

    font-size:0.75rem;

    font-weight:700;
}

.verified{
    background:#2ea04322;
    color:#3fb950;
}

.notice{
    background:#1f6feb22;
    color:#58a6ff;
}

/* GRID */

.grid{
    display:grid;

    grid-template-columns:repeat(auto-fit,minmax(240px,1fr));

    gap:14px;
}

/* ITEM */

.item{
    background:
    linear-gradient(
        145deg,
        rgba(255,255,255,0.03),
        rgba(255,255,255,0.015)
    );

    border:1px solid rgba(255,255,255,0.05);

    border-radius:20px;

    padding:15px 16px;
}

.full{
    grid-column:1/-1;
}

/* LABEL */

.label{
    color:var(--muted);

    font-size:0.72rem;

    text-transform:uppercase;

    letter-spacing:0.5px;

    margin-bottom:6px;
}

/* VALUE */

.value{
    font-size:0.94rem;

    font-weight:600;

    line-height:1.5;

    word-break:break-word;
}

/* LINKS */

.link-btn{
    display:inline-flex;
    align-items:center;
    gap:10px;

    padding:11px 16px;

    border-radius:14px;

    text-decoration:none;

    font-size:0.84rem;

    font-weight:700;

    transition:0.25s ease;

    border:1px solid rgba(212,175,55,0.18);

    background:rgba(212,175,55,0.08);

    color:var(--gold-light);
}

.link-btn:hover{
    transform:translateY(-2px);

    background:rgba(212,175,55,0.16);
}

/* ACTIONS */

.actions{
    margin-top:26px;

    display:flex;
    gap:12px;

    flex-wrap:wrap;
}

/* BUTTONS */

.btn{
    display:inline-flex;
    align-items:center;
    justify-content:center;
    gap:10px;

    padding:13px 20px;

    border-radius:16px;

    text-decoration:none;

    font-size:0.88rem;

    font-weight:700;

    transition:0.25s ease;
}

.primary{
    background:
    linear-gradient(
        135deg,
        #d4af37,
        #f5d173
    );

    color:#000;
}

.secondary{
    border:1px solid rgba(255,255,255,0.08);

    background:rgba(255,255,255,0.03);

    color:#fff;
}

.btn:hover{
    transform:translateY(-2px);
}

/* MOBILE */

@media(max-width:950px){

    .layout{
        flex-direction:column;
    }

    .sidebar{
        width:100%;

        height:auto;

        position:relative;

        border-right:none;

        border-bottom:1px solid rgba(255,255,255,0.05);
    }

    .nav{
        flex-direction:row;

        overflow-x:auto;
    }

    .nav a{
        white-space:nowrap;
    }

    .top{
        flex-direction:column;
    }

    .header h2{
        font-size:2rem;
    }
}

@media(max-width:600px){

    .main{
        padding:22px 14px 36px;
    }

    .profile-card{
        padding:22px 18px;

        border-radius:24px;
    }

    .header h2{
        font-size:1.8rem;
    }

    .actions{
        flex-direction:column;
    }

    .btn{
        width:100%;
    }
}

</style>

</head>

<body>

<div class="layout">

    <!-- SIDEBAR -->

    <div class="sidebar">

        <div class="logo">
            AMENTROP
        </div>

        <div class="nav">

            <a href="${pageContext.request.contextPath}/professional/dashboard">
                <i class="fa-solid fa-chart-line"></i>
                Dashboard
            </a>

            <a href="#"
               class="active">
                <i class="fa-solid fa-user"></i>
                View Profile
            </a>

            <a href="${pageContext.request.contextPath}/jobs">
                <i class="fa-solid fa-briefcase"></i>
                View Jobs
            </a>

            <a href="${pageContext.request.contextPath}/professional/messages">
                <i class="fa-solid fa-envelope"></i>
                Messages
            </a>

            <a href="${pageContext.request.contextPath}/logout">
                <i class="fa-solid fa-right-from-bracket"></i>
                Logout
            </a>

        </div>

    </div>

    <!-- MAIN -->

    <div class="main">

        <div class="header">

            <div class="header-badge">
                <i class="fa-solid fa-user-tie"></i>
                Professional Profile
            </div>

            <h2>
                Your Professional Identity
            </h2>

            <p>
                Showcase your skills, experience,
                and achievements professionally.
            </p>

        </div>

        <!-- PROFILE CARD -->

        <div class="profile-card">

            <!-- TOP -->

            <div class="top">

                <div>

                    <div class="title">
                        ${profile.currentRole}
                    </div>

                    <div class="subtitle">
                        ${profile.companyName}
                    </div>

                </div>

                <div class="badges">

                    <span class="badge verified">

                        <c:choose>

                            <c:when test="${profile.verified}">
                                Verified
                            </c:when>

                            <c:otherwise>
                                Not Verified
                            </c:otherwise>

                        </c:choose>

                    </span>

                    <span class="badge notice">
                        ${profile.noticePeriod}
                    </span>

                </div>

            </div>

            <!-- GRID -->

            <div class="grid">

                <div class="item">
                    <div class="label">Full Name</div>
                    <div class="value">${profile.user.fullName}</div>
                </div>

                <div class="item">
                    <div class="label">Email</div>
                    <div class="value">${profile.user.email}</div>
                </div>

                <div class="item">
                    <div class="label">Phone</div>
                    <div class="value">${profile.user.phone}</div>
                </div>

                <div class="item">
                    <div class="label">Experience</div>
                    <div class="value">${profile.experienceYears} Years</div>
                </div>

                <div class="item">
                    <div class="label">Qualification</div>
                    <div class="value">${profile.qualification}</div>
                </div>

                <div class="item">
                    <div class="label">Branch</div>
                    <div class="value">${profile.branch}</div>
                </div>

                <div class="item">
                    <div class="label">Year Of Passout</div>
                    <div class="value">${profile.yearOfPassout}</div>
                </div>

                <div class="item">
                    <div class="label">Domain Looking For</div>
                    <div class="value">${profile.domainLooking}</div>
                </div>

                <div class="item">
                    <div class="label">Current CTC</div>
                    <div class="value">₹ ${profile.currentCtc} LPA</div>
                </div>

                <div class="item">
                    <div class="label">Expected CTC</div>
                    <div class="value">₹ ${profile.expectedCtc} LPA</div>
                </div>

                <div class="item">
                    <div class="label">Preferred Locations</div>
                    <div class="value">${profile.preferredLocations}</div>
                </div>

                <div class="item">
                    <div class="label">Company Location</div>
                    <div class="value">${profile.companyLocation}</div>
                </div>

                <div class="item">
                    <div class="label">Profile Status</div>

                    <div class="value">

                        <c:choose>

                            <c:when test="${profile.active}">
                                Active
                            </c:when>

                            <c:otherwise>
                                Inactive
                            </c:otherwise>

                        </c:choose>

                    </div>
                </div>

                <div class="item">
                    <div class="label">Approval Status</div>

                    <div class="value">

                        <c:choose>

                            <c:when test="${profile.approved}">
                                Approved
                            </c:when>

                            <c:otherwise>
                                Pending Approval
                            </c:otherwise>

                        </c:choose>

                    </div>
                </div>

                <div class="item full">

                    <div class="label">
                        Skill Set
                    </div>

                    <div class="value">
                        ${profile.skillSet}
                    </div>

                </div>

                <div class="item">

                    <div class="label">
                        LinkedIn
                    </div>

                    <div class="value">

                        <c:choose>

                            <c:when test="${not empty profile.linkedIn}">

                                <a href="${profile.linkedIn}"
                                   target="_blank"
                                   class="link-btn">

                                    <i class="fa-brands fa-linkedin"></i>

                                    Open LinkedIn

                                </a>

                            </c:when>

                            <c:otherwise>
                                Not Added
                            </c:otherwise>

                        </c:choose>

                    </div>

                </div>

                <div class="item">

                    <div class="label">
                        Portfolio / GitHub
                    </div>

                    <div class="value">

                        <c:choose>

                            <c:when test="${not empty profile.portfolio}">

                                <a href="${profile.portfolio}"
                                   target="_blank"
                                   class="link-btn">

                                    <i class="fa-solid fa-globe"></i>

                                    Open Portfolio

                                </a>

                            </c:when>

                            <c:otherwise>
                                Not Added
                            </c:otherwise>

                        </c:choose>

                    </div>

                </div>

            </div>

            <!-- ACTIONS -->

            <div class="actions">

                <c:if test="${profile.resumePath != null}">

                    <a class="btn secondary"
                       target="_blank"
                       href="${pageContext.request.contextPath}/files/${profile.resumePath}">

                        <i class="fa-solid fa-download"></i>

                        Download Resume

                    </a>

                </c:if>

                <a class="btn primary"
                   href="${pageContext.request.contextPath}/professional/edit-profile">

                    <i class="fa-solid fa-pen"></i>

                    Edit Profile

                </a>

            </div>

            <c:if test="${empty profile.resumePath}">

                <div style="
                    margin-top:14px;
                    color:#9ca3af;
                    font-size:0.9rem;
                ">
                    Resume not uploaded yet.
                </div>

            </c:if>

        </div>

    </div>

</div>

</body>
</html>