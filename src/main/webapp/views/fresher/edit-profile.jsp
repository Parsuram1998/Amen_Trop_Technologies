<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Fresher Profile</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
rel="stylesheet">

<style>

:root{
    --bg:#0f1115;
    --card:#171a21;
    --card2:#1e222b;
    --gold:#d4af37;
    --gold2:#f5d76e;
    --text:#f5f5f5;
    --muted:#9ca3af;
    --border:#2c3240;
}

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
}

body{
    background:var(--bg);
    color:var(--text);
    font-family:Inter,sans-serif;
    min-height:100vh;
}

.wrapper{
    display:flex;
    min-height:100vh;
}

/* SIDEBAR */

.sidebar{
    width:260px;
    background:#111318;
    border-right:1px solid var(--border);
    padding:30px 20px;
}

.logo{
    color:var(--gold);
    font-size:1.6rem;
    font-weight:700;
    margin-bottom:40px;
}

.sidebar a{
    display:flex;
    align-items:center;
    gap:12px;
    padding:14px 16px;
    margin-bottom:12px;
    text-decoration:none;
    color:#ddd;
    border-radius:12px;
    transition:0.25s;
}

.sidebar a:hover{
    background:rgba(212,175,55,0.12);
    color:var(--gold2);
}

/* MAIN */

.main{
    flex:1;
    padding:40px;
}

.page-title{
    font-size:2rem;
    font-weight:700;
    margin-bottom:30px;
    color:var(--gold2);
}

.form-card{
    background:var(--card);
    border:1px solid var(--border);
    border-radius:24px;
    padding:35px;
    box-shadow:0 8px 30px rgba(0,0,0,0.35);
}

.form-grid{
    display:grid;
    grid-template-columns:repeat(auto-fit,minmax(260px,1fr));
    gap:22px;
    align-items:start;
}

.full{
    grid-column:span 2;
}

label{
    display:block;
    margin-bottom:10px;
    color:var(--gold2);
    font-weight:600;
    font-size:0.95rem;
}

.required{
    color:#ff6b6b;
}

input[type="text"],
input[type="number"],
input[type="file"]{
    width:100%;
    padding:13px 14px;
    border-radius:14px;
    border:1px solid var(--border);
    background:var(--card2);
    color:#fff;
    font-size:0.95rem;
    transition:0.25s;
}

input:focus{
    outline:none;
    border-color:var(--gold);
    box-shadow:0 0 0 3px rgba(212,175,55,0.12);
}

.file-status{
    margin-top:10px;
}

.file-status a{
    color:var(--gold2);
    text-decoration:none;
    font-size:0.9rem;
    font-weight:600;
}

.file-status a:hover{
    text-decoration:underline;
}

