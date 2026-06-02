<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Professional Profile</title>

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
    radial-gradient(circle at top left,#1a1a1a 0%,#080808 45%),
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
    width:270px;

    background:
    linear-gradient(
        to bottom,
        #121212,
        #090909
    );

    border-right:1px solid rgba(255,255,255,0.05);

    padding:30px 20px;

    position:sticky;
    top:0;

    height:100vh;

    flex-shrink:0;
}

.sidebar-logo{
    font-size:1.9rem;

    font-weight:800;

    color:var(--gold);

    margin-bottom:40px;

    letter-spacing:1px;
}

/* SIDEBAR LINKS */

.sidebar-links{
    display:flex;
    flex-direction:column;
    gap:12px;
}

.sidebar-links a{
    display:flex;
    align-items:center;
    gap:12px;

    padding:14px 16px;

    border-radius:18px;

    text-decoration:none;

    color:#d1d5db;

    font-size:0.94rem;

    font-weight:600;

    transition:0.25s ease;
}

.sidebar-links a:hover{
    background:rgba(212,175,55,0.10);

    color:var(--gold-light);
}

/* PAGE */

.page{
    flex:1;

    padding:40px 26px 60px;
}

/* HEADER */

.page-header{
    margin-bottom:34px;
}

.badge{
    display:inline-flex;
    align-items:center;
    gap:8px;

    padding:10px 16px;

    border-radius:30px;

    background:rgba(212,175,55,0.10);

    border:1px solid rgba(212,175,55,0.15);

    color:var(--gold-light);

    font-size:0.82rem;

    font-weight:700;

    margin-bottom:20px;
}

.page-header h1{
    font-size:3rem;

    font-weight:800;

    margin-bottom:16px;

    line-height:1.1;
}

.page-header p{
    color:var(--muted);

    line-height:1.9;

    max-width:760px;

    font-size:0.96rem;
}

/* CARD */

.form-card{
    background:
    linear-gradient(
        145deg,
        rgba(18,18,18,0.96),
        rgba(10,10,10,0.98)
    );

    border:1px solid rgba(255,255,255,0.05);

    border-radius:34px;

    padding:36px;

    box-shadow:
    0 20px 45px rgba(0,0,0,0.45);
}

/* GRID */

.form-grid{
    display:grid;
    grid-template-columns:repeat(2,1fr);
    gap:22px;
}

/* GROUP */

.form-group{
    display:flex;
    flex-direction:column;
}

.full-width{
    grid-column:span 2;
}

/* LABEL */

label{
    margin-bottom:10px;

    font-size:0.9rem;

    font-weight:600;

    color:#f3f4f6;
}

/* INPUT */

input{
    width:100%;

    padding:15px 16px;

    border-radius:18px;

    border:1px solid rgba(255,255,255,0.06);

    background:rgba(255,255,255,0.03);

    color:#fff;

    font-size:0.92rem;

    outline:none;

    transition:0.25s ease;
}

input:focus{
    border-color:rgba(212,175,55,0.35);

    box-shadow:
    0 0 0 4px rgba(212,175,55,0.08);
}

/* FILE */

input[type="file"]{
    padding:12px;
    cursor:pointer;
}

/* BUTTON */

.button-wrap{
    margin-top:34px;

    display:flex;
    justify-content:flex-end;
}

.submit-btn{
    border:none;

    padding:15px 28px;

    border-radius:18px;

    background:
    linear-gradient(
        135deg,
        #d4af37,
        #f5d173
    );

    color:#000;

    font-size:0.95rem;

    font-weight:700;

    cursor:pointer;

    transition:0.25s ease;
}

.submit-btn:hover{
    transform:translateY(-2px);

    box-shadow:
    0 14px 30px rgba(212,175,55,0.24);
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

    .sidebar-links{
        flex-direction:row;

        overflow-x:auto;
    }

    .sidebar-links a{
        white-space:nowrap;
    }

    .form-grid{
        grid-template-columns:1fr;
    }

    .full-width{
        grid-column:span 1;
    }

    .page-header h1{
        font-size:2.2rem;
    }
}

@media(max-width:600px){

    .page{
        padding:24px 16px 40px;
    }

    .form-card{
        padding:24px 20px;

        border-radius:24px;
    }

    .page-header h1{
        font-size:1.9rem;
    }

    .submit-btn{
        width:100%;
    }

    .button-wrap{
        justify-content:stretch;
    }
}

</style>

</head>

<body>

