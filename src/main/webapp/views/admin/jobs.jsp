<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Amentrop - Jobs</title>

<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600&display=swap" rel="stylesheet">
<link rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
<style>

:root{
    --bg:#0a0a0a;
    --sidebar:#0d0d0d;
    --card:#111;
    --border:rgba(255,255,255,0.06);
    --text:#fff;
    --muted:#9ca3af;
    --gold:#d4af37;
}

*{margin:0;padding:0;box-sizing:border-box}

body{
    font-family:'Inter',sans-serif;
    background:var(--bg);
    color:var(--text);
    display:flex;
}

/* ===== SIDEBAR ===== */
.sidebar{
    width:240px;
    height:100vh;
    background:var(--sidebar);
    border-right:1px solid var(--border);
    padding:25px;
}

.logo{
    font-size:1.4rem;
    font-weight:600;
    color:var(--gold);
    margin-bottom:40px;
}

.nav a{
    display:block;
    padding:12px;
    border-radius:10px;
    margin-bottom:6px;
    color:var(--muted);
    text-decoration:none;
}

.nav a:hover{
    background:#1a1a1a;
    color:#fff;
}

.nav a.active{
    background:rgba(212,175,55,0.1);
    color:var(--gold);
}

/* ===== MAIN ===== */
.main{
    flex:1;
    padding:30px;
}

/* HEADER */
.header{
    display:flex;
    justify-content:space-between;
    align-items:center;
    margin-bottom:20px;
}

.header h2{
    font-weight:600;
}

