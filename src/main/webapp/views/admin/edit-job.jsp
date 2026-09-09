<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Amentrop - Edit Job</title>

<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600&display=swap"
      rel="stylesheet">

<link rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

<style>

:root {

    --bg: #0a0a0a;
    --sidebar: #0d0d0d;
    --card: #111;
    --border: rgba(255,255,255,0.06);

    --text: #fff;
    --muted: #9ca3af;

    --gold: #d4af37;
    --gold-light: #f5d173;

}

* {

    margin: 0;
    padding: 0;

    box-sizing: border-box;

}

body {

    font-family: 'Inter', sans-serif;

    background: var(--bg);

    color: var(--text);

    display: flex;

    min-height: 100vh;

}


/* =========================
   SIDEBAR
========================= */

.sidebar {

    width: 240px;

    min-height: 100vh;

    background: var(--sidebar);

    border-right: 1px solid var(--border);

    padding: 25px;

    flex-shrink: 0;

}


.logo {

    font-size: 1.4rem;

    font-weight: 600;

    color: var(--gold);

    margin-bottom: 40px;

}


.nav a {

    display: block;

    padding: 12px;

    border-radius: 10px;

    margin-bottom: 6px;

    color: var(--muted);

    text-decoration: none;

    transition: 0.2s;

}


.nav a:hover {

    background: #1a1a1a;

    color: #fff;

}


.nav a.active {

    background: rgba(212,175,55,0.1);

    color: var(--gold);

}


/* =========================
   MAIN
========================= */

.main {

    flex: 1;

    padding: 40px;

}


/* =========================
   CARD
========================= */

.card {

    width: 100%;

    max-width: 1000px;

    margin: 0 auto;

    background: var(--card);

    border: 1px solid var(--border);

    border-radius: 18px;

    padding: 30px;

}


/* =========================
   HEADER
========================= */

.page-header {

    display: flex;

    align-items: center;

    justify-content: space-between;

    margin-bottom: 25px;

}


.title {

    font-size: 1.4rem;

    font-weight: 600;

}


.title i {

    color: var(--gold);

    margin-right: 8px;

}


.back-btn {

    display: inline-flex;

    align-items: center;

    gap: 7px;

    padding: 9px 14px;

    border-radius: 9px;

    border: 1px solid var(--border);

    background: #1a1a1a;

    color: var(--muted);

    text-decoration: none;

    font-size: 0.85rem;

    transition: 0.2s;

}


.back-btn:hover {

    color: var(--gold);

    border-color: var(--gold);

}


/* =========================
   FORM
========================= */

.form-group {

    margin-bottom: 18px;

}


label {

    font-size: 0.8rem;

    color: var(--muted);

    display: block;

    margin-bottom: 6px;

}


input,
textarea,
select {

    width: 100%;

    padding: 10px;

    border-radius: 8px;

    border: 1px solid var(--border);

    background: #1a1a1a;

    color: #fff;

    font-size: 0.9rem;

    transition: 0.2s;

}


input:focus,
textarea:focus,
select:focus {

    outline: none;

    border-color: var(--gold);

    box-shadow: 0 0 0 2px rgba(212,175,55,0.08);

}


textarea {

    resize: vertical;

    min-height: 100px;

}


select {

    cursor: pointer;

}


select option {

    background: #1a1a1a;

    color: #fff;

}


/* =========================
   FORM GRID
========================= */

.form-row {

    display: grid;

    grid-template-columns: 1fr 1fr;

    gap: 15px;

}


.full {

    grid-column: span 2;

}


/* =========================
   TOGGLES
========================= */

.toggle {

    display: flex;

    align-items: center;

    gap: 10px;

    margin-top: 5px;

}


.toggle input {

    width: 16px;

    height: 16px;

    accent-color: var(--gold);

    cursor: pointer;

}


.toggle label {

    margin: 0;

    color: #d1d1d1;

    cursor: pointer;

}


/* =========================
   BUTTONS
========================= */

.button-row {

    display: flex;

    gap: 12px;

    margin-top: 10px;

}