<div class="layout">

    <!-- SIDEBAR -->

    <aside class="sidebar">

        <div class="sidebar-logo">
            AMENTROP
        </div>

        <div class="sidebar-links">

            <a href="${pageContext.request.contextPath}/professional/dashboard">

                <i class="fa-solid fa-chart-line"></i>

                Dashboard

            </a>

            <a href="${pageContext.request.contextPath}/professional/profile">

                <i class="fa-solid fa-user"></i>

                My Profile

            </a>

            <a href="${pageContext.request.contextPath}/jobs">

                <i class="fa-solid fa-briefcase"></i>

                Jobs

            </a>

            <a href="${pageContext.request.contextPath}/professional/applications">

                <i class="fa-solid fa-file-lines"></i>

                Applications

            </a>

            <a href="${pageContext.request.contextPath}/logout">

                <i class="fa-solid fa-right-from-bracket"></i>

                Logout

            </a>

        </div>

    </aside>

    <!-- MAIN -->

    <div class="page">

        <!-- HEADER -->

        <div class="page-header">

            <div class="badge">

                <i class="fa-solid fa-user-tie"></i>

                Professional Profile

            </div>

            <h1>
                Create Your Professional Profile
            </h1>

            <p>
                Build a strong professional profile to showcase your experience,
                technical skills, preferred roles, and career goals to recruiters and HR teams.
            </p>

        </div>

        <!-- FORM -->

        <div class="form-card">

            <form action="${pageContext.request.contextPath}/professional/save-profile"
                  method="post"
                  enctype="multipart/form-data">

                <div class="form-grid">

                    <!-- EXPERIENCE -->

                    <div class="form-group">

                        <label>
                            Experience Years
                        </label>

                        <input type="number"
                               name="experienceYears"
                               required>

                    </div>

                    <!-- ROLE -->

                    <div class="form-group">

                        <label>
                            Current Role
                        </label>

                        <input type="text"
                               name="currentRole"
                               required>

                    </div>

                    <!-- COMPANY -->

                    <div class="form-group">

                        <label>
                            Current Company Name
                        </label>

                        <input type="text"
                               name="companyName">

                    </div>

                    <!-- COMPANY LOCATION -->

                    <div class="form-group">

                        <label>
                            Company Location
                        </label>

                        <input type="text"
                               name="companyLocation">

                    </div>

                    <!-- CURRENT CTC -->

                    <div class="form-group">

                        <label>
                            Current CTC
                        </label>

                        <input type="number"
                               step="0.01"
                               name="currentCtc">

                    </div>

                    <!-- EXPECTED CTC -->

                    <div class="form-group">

                        <label>
                            Expected CTC
                        </label>

                        <input type="number"
                               step="0.01"
                               name="expectedCtc">

                    </div>

                    <!-- DOMAIN -->

                    <div class="form-group">

                        <label>
                            Domain Looking For
                        </label>

                        <input type="text"
                               name="domainLooking">

                    </div>

                    <!-- SKILLS -->

                    <div class="form-group">

                        <label>
                            Skill Set
                        </label>

                        <input type="text"
                               name="skillSet">

                    </div>

                    <!-- LOCATIONS -->

                    <div class="form-group">

                        <label>
                            Preferred Locations
                        </label>

                        <input type="text"
                               name="preferredLocations">

                    </div>

                    <!-- NOTICE -->

                    <div class="form-group">

                        <label>
                            Notice Period
                        </label>

                        <input type="text"
                               name="noticePeriod">

                    </div>

                    <!-- QUALIFICATION -->

                    <div class="form-group">

                        <label>
                            Qualification
                        </label>

                        <input type="text"
                               name="qualification">

                    </div>

                    <!-- BRANCH -->

                    <div class="form-group">

                        <label>
                            Branch
                        </label>

                        <input type="text"
                               name="branch">

                    </div>

                    <!-- YOP -->

                    <div class="form-group">

                        <label>
                            Year Of Passout
                        </label>

                        <input type="number"
                               name="yearOfPassout">

                    </div>

                    <!-- LINKEDIN -->

                    <div class="form-group">

                        <label>
                            LinkedIn Profile
                        </label>

                        <input type="text"
                               name="linkedIn">

                    </div>

                    <!-- PORTFOLIO -->

                    <div class="form-group full-width">

                        <label>
                            Portfolio / GitHub
                        </label>

                        <input type="text"
                               name="portfolio">

                    </div>

                    <!-- RESUME -->

                    <div class="form-group full-width">

                        <label>
                            Upload Resume
                        </label>

                        <input type="file"
                               name="resume">

                    </div>

                </div>

                <!-- BUTTON -->

                <div class="button-wrap">

                    <button type="submit"
                            class="submit-btn">

                        Save Profile

                    </button>

                </div>

            </form>

        </div>

    </div>

</div>

</body>
</html>