.btn-primary{
    background:linear-gradient(135deg,#d4af37,#f5d173);
    color:#000;
    padding:8px 14px;
    border-radius:8px;
    text-decoration:none;
    font-size:0.85rem;
}

/* TABLE */
.table-card{
    background:var(--card);
    border:1px solid var(--border);
    border-radius:14px;
    overflow:hidden;
}

table{
    width:100%;
    border-collapse:collapse;
}

th{
    text-align:left;
    padding:14px;
    font-size:0.75rem;
    color:var(--muted);
    background:#111;
}

td{
    padding:14px;
    border-top:1px solid var(--border);
}

tr:hover{
    background:rgba(255,255,255,0.03);
}

/* ACTION ICON */
.icon-btn{
    background:#1a1a1a;
    border:1px solid rgba(255,255,255,0.05);
    padding:6px;
    border-radius:6px;
    cursor:pointer;
    color:#aaa;
    display:inline-flex;
    align-items:center;
    justify-content:center;
    transition:0.2s;
}

.icon-btn:hover{
    background:#222;
    color:#d4af37;
}

/* UPDATE INPUT */
.update-box{
    display:flex;
    gap:6px;
}

.update-box input{
    padding:6px;
    border-radius:6px;
    border:1px solid var(--border);
    background:#1a1a1a;
    color:#fff;
    font-size:0.75rem;
}

.update-box button{
    background:#222;
    border:none;
    padding:6px 10px;
    border-radius:6px;
    color:#fff;
    cursor:pointer;
}

/* SMALL TEXT */
.muted{
    color:var(--muted);
    font-size:0.8rem;
}

/* =========================
   JOB STATUS
========================= */

.status {
    display: inline-flex;
    align-items: center;
    gap: 6px;

    padding: 5px 10px;

    border-radius: 20px;

    font-size: 11px;
    font-weight: 600;
    white-space: nowrap;
}

.status i {
    font-size: 9px;
}


/* ACTIVE */

.status.active {
    color: #7ee787;

    background: rgba(46, 160, 67, 0.12);

    border: 1px solid rgba(46, 160, 67, 0.25);
}


/* ENDED */

.status.ended {
    color: #ff7b7b;

    background: rgba(239, 68, 68, 0.10);

    border: 1px solid rgba(239, 68, 68, 0.25);
}

/* =========================
   ACTION BUTTONS
========================= */

.actions {
    white-space: nowrap;
}


.action-btn {

    width: 34px;
    height: 34px;

    display: inline-flex;

    align-items: center;
    justify-content: center;

    margin-right: 5px;

    border-radius: 8px;

    border: 1px solid rgba(255,255,255,0.08);

    background: #1a1a1a;

    color: #aaa;

    cursor: pointer;

    text-decoration: none;

    transition: all 0.2s ease;
}


.action-btn i {
    font-size: 13px;
}


/* EDIT */

.edit-btn:hover {

    color: var(--gold);

    border-color: var(--gold);

    background: rgba(212,175,55,0.08);

}


/* END DRIVE */

.end-btn:hover {

    color: #f5d173;

    border-color: #d4af37;

    background: rgba(212,175,55,0.08);

}


/* DELETE */

.delete-btn:hover {

    color: #ff6b6b;

    border-color: #ff6b6b;

    background: rgba(255,70,70,0.08);

}

/* =========================
   VIEW APPLICANTS
========================= */

.icon-btn {

    width: 34px;
    height: 34px;

    display: inline-flex;

    align-items: center;
    justify-content: center;

    border-radius: 8px;

    border: 1px solid rgba(255,255,255,0.08);

    background: #1a1a1a;

    color: #aaa;

    text-decoration: none;

    transition: all 0.2s ease;
}


.icon-btn:hover {

    color: var(--gold);

    border-color: var(--gold);

    background: rgba(212,175,55,0.08);

}


.icon-btn i {

    font-size: 13px;

}

</style>
</head>

<body>

<!-- SIDEBAR -->
<div class="sidebar">
    <div class="logo">AMENTROP</div>

    <div class="nav">
        <a href="${pageContext.request.contextPath}/admin/dashboard">Dashboard</a>
        <a href="${pageContext.request.contextPath}/admin/freshers">Freshers</a>
        <a href="${pageContext.request.contextPath}/admin/professionals">Professionals</a>
        <a class="active">Jobs</a>
        <a href="${pageContext.request.contextPath}/admin/create-job">Create Job</a>
        <a href="${pageContext.request.contextPath}/admin/hr-feedback">Feedback</a>
        <a href="${pageContext.request.contextPath}/logout">Logout</a>
    </div>
</div>

<!-- MAIN -->
<div class="main">

    <div class="header">
        <h2>Job Management</h2>

        <a class="btn-primary"
           href="${pageContext.request.contextPath}/admin/create-job">
            + Create Job
        </a>
    </div>

    <div class="table-card">

       <table>

    <tr>

        <th>Title</th>

        <th>Company</th>

        <th>Location</th>

        <th>Domain</th>

        <th>Min Exp</th>

        <th>Status</th>

        <th>Applicants</th>

        <th>Actions</th>

        <th>Update</th>

    </tr>


    <c:forEach items="${jobs}" var="j">

    <tr>

        <!-- JOB TITLE -->

        <td>
            ${j.title}
        </td>


        <!-- COMPANY -->

        <td class="muted">
            ${j.companyName}
        </td>


        <!-- LOCATION -->

        <td>
            ${j.location}
        </td>


        <!-- DOMAIN -->

        <td>
            ${j.domain}
        </td>


        <!-- MIN EXPERIENCE -->

        <td>
            ${j.minExperience}
        </td>


        <!-- STATUS -->

        <td>

            <c:choose>

                <c:when test="${j.driveEnded}">

                    <span class="status ended">
                        <i class="fa-solid fa-circle-xmark"></i>
                        Ended
                    </span>

                </c:when>

                <c:otherwise>

                    <span class="status active">
                        <i class="fa-solid fa-circle-check"></i>
                        Active
                    </span>

                </c:otherwise>

            </c:choose>

        </td>


        <!-- VIEW APPLICANTS -->

        <td>

            <a class="icon-btn"
               href="${pageContext.request.contextPath}/admin/job-applicants?jobId=${j.id}"
               title="View Applicants">

                <i class="fa-solid fa-eye"></i>

            </a>

        </td>


        <!-- ACTIONS -->

        <td class="actions">


            <!-- EDIT -->

            <a class="action-btn edit-btn"
               href="${pageContext.request.contextPath}/admin/edit-job?jobId=${j.id}"
               title="Edit Job">

                <i class="fa-solid fa-pen-to-square"></i>

            </a>


            <!-- END DRIVE -->

            <c:if test="${not j.driveEnded}">

                <form method="post"
                      action="${pageContext.request.contextPath}/admin/end-drive"
                      style="display:inline;">

                    <input type="hidden"
                           name="jobId"
                           value="${j.id}">

                    <button type="submit"
                            class="action-btn end-btn"
                            title="End Drive"
                            onclick="return confirm('Are you sure you want to end this drive? Students will no longer be able to apply.');">

                        <i class="fa-solid fa-lock"></i>

                    </button>

                </form>

            </c:if>


            <!-- DELETE -->

            <form method="post"
                  action="${pageContext.request.contextPath}/admin/delete-job"
                  style="display:inline;">

                <input type="hidden"
                       name="jobId"
                       value="${j.id}">

                <button type="submit"
                        class="action-btn delete-btn"
                        title="Delete Job"
                        onclick="return confirm('Are you sure you want to delete this job?');">

                    <i class="fa-solid fa-trash"></i>

                </button>

            </form>


        </td>


        <!-- ADD UPDATE -->

        <td>

            <form method="post"
                  action="${pageContext.request.contextPath}/admin/add-update">

                <input type="hidden"
                       name="jobId"
                       value="${j.id}">

                <div class="update-box">

                    <input type="text"
                           name="updateText"
                           placeholder="Add update">

                    <button type="submit">
                        Save
                    </button>

                </div>

            </form>

        </td>


    </tr>

    </c:forEach>

</table>
    </div>

</div>

</body>
</html>