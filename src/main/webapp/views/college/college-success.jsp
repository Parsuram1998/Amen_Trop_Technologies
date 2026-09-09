<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Registration Submitted | Amentrop</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
<style>
:root{--gold:#D4AF37;--gold2:#f5d173;}
body{
margin:0;
display:flex;
justify-content:center;
align-items:center;
min-height:100vh;
background:linear-gradient(rgba(0,0,0,.88),rgba(0,0,0,.9)),url('https://images.unsplash.com/photo-1523050854058-8df90110c9f1?q=80&w=1800&auto=format&fit=crop');
background-size:cover;
font-family:Arial,sans-serif;
color:#fff;
}
.card-box{
max-width:760px;
width:92%;
background:#151515;
padding:45px;
border-radius:20px;
border:1px solid rgba(212,175,55,.3);
text-align:center;
box-shadow:0 20px 40px rgba(0,0,0,.5);
}
.icon{
width:100px;
height:100px;
margin:auto;
border-radius:50%;
background:linear-gradient(135deg,var(--gold),var(--gold2));
display:flex;
justify-content:center;
align-items:center;
font-size:46px;
color:#000;
margin-bottom:25px;
}
h1{font-weight:700;margin-bottom:15px;}
.gold{color:var(--gold);}
p{color:#cfcfcf;line-height:1.8;}
.info{
background:#0f0f0f;
border-left:4px solid var(--gold);
padding:18px;
margin:30px 0;
text-align:left;
border-radius:10px;
}
.btn-gold{
background:linear-gradient(135deg,var(--gold),var(--gold2));
color:#000;
font-weight:700;
border:none;
padding:12px 28px;
text-decoration:none;
border-radius:10px;
margin:8px;
display:inline-block;
}
.btn-dark{
background:#222;
color:#fff;
text-decoration:none;
padding:12px 28px;
border-radius:10px;
margin:8px;
display:inline-block;
}
</style>
</head>
<body>

<div class="card-box">

<div class="icon">
<i class="fa-solid fa-check"></i>
</div>

<h1>Registration <span class="gold">Submitted Successfully!</span></h1>

<p>
Thank you for partnering with <strong>Amentrop</strong>.
Your college registration has been received successfully.
Our team will review your application shortly.
</p>

<div class="info">
<h5>What happens next?</h5>
<ol>
<li>Your registration is reviewed by the Amentrop Admin.</li>
<li>Verification of college and TPO details.</li>
<li>Approval/Rejection notification will be sent to the registered TPO email.</li>
<li>Once approved, your College Dashboard will be activated.</li>
</ol>
</div>

<h5 class="mb-3">Need immediate assistance?</h5>

<p>
Placement Support | Industry Training | Campus Hiring | CSR Drives | Workshops
</p>

<a href="${pageContext.request.contextPath}/" class="btn-gold">
<i class="fa-solid fa-house"></i> Back to Home
</a>

<a href="${pageContext.request.contextPath}/for_college.html" class="btn-dark">
<i class="fa-solid fa-building-columns"></i> Colleges Page
</a>

</div>

</body>
</html>
