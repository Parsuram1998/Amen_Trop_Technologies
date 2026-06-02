<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Fresher Profile</title>

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
    --danger:#ff5d5d;
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
    display:flex;
    justify-content:center;
}

/* WRAPPER */

.wrapper{
    width:100%;
    max-width:1150px;
}

/* HEADER */

.page-header{
    margin-bottom:26px;
}

.page-header h1{
    font-size:2.2rem;
    font-weight:700;
    margin-bottom:10px;
}

.page-header p{
    color:var(--muted);
    font-size:0.96rem;
}

/* CARD */

.form-card{
    background:
    linear-gradient(
        145deg,
        rgba(17,17,17,0.96),
        rgba(11,11,11,0.98)
    );

    border:1px solid rgba(255,255,255,0.05);

    border-radius:30px;

    padding:40px;

    box-shadow:
    0 10px 40px rgba(0,0,0,0.7),
    0 0 0 1px rgba(255,255,255,0.02);

    backdrop-filter:blur(18px);
}

/* SECTION TITLE */

.section-title{
    margin:34px 0 18px;
    color:var(--gold-light);
    font-size:0.95rem;
    font-weight:700;
    text-transform:uppercase;
    letter-spacing:1px;
}

/* GRID */

.form-grid{
    display:grid;
    grid-template-columns:repeat(auto-fit,minmax(260px,1fr));
    gap:24px;
    align-items:start;
}

.full{
    grid-column:span 2;
}

/* LABEL */

label{
    display:block;
    margin-bottom:10px;
    color:var(--muted);
    font-size:0.84rem;
    font-weight:600;
}

/* REQUIRED */

.required{
    color:var(--danger);
}

/* INPUT */

input[type="text"],
input[type="number"],
input[type="file"]{
    width:100%;
    padding:14px 15px;
    border-radius:18px;
    border:1px solid rgba(255,255,255,0.06);
    background:rgba(255,255,255,0.03);
    color:#fff;
    font-size:0.94rem;
    transition:0.25s ease;
}

input::placeholder{
    color:#6b7280;
}

input:focus{
    outline:none;

    border-color:rgba(212,175,55,0.45);

    background:rgba(255,255,255,0.05);

    box-shadow:
    0 0 0 4px rgba(212,175,55,0.10),
    0 10px 30px rgba(0,0,0,0.28);
}

/* CHECKBOX */

.checkbox-box{
    display:flex;
    align-items:center;
    gap:12px;

    padding:16px;

    background:rgba(255,255,255,0.03);

    border:1px solid rgba(255,255,255,0.04);

    border-radius:18px;
}

.checkbox-box input{
    width:18px;
    height:18px;
}

/* FILE BOX */

.file-box{
    padding:22px;
    border-radius:22px;

    background:rgba(255,255,255,0.025);

    border:1px dashed rgba(255,255,255,0.08);

    transition:0.25s ease;
}

.file-box:hover{
    border-color:rgba(212,175,55,0.4);
    transform:translateY(-2px);
}

/* BUTTON */

.submit-btn{
    margin-top:36px;
    width:100%;
    border:none;

    background:
    linear-gradient(
        135deg,
        #d4af37,
        #f5d173
    );

    color:#000;

    padding:17px;

    border-radius:20px;

    font-size:1rem;

    font-weight:700;

    cursor:pointer;

    transition:0.3s ease;
}

.submit-btn:hover{
    transform:translateY(-3px);

    box-shadow:
    0 16px 40px rgba(212,175,55,0.28);
}

/* RESPONSIVE */

