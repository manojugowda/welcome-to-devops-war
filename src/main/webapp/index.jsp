<html>
<head>
<title>Welcome to 2022!</title>
</head>
<body>
	<h1>Welcome to 2022!</h1>
	<p>
		It is now
		<%= new java.util.Date() %></p>
	<p>
		You are coming from 
		<%= request.getRemoteAddr()  %></p>
</body>