.btn {

    flex: 1;

    padding: 12px;

    border: none;

    border-radius: 10px;

    font-weight: 500;

    cursor: pointer;

    transition: 0.2s;

}


.btn-update {

    background: linear-gradient(
        135deg,
        var(--gold),
        var(--gold-light)
    );

    color: #000;

}


.btn-update:hover {

    opacity: 0.9;

    transform: translateY(-1px);

}


.btn-cancel {

    display: flex;

    align-items: center;

    justify-content: center;

    text-decoration: none;

    background: #1a1a1a;

    border: 1px solid var(--border);

    color: #aaa;

}


.btn-cancel:hover {

    color: #fff;

    border-color: rgba(255,255,255,0.15);

}


/* =========================
   ERROR
========================= */

.error-box {

    background: rgba(239,68,68,0.08);

    border: 1px solid rgba(239,68,68,0.2);

    color: #ff6b6b;

    padding: 10px 12px;

    border-radius: 10px;

    margin-bottom: 20px;

    font-size: 0.85rem;

}


/* =========================
   DRIVE STATUS
========================= */

.drive-status {

    margin-bottom: 20px;

    padding: 12px 14px;

    border-radius: 10px;

    background: #181818;

    border: 1px solid var(--border);

    font-size: 0.85rem;

}


.drive-status i {

    margin-right: 7px;

}


.status-open {

    color: #7ee787;

}


.status-ended {

    color: #ff7b7b;

}


/* =========================
   RESPONSIVE
========================= */

@media(max-width: 768px) {

    .sidebar {

        display: none;

    }

    .main {

        padding: 20px;

    }

    .form-row {

        grid-template-columns: 1fr;

    }

    .full {

        grid-column: span 1;

    }

    .page-header {

        align-items: flex-start;

        gap: 15px;

    }

    .button-row {

        flex-direction: column;

    }

}

</style>

</head>


<body>


<!-- =========================
     SIDEBAR
========================= -->

<div class="sidebar">

    <div class="logo">
        AMENTROP
    </div>


    <div class="nav">

        <a href="${pageContext.request.contextPath}/admin/dashboard">
            Dashboard
        </a>


        <a href="${pageContext.request.contextPath}/admin/freshers">
            Freshers
        </a>


        <a href="${pageContext.request.contextPath}/admin/professionals">
            Professionals
        </a>


        <a href="${pageContext.request.contextPath}/admin/jobs"
           class="active">

            Jobs

        </a>


        <a href="${pageContext.request.contextPath}/admin/create-job">

            Create Job

        </a>


        <a href="${pageContext.request.contextPath}/admin/hr-feedback">

            Feedback

        </a>


        <a href="${pageContext.request.contextPath}/logout">

            Logout

        </a>

    </div>

</div>



<!-- =========================
     MAIN
========================= -->

