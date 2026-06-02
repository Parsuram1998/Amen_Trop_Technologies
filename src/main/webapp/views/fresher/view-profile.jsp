<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Fresher Profile</title>

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
    --sidebar:#0d0d0d;
    --card:#111111;
    --card2:#151515;
    --hover:#1b1b1b;
    --border:rgba(255,255,255,0.06);
    --text:#ffffff;
    --muted:#9ca3af;
    --gold:#d4af37;
    --gold-light:#f5d77a;
    --blue:#58a6ff;
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

    display:flex;

    overflow-x:hidden;
}

/* SIDEBAR */

.sidebar{
    width:260px;

    background:rgba(10,10,10,0.96);

    backdrop-filter:blur(18px);

    border-right:1px solid var(--border);

    padding:28px 20px;

    position:sticky;

    top:0;

    height:100vh;
}

.logo{
    font-size:1.7rem;
    font-weight:700;
    color:var(--gold);
    margin-bottom:42px;
    letter-spacing:1px;
}

.nav{
    display:flex;
    flex-direction:column;
    gap:12px;
}

.nav a{
    display:flex;
    align-items:center;
    gap:12px;
    padding:14px 16px;
    border-radius:16px;
    color:var(--muted);
    text-decoration:none;
    transition:0.25s ease;
    font-size:14px;
    font-weight:500;
}

.nav a i{
    width:20px;
}

.nav a:hover{
    background:rgba(212,175,55,0.12);
    color:#fff;
    transform:translateX(3px);
}

.nav a.active{
    background:
    linear-gradient(
        135deg,
        rgba(212,175,55,0.16),
        rgba(212,175,55,0.08)
    );

    border:1px solid rgba(212,175,55,0.15);

    color:var(--gold-light);
}

/* MAIN */

.main{
    flex:1;
    padding:50px;
}

/* HEADER */

.page-header{
    margin-bottom:28px;
}

.page-header h1{
    font-size:2rem;
    font-weight:700;
    margin-bottom:10px;
}

.page-header p{
    color:var(--muted);
    font-size:0.95rem;
}

/* PROFILE CARD */

.profile-card{
    background:
    linear-gradient(
        145deg,
        rgba(17,17,17,0.96),
        rgba(11,11,11,0.98)
    );

    border:1px solid rgba(255,255,255,0.05);

    border-radius:30px;

    padding:35px;

    box-shadow:
    0 10px 40px rgba(0,0,0,0.7),
    0 0 0 1px rgba(255,255,255,0.02);

    backdrop-filter:blur(18px);
}

/* TOP */

.top{
    display:flex;
    align-items:center;
    gap:28px;
    margin-bottom:35px;
    flex-wrap:wrap;
}

.profile-photo{
    width:150px;
    height:150px;
    border-radius:24px;
    object-fit:cover;
    border:3px solid rgba(212,175,55,0.2);

    box-shadow:
    0 10px 35px rgba(0,0,0,0.4);
}

.top-info h2{
    font-size:1.8rem;
    margin-bottom:10px;
}

.top-info p{
    color:var(--muted);
    margin-bottom:16px;
}

/* BADGES */

.badges{
    display:flex;
    gap:12px;
    flex-wrap:wrap;
}

.badge{
    padding:8px 14px;
    border-radius:30px;
    font-size:0.82rem;
    font-weight:600;
}

.status{
    background:rgba(212,175,55,0.12);
    color:var(--gold-light);
    border:1px solid rgba(212,175,55,0.2);
}

.bond{
    background:rgba(88,166,255,0.12);
    color:var(--blue);
    border:1px solid rgba(88,166,255,0.18);
}

/* SECTION */

.section-title{
    margin:30px 0 18px;
    color:var(--gold-light);
    font-size:0.95rem;
    font-weight:700;
    text-transform:uppercase;
    letter-spacing:1px;
}

/* GRID */

.grid{
    display:grid;
    grid-template-columns:repeat(auto-fit,minmax(250px,1fr));
    gap:20px;
}

.full{
    grid-column:span 2;
}

/* ITEM */

.item{
    background:rgba(255,255,255,0.03);

    border:1px solid rgba(255,255,255,0.05);

    border-radius:22px;

    padding:22px;

    transition:0.25s ease;
}

.item:hover{
    transform:translateY(-2px);

    border-color:rgba(212,175,55,0.18);
}

.label{
    font-size:0.78rem;
    color:var(--muted);
    margin-bottom:10px;
    text-transform:uppercase;
    letter-spacing:0.5px;
}