.submit-btn{
    margin-top:35px;
    width:100%;
    border:none;
    background:linear-gradient(135deg,var(--gold),#b68a12);
    color:#111;
    font-weight:700;
    padding:15px;
    border-radius:16px;
    font-size:1rem;
    cursor:pointer;
    transition:0.3s;
}

.submit-btn:hover{
    transform:translateY(-2px);
    box-shadow:0 10px 25px rgba(212,175,55,0.25);
}

@media(max-width:768px){

    .sidebar{
        display:none;
    }

    .main{
        padding:20px;
    }

    .form-card{
        padding:22px;
    }

    .full{
        grid-column:span 1;
    }
}

</style>
</head>

<body>

<div class="wrapper">

    <!-- SIDEBAR -->

    <div class="sidebar">

        <div class="logo">
            Amentrop
        </div>

             <a href="${pageContext.request.contextPath}/fresher/dashboard" class="active">Dashboard</a>
        <a href="${pageContext.request.contextPath}/fresher/profile">Profile</a>
        <a href="${pageContext.request.contextPath}/jobs">Jobs</a>
        <a href="${pageContext.request.contextPath}/fresher/messages">Messages</a>
        <a href="${pageContext.request.contextPath}/logout">Logout</a>

    </div>

    <!-- MAIN -->

    <div class="main">

        <div class="page-title">
            Edit Fresher Profile
        </div>

        <div class="form-card">

            <form method="post"
                  enctype="multipart/form-data"
                  action="${pageContext.request.contextPath}/fresher/profile">

                <div class="form-grid">

                    <div>
                        <label>
                            Skill Set
                            <span class="required">*</span>
                        </label>

                        <input type="text"
                               name="skillSet"
                               value="${profile.skillSet}"
                               required>
                    </div>

                    <div>
                        <label>
                            Domain Interested
                            <span class="required">*</span>
                        </label>

                        <input type="text"
                               name="domainInterested"
                               value="${profile.domainInterested}"
                               required>
                    </div>

                    <div>
                        <label>10th Percentage</label>

                        <input type="number"
                               step="0.01"
                               name="tenth"
                               value="${profile.tenthPercentage}">
                    </div>

                    <div>
                        <label>12th Percentage</label>

                        <input type="number"
                               step="0.01"
                               name="twelfth"
                               value="${profile.twelfthPercentage}">
                    </div>

                    <div>
                        <label>Degree Percentage</label>

                        <input type="number"
                               step="0.01"
                               name="degree"
                               value="${profile.degreePercentage}">
                    </div>

                    <div>
                        <label>
                            Qualification
                            <span class="required">*</span>
                        </label>

                        <input type="text"
                               name="qualification"
                               value="${profile.qualification}"
                               placeholder="B.E / B.Tech / MBA"
                               required>
                    </div>

                    <div>
                        <label>
                            Branch
                            <span class="required">*</span>
                        </label>

                        <input type="text"
                               name="branch"
                               value="${profile.branch}"
                               placeholder="Computer Science"
                               required>
                    </div>

                    <div>
                        <label>
                            Year Of Passout
                            <span class="required">*</span>
                        </label>

                        <input type="number"
                               name="yearOfPassout"
                               value="${profile.yearOfPassout}"
                               placeholder="2026"
                               required>
                    </div>

                    <div class="full">
                        <label>
                            Preferred Locations
                            <span class="required">*</span>
                        </label>

                        <input type="text"
                               name="preferredLocations"
                               value="${profile.preferredLocations}"
                               placeholder="Bangalore, Chennai, Hyderabad"
                               required>
                    </div>

                    <!-- RESUME -->

                    <div>
                        <label>Resume</label>

                        <input type="file" name="resume">

                        <c:if test="${profile.resumePath != null}">

                            <div class="file-status">

                                <a target="_blank"
                                   href="${pageContext.request.contextPath}/files/${profile.resumePath}">

                                    View Uploaded Resume

                                </a>

                            </div>

                        </c:if>
                    </div>

                    <!-- VIDEO -->

                    <div>
                        <label>Video Resume</label>

                        <input type="file" name="video">

                        <c:if test="${profile.videoResumePath != null}">

                            <div class="file-status">

                                <a target="_blank"
                                   href="${pageContext.request.contextPath}/files/${profile.videoResumePath}">

                                    View Uploaded Video

                                </a>

                            </div>

                        </c:if>
                    </div>

                    <!-- PHOTO -->

                    <div>
                        <label>Photo</label>

                        <input type="file" name="photo">

                        <c:if test="${profile.photoPath != null}">

                            <div class="file-status">

                                <a target="_blank"
                                   href="${pageContext.request.contextPath}/files/${profile.photoPath}">

                                    View Uploaded Photo

                                </a>

                            </div>

                        </c:if>
                    </div>

                    <!-- AADHAR -->

                    <div>
                        <label>Aadhar</label>

                        <input type="file" name="aadhar">

                        <c:if test="${profile.aadharPath != null}">

                            <div class="file-status">

                                <a target="_blank"
                                   href="${pageContext.request.contextPath}/files/${profile.aadharPath}">

                                    View Uploaded Aadhar

                                </a>

                            </div>

                        </c:if>
                    </div>

                </div>

                <button class="submit-btn" type="submit">
                    Update Profile
                </button>

            </form>

        </div>

    </div>

</div>

</body>
</html>