@media(max-width:992px){

    .main{
        padding:30px;
    }

    .form-card{
        padding:30px;
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

    .form-card{
        padding:22px;
        border-radius:24px;
    }

    .form-grid{
        grid-template-columns:1fr;
        gap:18px;
    }

    .full{
        grid-column:span 1;
    }

    .page-header h1{
        font-size:1.7rem;
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

    .form-card{
        padding:18px;
    }

    input[type="text"],
    input[type="number"],
    input[type="file"]{
        padding:12px 13px;
        border-radius:15px;
    }

    .submit-btn{
        padding:15px;
        font-size:0.95rem;
    }
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

        <a href="${pageContext.request.contextPath}/jobs">
            <i class="fa-solid fa-briefcase"></i>
            Jobs
        </a>

        <a href="${pageContext.request.contextPath}/fresher/profile"
           class="active">
            <i class="fa-solid fa-user-plus"></i>
            Create Profile
        </a>

        <a href="${pageContext.request.contextPath}/logout">
            <i class="fa-solid fa-right-from-bracket"></i>
            Logout
        </a>

    </div>

</div>

<!-- MAIN -->

<div class="main">

<div class="wrapper">

<div class="page-header">

    <h1>Create Fresher Profile</h1>

    <p>
        Build a strong fresher profile to increase your visibility to recruiters.
    </p>

</div>

<form action="${pageContext.request.contextPath}/fresher/profile"
      method="post"
      enctype="multipart/form-data">

<div class="form-card">

<!-- BASIC DETAILS -->

<div class="section-title">
    Basic Details
</div>

<div class="form-grid">

    <div>
        <label>
            Skill Set
            <span class="required">*</span>
        </label>

        <input type="text"
               name="skillSet"
               placeholder="Java, Spring Boot, MySQL"
               required/>
    </div>

    <div>
        <label>
            Domain Interested
            <span class="required">*</span>
        </label>

        <input type="text"
               name="domainInterested"
               placeholder="Backend Development"
               required/>
    </div>

    <div class="full">
        <label>
            Preferred Locations
        </label>

        <input type="text"
               name="preferredLocations"
               placeholder="Bangalore, Chennai, Hyderabad"/>
    </div>

    <div class="checkbox-box full">

        <input type="checkbox"
               name="readyForBond"
               value="true"/>

        <label>
            Ready For Bond
        </label>

    </div>

</div>

<!-- EDUCATION -->

<div class="section-title">
    Education
</div>

<div class="form-grid">

    <div>
        <label>
            10th Percentage
            <span class="required">*</span>
        </label>

        <input type="number"
               step="0.01"
               name="tenth"
               placeholder="85"
               required/>
    </div>

    <div>
        <label>
            12th Percentage
            <span class="required">*</span>
        </label>

        <input type="number"
               step="0.01"
               name="twelfth"
               placeholder="82"
               required/>
    </div>

    <div>
        <label>
            Degree Percentage
            <span class="required">*</span>
        </label>

        <input type="number"
               step="0.01"
               name="degree"
               placeholder="78"
               required/>
    </div>

    <div>
        <label>
            Qualification
            <span class="required">*</span>
        </label>

        <input type="text"
               name="qualification"
               placeholder="B.E / B.Tech / MBA"
               required/>
    </div>

    <div>
        <label>
            Branch
            <span class="required">*</span>
        </label>

        <input type="text"
               name="branch"
               placeholder="Computer Science"
               required/>
    </div>

    <div>
        <label>
            Year Of Passout
            <span class="required">*</span>
        </label>

        <input type="number"
               name="yearOfPassout"
               placeholder="2026"
               required/>
    </div>

</div>

<!-- DOCUMENTS -->

<div class="section-title">
    Upload Documents
</div>

<div class="form-grid">

    <div class="file-box">

        <label>
            Resume
        </label>

        <input type="file"
               name="resume"/>
    </div>

    <div class="file-box">

        <label>
            Video Resume
        </label>

        <input type="file"
               name="video"/>
    </div>

    <div class="file-box">

        <label>
            Photo
        </label>

        <input type="file"
               name="photo"/>
    </div>

    <div class="file-box">

        <label>
            Aadhar
        </label>

        <input type="file"
               name="aadhar"/>
    </div>

</div>

<button type="submit" class="submit-btn">
    Create Profile
</button>

</div>

</form>

</div>

</div>

</body>
</html>