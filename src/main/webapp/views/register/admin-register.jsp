<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Amentrop | Admin Registration</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

<style>

:root{
    --gold:#D4AF37;
    --gold-light:#F5D173;
    --black:#0A0A0A;
    --black2:#121212;
    --text:#d8d8d8;
}

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Poppins',sans-serif;
}

body{
    height:100vh;
    display:flex;
    background:var(--black);
    color:white;
}

/* LEFT */

.left{
    flex:1.2;
    position:relative;
    display:flex;
    align-items:center;
    padding:80px;
    overflow:hidden;

    background:
        linear-gradient(rgba(10,10,10,.78),rgba(10,10,10,.92)),
        url("https://images.unsplash.com/photo-1454165804606-c3d57bc86b40?auto=format&fit=crop&w=1600&q=80")
        center/cover;
}

.left::before{
    content:'';
    position:absolute;
    width:650px;
    height:650px;
    border-radius:50%;
    background:radial-gradient(circle,rgba(212,175,55,.18),transparent 70%);
    top:50%;
    left:50%;
    transform:translate(-50%,-50%);
}

.left-content{
    position:relative;
    z-index:2;
}

.logo{
    font-size:2rem;
    font-weight:800;
    margin-bottom:45px;
    background:linear-gradient(135deg,var(--gold),var(--gold-light));
    -webkit-background-clip:text;
    -webkit-text-fill-color:transparent;
}

.title{
    font-size:3rem;
    font-weight:800;
    line-height:1.2;
}

.title span{
    background:linear-gradient(135deg,var(--gold),var(--gold-light));
    -webkit-background-clip:text;
    -webkit-text-fill-color:transparent;
}

.subtitle{
    margin-top:20px;
    color:var(--text);
    line-height:1.8;
    max-width:520px;
}

.features{
    margin-top:50px;
}

.feature{
    display:flex;
    align-items:center;
    margin-bottom:18px;
    font-size:16px;
}

.feature i{
    color:var(--gold);
    margin-right:12px;
}

/* RIGHT */

.right{
    flex:1;
    display:flex;
    justify-content:center;
    align-items:center;
    background:var(--black2);
}

.card{

    width:420px;
    padding:40px;
    border-radius:20px;

    background:rgba(20,20,20,.93);

    border:1px solid rgba(212,175,55,.15);

    box-shadow:
        0 25px 60px rgba(0,0,0,.6),
        0 0 40px rgba(212,175,55,.08);

    backdrop-filter:blur(16px);

}

.card h2{

    text-align:center;
    margin-bottom:8px;

    background:linear-gradient(135deg,var(--gold),var(--gold-light));
    -webkit-background-clip:text;
    -webkit-text-fill-color:transparent;

}

.smallText{

    text-align:center;
    color:#bbbbbb;
    margin-bottom:28px;
    font-size:14px;

}

.input-group{

    margin-bottom:18px;
    position:relative;

}

.input-group i{

    position:absolute;
    top:50%;
    left:15px;
    transform:translateY(-50%);
    color:var(--gold);

}

.input-group input{

    width:100%;
    padding:14px 15px 14px 45px;

    border-radius:12px;

    border:1px solid rgba(255,255,255,.08);

    background:rgba(255,255,255,.03);

    color:white;

    transition:.3s;

}

.input-group input::placeholder{

    color:#bdbdbd;

}

.input-group input:focus{

    outline:none;
    border-color:var(--gold);

    box-shadow:0 0 15px rgba(212,175,55,.25);

}

.btn{

    width:100%;

    padding:14px;

    border:none;

    border-radius:14px;

    cursor:pointer;

    font-weight:600;
    font-size:15px;

    color:black;

    background:linear-gradient(135deg,var(--gold),var(--gold-light));

    transition:.3s;

}

.btn:hover{

    transform:translateY(-3px);

    box-shadow:0 15px 35px rgba(212,175,55,.35);

}

.error{

    background:rgba(255,0,0,.08);

    border:1px solid rgba(255,0,0,.25);

    color:#ff6b6b;

    padding:12px;

    border-radius:10px;

    margin-bottom:18px;

    text-align:center;

}

.footerText{

    margin-top:20px;

    text-align:center;

    color:#9b9b9b;

    font-size:13px;

}

.footerText i{

    color:var(--gold);

}

@media(max-width:900px){

.left{
display:none;
}

}

</style>

</head>

<body>

<!-- LEFT -->

<div class="left">

<div class="left-content">

<div class="logo">
AMENTROP
</div>

<div class="title">
Admin <span>Control Center</span>
</div>

<div class="subtitle">

Create an administrator account to manage the Amentrop platform,
verify users, oversee hiring activities, monitor analytics,
and maintain the complete recruitment ecosystem.

</div>

<div class="features">

<div class="feature">
<i class="fas fa-user-shield"></i>
Secure Administrator Access
</div>

<div class="feature">
<i class="fas fa-users-cog"></i>
Manage Candidates & HR
</div>

<div class="feature">
<i class="fas fa-chart-line"></i>
Platform Analytics Dashboard
</div>

<div class="feature">
<i class="fas fa-lock"></i>
Enterprise Grade Security
</div>

</div>

</div>

</div>

<!-- RIGHT -->

<div class="right">

<div class="card">

<h2>Admin Registration</h2>

<div class="smallText">
Create your administrator account
</div>

<% if(request.getAttribute("error")!=null){ %>

<div class="error">
<%=request.getAttribute("error")%>
</div>

<% } %>

<form action="${pageContext.request.contextPath}/auth/register" method="post">

<input type="hidden" name="role" value="ADMIN"/>

<div class="input-group">
<i class="fas fa-user"></i>
<input
type="text"
name="fullName"
placeholder="Full Name"
required>
</div>

<div class="input-group">
<i class="fas fa-envelope"></i>
<input
type="email"
name="email"
placeholder="Email Address"
required>
</div>

<div class="input-group">
<i class="fas fa-phone"></i>
<input
type="text"
name="phone"
placeholder="Phone Number"
required>
</div>

<div class="input-group">
<i class="fas fa-lock"></i>
<input
type="password"
name="password"
placeholder="Password"
required>
</div>

<button class="btn" type="submit">
<i class="fas fa-user-shield"></i>
&nbsp; Register Admin
</button>

</form>

<div class="footerText">
<i class="fas fa-shield-alt"></i>
Authorized administrators only.
</div>

</div>

</div>

</body>
</html>