.value{
    font-size:1rem;
    font-weight:600;
    line-height:1.5;
}

/* ACTIONS */

.actions{
    margin-top:35px;
    display:flex;
    gap:16px;
    flex-wrap:wrap;
}

.btn{
    padding:14px 22px;
    border-radius:18px;
    text-decoration:none;
    font-weight:600;
    transition:0.25s ease;
    font-size:0.92rem;
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

/* EMPTY */

.empty{
    padding:50px;
    text-align:center;

    background:rgba(255,255,255,0.03);

    border:1px solid rgba(255,255,255,0.05);

    border-radius:24px;
}

.empty h3{
    margin-bottom:12px;
}

.empty p{
    color:var(--muted);
}

/* RESPONSIVE */

@media(max-width:992px){

    .main{
        padding:30px;
    }

    .profile-card{
        padding:28px;
    }
}

@media(max-width:768px){

    body{
        flex-direction:column;
    }

    .sidebar{
        width:100%;
        height:auto;
        position:relative;
        border-right:none;
        border-bottom:1px solid var(--border);
    }

    .main{
        padding:18px;
    }

    .profile-card{
        padding:22px;
        border-radius:24px;
    }

    .top{
        flex-direction:column;
        align-items:flex-start;
    }

    .grid{
        grid-template-columns:1fr;
    }

    .full{
        grid-column:span 1;
    }

    .page-header h1{
        font-size:1.6rem;
    }
}

@media(max-width:480px){

    .sidebar{
        padding:20px 16px;
    }

    .logo{
        font-size:1.4rem;
    }

    .nav a{
        padding:12px 14px;
        font-size:13px;
    }

    .profile-photo{
        width:120px;
        height:120px;
    }

    .top-info h2{
        font-size:1.4rem;
    }

    .item{
        padding:18px;
    }

    .btn{
        width:100%;
        text-align:center;
    }
}
/* DOCUMENTS */

.documents-grid{
    display:grid;
    grid-template-columns:repeat(auto-fit,minmax(180px,1fr));
    gap:18px;
}

.document-card{
    background:
    linear-gradient(
        145deg,
        rgba(255,255,255,0.03),
        rgba(255,255,255,0.015)
    );

    border:1px solid rgba(255,255,255,0.05);

    border-radius:22px;

    padding:22px 18px;

    text-align:center;

    transition:0.25s ease;

    min-height:190px;

    display:flex;

    flex-direction:column;

    justify-content:center;

    align-items:center;
}

.document-card:hover{
    transform:translateY(-4px);

    border-color:rgba(212,175,55,0.18);

    box-shadow:
    0 10px 30px rgba(0,0,0,0.28);
}

.doc-icon{
    width:62px;
    height:62px;

    border-radius:18px;

    background:rgba(212,175,55,0.10);

    display:flex;

    align-items:center;

    justify-content:center;

    margin-bottom:16px;
}

.doc-icon i{
    font-size:1.5rem;
    color:var(--gold-light);
}

.doc-title{
    font-size:0.95rem;
    font-weight:700;
    margin-bottom:16px;
}

.doc-action{
    display:inline-flex;

    align-items:center;

    justify-content:center;

    padding:11px 18px;

    border-radius:14px;

    background:
    linear-gradient(
        135deg,
        #d4af37,
        #f5d173
    );

    color:#000;

    text-decoration:none;

    font-size:0.85rem;

    font-weight:700;

    transition:0.25s ease;
}

.doc-action:hover{
    transform:translateY(-2px);

    box-shadow:
    0 10px 20px rgba(212,175,55,0.25);
}
</style>
</head>

<body>

<!-- SIDEBAR -->

<div class="sidebar">

    <div class="logo">
        AMENTROP
    </div>

    <div class="nav">

        <a href="${pageContext.request.contextPath}/fresher/dashboard">
            <i class="fa-solid fa-house"></i>
            Dashboard
        </a>

        <a href="#" class="active">
            <i class="fa-solid fa-user"></i>
            View Profile
        </a>

        <a href="${pageContext.request.contextPath}/jobs">
            <i class="fa-solid fa-briefcase"></i>
            Jobs
        </a>

        <a href="${pageContext.request.contextPath}/fresher/edit-profile">
            <i class="fa-solid fa-pen"></i>
            Edit Profile
        </a>

        <a href="${pageContext.request.contextPath}/logout">
            <i class="fa-solid fa-right-from-bracket"></i>
            Logout
        </a>

    </div>

</div>

<!-- MAIN -->

<div class="main">

<c:if test="${profile != null}">

<div style="width:100%;">

<div class="page-header">

    <h1>Fresher Profile</h1>

    <p>
        View your complete fresher profile details and uploaded documents.
    </p>

</div>

<div class="profile-card">

<!-- TOP -->

<div class="top">

<c:if test="${profile.photoPath != null}">
    <img class="profile-photo"
         src="${pageContext.request.contextPath}/files/${profile.photoPath}">
</c:if>

<div class="top-info">

    <h2>${user.fullName}</h2>

    <p>${profile.skillSet}</p>

    <div class="badges">

        <span class="badge status">
            ${profile.status}
        </span>

        <span class="badge bond">

            <c:choose>

                <c:when test="${profile.readyForBond}">
                    Ready For Bond
                </c:when>

                <c:otherwise>
                    No Bond
                </c:otherwise>

            </c:choose>

        </span>

    </div>

</div>

</div>

<!-- PROFESSIONAL -->

<div class="section-title">
    Professional Details
</div>

<div class="grid">

    <div class="item">
        <div class="label">Skill Set</div>
        <div class="value">${profile.skillSet}</div>
    </div>

    <div class="item">
        <div class="label">Domain Interested</div>
        <div class="value">${profile.domainInterested}</div>
    </div>

    <div class="item full">
        <div class="label">Preferred Locations</div>
        <div class="value">${profile.preferredLocations}</div>
    </div>

</div>

<!-- EDUCATION -->

<div class="section-title">
    Education Details
</div>

<div class="grid">

    <div class="item">
        <div class="label">10th Percentage</div>
        <div class="value">${profile.tenthPercentage}%</div>
    </div>

    <div class="item">
        <div class="label">12th Percentage</div>
        <div class="value">${profile.twelfthPercentage}%</div>
    </div>

    <div class="item">
        <div class="label">Degree Percentage</div>
        <div class="value">${profile.degreePercentage}%</div>
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

</div>

<!-- DOCUMENTS -->

<!-- DOCUMENTS -->

<div class="card">

    <div class="section-title">
        Uploaded Documents
    </div>

    <div class="documents-grid">

        <!-- RESUME -->

        <c:if test="${profile.resumePath != null}">

            <div class="document-card">

                <div class="doc-icon">
                    <i class="fa-solid fa-file-lines"></i>
                </div>

                <div class="doc-title">
                    Resume
                </div>

                <a class="doc-action"
                   target="_blank"
                   href="${pageContext.request.contextPath}/files/${profile.resumePath}">

                    View Resume

                </a>

            </div>

        </c:if>

        <!-- VIDEO -->

        <c:if test="${profile.videoResumePath != null}">

            <div class="document-card">

                <div class="doc-icon">
                    <i class="fa-solid fa-video"></i>
                </div>

                <div class="doc-title">
                    Video Resume
                </div>

                <a class="doc-action"
                   target="_blank"
                   href="${pageContext.request.contextPath}/files/${profile.videoResumePath}">

                    View Video

                </a>

            </div>

        </c:if>

        <!-- PHOTO -->

        <c:if test="${profile.photoPath != null}">

            <div class="document-card">

                <div class="doc-icon">
                    <i class="fa-solid fa-image"></i>
                </div>

                <div class="doc-title">
                    Photo
                </div>

                <a class="doc-action"
                   target="_blank"
                   href="${pageContext.request.contextPath}/files/${profile.photoPath}">

                    View Photo

                </a>

            </div>

        </c:if>

        <!-- AADHAR -->

        <c:if test="${profile.aadharPath != null}">

            <div class="document-card">

                <div class="doc-icon">
                    <i class="fa-solid fa-id-card"></i>
                </div>

                <div class="doc-title">
                    Aadhar
                </div>

                <a class="doc-action"
                   target="_blank"
                   href="${pageContext.request.contextPath}/files/${profile.aadharPath}">

                    View Aadhar

                </a>

            </div>

        </c:if>

    </div>

</div>

<!-- ACTIONS -->

<div class="actions">

    <a class="btn primary"
       href="${pageContext.request.contextPath}/fresher/edit-profile">

        Edit Profile

    </a>

</div>

</div>

</div>

</c:if>

<c:if test="${profile == null}">

<div class="empty">

    <h3>No Profile Found</h3>

    <p>
        Create your fresher profile to start applying for jobs.
    </p>

</div>

</c:if>

</div>

</body>
</html>