<div class="main">


    <div class="card">


        <!-- HEADER -->

        <div class="page-header">

            <div class="title">

                <i class="fa-solid fa-pen-to-square"></i>

                Edit Job

            </div>


            <a href="${pageContext.request.contextPath}/admin/jobs"
               class="back-btn">

                <i class="fa-solid fa-arrow-left"></i>

                Back to Jobs

            </a>

        </div>



        <!-- ERROR -->

        <c:if test="${not empty error}">

            <div class="error-box">

                <i class="fa-solid fa-circle-exclamation"></i>

                ${error}

            </div>

        </c:if>



        <!-- DRIVE STATUS -->

        <div class="drive-status">

            <c:choose>

                <c:when test="${job.driveEnded}">

                    <span class="status-ended">

                        <i class="fa-solid fa-circle-xmark"></i>

                        This drive has ended.
                        Students can no longer apply.

                    </span>

                </c:when>


                <c:otherwise>

                    <span class="status-open">

                        <i class="fa-solid fa-circle-check"></i>

                        This drive is currently active.
                        Students can apply.

                    </span>

                </c:otherwise>

            </c:choose>

        </div>



        <!-- FORM -->

        <form action="${pageContext.request.contextPath}/admin/update-job"
              method="post">


            <!-- JOB ID -->

            <input type="hidden"
                   name="jobId"
                   value="${job.id}">



            <!-- JOB TITLE -->

            <div class="form-group full">

                <label>
                    Job Title
                </label>

                <input type="text"
                       name="title"
                       value="${job.title}"
                       required>

            </div>



            <!-- COMPANY + LOCATION -->

            <div class="form-row">


                <div class="form-group">

                    <label>
                        Company Name
                    </label>

                    <input type="text"
                           name="companyName"
                           value="${job.companyName}"
                           required>

                </div>


                <div class="form-group">

                    <label>
                        Location
                    </label>

                    <input type="text"
                           name="location"
                           value="${job.location}"
                           required>

                </div>

            </div>



            <!-- DOMAIN + ELIGIBILITY -->

            <div class="form-row">


                <div class="form-group">

                    <label>
                        Domain
                    </label>

                    <input type="text"
                           name="domain"
                           value="${job.domain}"
                           required>

                </div>


                <div class="form-group">

                    <label>
                        Eligibility
                    </label>

                    <input type="text"
                           name="eligibility"
                           value="${job.eligibility}"
                           required>

                </div>

            </div>



            <!-- BRANCH + YEAR -->

            <div class="form-row">


                <div class="form-group">

                    <label>
                        Eligible Branch
                    </label>

                    <input type="text"
                           name="eligibleBranch"
                           value="${job.eligibleBranch}"
                           placeholder="Computer Science">

                </div>


                <div class="form-group">

                    <label>
                        Eligible Year Of Passout
                    </label>

                    <input type="number"
                           name="eligibleYearOfPassout"
                           value="${job.eligibleYearOfPassout}"
                           placeholder="2026">

                </div>

            </div>



            <!-- DESCRIPTION -->

            <div class="form-group full">

                <label>
                    Description
                </label>

                <textarea name="description"
                          required>${job.description}</textarea>

            </div>



            <!-- EXPERIENCE + PERCENTAGE -->

            <div class="form-row">


                <div class="form-group">

                    <label>
                        Minimum Experience
                    </label>

                    <input type="number"
                           name="minExperience"
                           value="${job.minExperience}"
                           min="0"
                           required>

                </div>


                <div class="form-group">

                    <label>
                        Minimum Percentage
                    </label>

                    <input type="number"
                           name="minPercentage"
                           value="${job.minPercentage}"
                           step="0.01"
                           min="0"
                           max="100"
                           required>

                </div>

            </div>



            <!-- TOGGLES -->

            <div class="form-row">


                <div class="form-group toggle">

                    <input type="checkbox"
                           id="strictApply"
                           name="strictApply"
                           value="true"
                           ${job.strictApply ? 'checked' : ''}>

                    <label for="strictApply">

                        Strict Apply

                    </label>

                </div>



                <div class="form-group toggle">

                    <input type="checkbox"
                           id="bondRequired"
                           name="bondRequired"
                           value="true"
                           ${job.bondRequired ? 'checked' : ''}>

                    <label for="bondRequired">

                        Bond Required

                    </label>

                </div>

            </div>



            <!-- JOB CATEGORY -->

            <div class="form-group full">

                <label>
                    Job Category
                </label>


                <select name="jobType"
                        required>

                    <option value="FRESHER"
                        ${job.jobType == 'FRESHER' ? 'selected' : ''}>

                        Fresher

                    </option>


                    <option value="PROFESSIONAL"
                        ${job.jobType == 'PROFESSIONAL' ? 'selected' : ''}>

                        Professional

                    </option>


                    <option value="BOTH"
                        ${job.jobType == 'BOTH' ? 'selected' : ''}>

                        Both

                    </option>

                </select>

            </div>



            <!-- BUTTONS -->

            <div class="button-row">


                <a href="${pageContext.request.contextPath}/admin/jobs"
                   class="btn btn-cancel">

                    <i class="fa-solid fa-xmark"></i>

                    &nbsp; Cancel

                </a>


                <button type="submit"
                        class="btn btn-update">

                    <i class="fa-solid fa-floppy-disk"></i>

                    &nbsp; Update Job

                </button>


            </div>


        </form>


    </div>


</div>


</body>

</html>