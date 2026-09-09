<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html><html><head><meta charset="UTF-8"><title>View Colleges</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
<style>:root{--gold:#D4AF37;}body{background:#111;color:#fff}.sidebar{position:fixed;width:240px;height:100%;background:#0a0a0a;padding:20px}.sidebar a{display:block;color:#fff;padding:10px;text-decoration:none}.main{margin-left:260px;padding:30px}.cardx{background:#1b1b1b;border:1px solid #333;border-radius:15px;padding:20px}.btn-gold{background:var(--gold);font-weight:bold}.table{color:#fff}</style></head><body>
<div class="sidebar"><h2 style="color:#D4AF37">Amentrop</h2>
<a href="/admin/dashboard">Dashboard</a><a href="/admin/colleges">View Colleges</a></div>
<div class="main">
<h2 style="color:#D4AF37">Registered Colleges</h2>
<div class="cardx mb-3">
<form action="${pageContext.request.contextPath}/admin/college/search" method="get" class="row">
<div class="col-md-9"><input class="form-control" name="keyword" placeholder="Search college"></div>
<div class="col-md-3"><button class="btn btn-gold w-100">Search</button></div>
</form></div>
<div class="cardx">
<table class="table table-hover"><thead><tr><th>College</th><th>Type</th><th>Location</th><th>NAAC</th><th>Status</th><th>Action</th></tr></thead><tbody>
<c:forEach var="college" items="${collegeList}">
<tr>
<td>${college.collegeName}</td>
<td>${college.collegeType}</td>
<td>${college.city}, ${college.state}</td>
<td>${college.naacGrade}</td>
<td>${college.status}</td>
<td>
<a class="btn btn-primary btn-sm" href="${pageContext.request.contextPath}/admin/college/${college.id}"><i class="fa fa-eye"></i></a>
<form action="${pageContext.request.contextPath}/admin/college/approve/${college.id}" method="post" style="display:inline"><button class="btn btn-success btn-sm"><i class="fa fa-check"></i></button></form>
<form action="${pageContext.request.contextPath}/admin/college/reject/${college.id}" method="post" style="display:inline"><button class="btn btn-danger btn-sm"><i class="fa fa-xmark"></i></button></form>
</td></tr>
</c:forEach>
</tbody></table></div></div></body></html>