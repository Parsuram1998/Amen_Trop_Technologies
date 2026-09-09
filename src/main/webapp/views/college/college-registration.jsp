
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>College Registration | Amentrop</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

<style>
:root{
 --gold:#D4AF37;
 --gold2:#f5d173;
 --bg:#090909;
 --card:#161616;
}
body{
 background:var(--bg);
 color:#fff;
 font-family:Poppins,Arial,sans-serif;
}
.hero{
 padding:70px 0;
 text-align:center;
 background:linear-gradient(rgba(0,0,0,.75),rgba(0,0,0,.8)),
 url('https://images.unsplash.com/photo-1523050854058-8df90110c9f1?q=80&w=1800&auto=format&fit=crop');
 background-size:cover;
}
.hero h1 span{
 color:var(--gold);
}
.form-card{
 background:var(--card);
 border:1px solid rgba(212,175,55,.25);
 border-radius:18px;
 padding:35px;
 box-shadow:0 10px 30px rgba(0,0,0,.4);
}
.form-control,.form-select{
 background:#0f0f0f;
 color:#fff;
 border:1px solid #333;
}
.form-control:focus,.form-select:focus{
 background:#111;
 color:#fff;
 border-color:var(--gold);
 box-shadow:none;
}
.form-label{
 color:var(--gold2);
 font-weight:600;
}
.section-title{
 color:var(--gold);
 margin-top:25px;
 margin-bottom:20px;
}
.btn-gold{
 background:linear-gradient(135deg,var(--gold),var(--gold2));
 border:none;
 color:#000;
 font-weight:700;
 padding:12px 30px;
}
.check-group{
 display:grid;
 grid-template-columns:repeat(auto-fit,minmax(220px,1fr));
 gap:10px;
}
</style>
</head>
<body>

<section class="hero">
<div class="container">
<h1>Partner Your <span>College</span> With Amentrop</h1>
<p>Register your institution to access campus hiring, placement support, training programs and CSR opportunities.</p>
</div>
</section>

<div class="container py-5">

<div class="form-card">

<form action="${pageContext.request.contextPath}/college/register" method="post">

<h3 class="section-title">College Information</h3>

<div class="row">

<div class="col-md-6 mb-3">
<label class="form-label">College Name *</label>
<input type="text" name="collegeName" class="form-control" required>
</div>

<div class="col-md-6 mb-3">
    <label class="form-label">College Website <span class="text-danger">*</span></label>
    <input
        type="text"
        name="collegeWebsite"
        class="form-control"
        placeholder="www.example.edu.in or https://www.example.edu.in"
       pattern="(https?:\/\/)?([a-zA-Z0-9-]+\.)+[a-zA-Z]{2,}(\/.*)?"
        title="Enter a valid website address"
        required>
</div>

<div class="col-md-6 mb-3">
<label class="form-label">College Type *</label>
<select class="form-select" name="collegeType" required>
<option value="">Select</option>
<option>Engineering</option>
<option>MBA</option>
<option>MCA</option>
<option>BBA</option>
<option>B.Com</option>
<option>Degree</option>
<option>Polytechnic</option>
<option>Other</option>
</select>
</div>

<div class="col-md-6 mb-3">
<label class="form-label">Country</label>
<input class="form-control" name="country" value="India">
</div>

<div class="col-md-4 mb-3">
<label class="form-label">State</label>
<input class="form-control" name="state" required>
</div>

<div class="col-md-4 mb-3">
<label class="form-label">District</label>
<input class="form-control" name="district" required>
</div>

<div class="col-md-4 mb-3">
<label class="form-label">City</label>
<input class="form-control" name="city" required>
</div>

<div class="col-md-6 mb-3">
<label class="form-label">Pincode</label>
<input class="form-control" name="pincode" required>
</div>

</div>

<h3 class="section-title">Accreditation</h3>

<div class="row">

<div class="col-md-6 mb-3">
<label class="form-label">NAAC Accreditation</label>
<select class="form-select" name="naacAccreditation">
<option>Yes</option>
<option>No</option>
</select>
</div>

<div class="col-md-6 mb-3">
<label class="form-label">NAAC Grade</label>
<select class="form-select" name="naacGrade">
<option>A++</option>
<option>A+</option>
<option>A</option>
<option>B++</option>
<option>B+</option>
<option>B</option>
<option>C</option>
<option>N/A</option>
</select>
</div>

</div>

<h3 class="section-title">Training & Placement Officer</h3>

<div class="row">

<div class="col-md-4 mb-3">
<label class="form-label">TPO Name</label>
<input class="form-control" name="tpoName" required>
</div>

<div class="col-md-4 mb-3">
<label class="form-label">Phone Number</label>
<input class="form-control" name="tpoPhone" required>
</div>

<div class="col-md-4 mb-3">
<label class="form-label">Email</label>
<input type="email" class="form-control" name="tpoEmail" required>
</div>

</div>

<h3 class="section-title">Services Required</h3>

<div class="check-group mb-4">

<div class="form-check">
<input class="form-check-input" type="checkbox" name="campusHiring">
<label class="form-check-label">Campus Hiring</label>
</div>

<div class="form-check">
<input class="form-check-input" type="checkbox" name="placementSupport">
<label class="form-check-label">Placement Support</label>
</div>

<div class="form-check">
<input class="form-check-input" type="checkbox" name="industryTraining">
<label class="form-check-label">Industry Training</label>
</div>

<div class="form-check">
<input class="form-check-input" type="checkbox" name="csrDrive">
<label class="form-check-label">CSR Drive</label>
</div>

<div class="form-check">
<input class="form-check-input" type="checkbox" name="workshopSeminar">
<label class="form-check-label">Workshop / Seminar</label>
</div>

</div>

<div class="form-check mb-4">
<input class="form-check-input" type="checkbox" required>
<label class="form-check-label">
I confirm the above information is correct.
</label>
</div>


<button type="submit" class="btn btn-gold w-100">
    <i class="fa-solid fa-building-columns"></i>
    Register College
</button>

</form>

</div>

</div>

</body>
</html>
