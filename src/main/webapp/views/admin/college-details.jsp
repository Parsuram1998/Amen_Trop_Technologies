<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>College Details</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
<style>
:root{--gold:#D4AF37;}
body{background:#101010;color:#fff;font-family:Arial,sans-serif}
.sidebar{position:fixed;left:0;top:0;width:240px;height:100vh;background:#090909;padding:20px}
.sidebar h3{color:var(--gold)}
.sidebar a{display:block;color:#fff;text-decoration:none;padding:10px 0}
.main{margin-left:260px;padding:35px}
.card{background:#181818;border:1px solid #2e2e2e;border-radius:18px;color:#fff}
.card-header{background:#202020;color:var(--gold);font-weight:bold}
.form-control{background:#0f0f0f;color:#fff;border:1px solid #444}
.form-control:focus{background:#0f0f0f;color:#fff;border-color:var(--gold);box-shadow:none}
.badge-service{background:#2b2b2b;border:1px solid var(--gold);color:var(--gold);margin:3px;padding:8px 12px}
</style>
</head>
<body>

<div class="sidebar">
<h3>Amentrop</h3>
<a href="${pageContext.request.contextPath}/admin/dashboard"><i class="fa fa-chart-line"></i> Dashboard</a>
<a href="${pageContext.request.contextPath}/admin/colleges"><i class="fa fa-building"></i> Colleges</a>
</div>

<div class="main">

<h2 class="mb-4" style="color:#D4AF37;">College Details</h2>

<div class="row">

<div class="col-lg-8">

<div class="card mb-4">
<div class="card-header">College Information</div>
<div class="card-body">

<div class="row">
<div class="col-md-6 mb-3">
<label>College Name</label>
<input class="form-control" readonly value="${college.collegeName}">
</div>

<div class="col-md-6 mb-3">
<label>Website</label>
<input class="form-control" readonly value="${college.collegeWebsite}">
</div>

<div class="col-md-6 mb-3">
<label>College Type</label>
<input class="form-control" readonly value="${college.collegeType}">
</div>

<div class="col-md-6 mb-3">
<label>NAAC Grade</label>
<input class="form-control" readonly value="${college.naacGrade}">
</div>

<div class="col-md-4 mb-3">
<label>Country</label>
<input class="form-control" readonly value="${college.country}">
</div>

<div class="col-md-4 mb-3">
<label>State</label>
<input class="form-control" readonly value="${college.state}">
</div>

<div class="col-md-4 mb-3">
<label>District</label>
<input class="form-control" readonly value="${college.district}">
</div>

<div class="col-md-6 mb-3">
<label>City</label>
<input class="form-control" readonly value="${college.city}">
</div>

<div class="col-md-6 mb-3">
<label>Pincode</label>
<input class="form-control" readonly value="${college.pincode}">
</div>

</div>

</div>
</div>

<div class="card mb-4">
<div class="card-header">Training & Placement Officer</div>
<div class="card-body">

<div class="row">

<div class="col-md-4 mb-3">
<label>Name</label>
<input class="form-control" readonly value="${college.tpoName}">
</div>

<div class="col-md-4 mb-3">
<label>Phone</label>
<input class="form-control" readonly value="${college.tpoPhone}">
</div>

<div class="col-md-4 mb-3">
<label>Email</label>
<input class="form-control" readonly value="${college.tpoEmail}">
</div>

</div>

</div>
</div>

<div class="card">
<div class="card-header">Services Requested</div>
<div class="card-body">

<c:if test="${college.campusHiring}">
<span class="badge-service">Campus Hiring</span>
</c:if>

<c:if test="${college.placementSupport}">
<span class="badge-service">Placement Support</span>
</c:if>

<c:if test="${college.industryTraining}">
<span class="badge-service">Industry Training</span>
</c:if>

<c:if test="${college.csrDrive}">
<span class="badge-service">CSR Drive</span>
</c:if>

<c:if test="${college.workshopSeminar}">
<span class="badge-service">Workshop / Seminar</span>
</c:if>

</div>
</div>

</div>

<div class="col-lg-4">

<div class="card mb-4">
<div class="card-header">Registration Status</div>
<div class="card-body">

<p><b>Status :</b> ${college.status}</p>
<p><b>Registered :</b> ${college.registeredAt}</p>
<p><b>Approved :</b> ${college.approvedAt}</p>

</div>
</div>

<div class="card mb-4">
<div class="card-header">Admin Remarks</div>
<div class="card-body">

<form action="${pageContext.request.contextPath}/admin/college/remarks/${college.id}" method="post">

<textarea class="form-control mb-3" rows="5" name="remarks">${college.remarks}</textarea>

<button class="btn btn-warning w-100">
<i class="fa fa-floppy-disk"></i> Save Remarks
</button>

</form>

</div>
</div>

<form action="${pageContext.request.contextPath}/admin/college/approve/${college.id}" method="post" class="mb-2">
<button class="btn btn-success w-100">
<i class="fa fa-check"></i> Approve College
</button>
</form>

<form action="${pageContext.request.contextPath}/admin/college/reject/${college.id}" method="post" class="mb-2">
<button class="btn btn-danger w-100">
<i class="fa fa-xmark"></i> Reject College
</button>
</form>

<a href="${pageContext.request.contextPath}/admin/colleges" class="btn btn-secondary w-100">
<i class="fa fa-arrow-left"></i> Back
</a>

</div>

</div>

</div>

</body>
</html>
