<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/@forevolve/bootstrap-dark@1.1.0/dist/css/bootstrap-dark.min.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
.footer {
	position: fixed;
	left: 0;
	bottom: 15px;
	width: 100%;
	text-align: center;
}
</style>
<title>Passtillery</title>
</head>
<body>
	<header class="mb-auto">
		<div>
			<nav class="nav nav-masthead justify-content-center float-md-end">
			</nav>
		</div>
	</header>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
	<main role="main">
		<section style="height: 200px;" class="jumbotron text-center">
			<div class="container">
				<h1 class="jumbotron-heading ">Passtillery</h1>
				<br>
				<p class="lead ">A functional password manager written in Java
					to keep your passwords safe and organized.</p>
			</div>
		</section>
		<div class="album py-5 ">
			<div class="container">
				<div class="row">
					<div class="col-md-4 ">
						<div class="card mb-4 shadow-sm">
							<div class="card-body">
								<h3>New</h3>
								<form action="createAccount.do" method="POST" id="create">
									Name <br /> <input class="form-control me-2" name="name"
										type="text" placeholder="Name" aria-label="Name">
									Username <br /> <input class="form-control me-2"
										name="username" type="text" placeholder="Username"
										aria-label="Username"> Password <br /> <input
										class="form-control me-2" name="password" type="text"
										placeholder="Password" aria-label="Password"> URL<br>
									<input class="form-control me-2" name="url" type="text"
										placeholder="URL" aria-label="URL"> Notes<br /> <input
										class="form-control me-2" name="notes" type="text"
										placeholder="Notes" aria-label="Notes"> <br>
									<button class="btn btn-outline-light pull-left" type="submit"
										name="action" value="GeneratePassword" form="create">Generate</button>
									<button class="btn btn-outline-info pull-right" type="submit"
										name="action" value="Save" form="create">Save</button>
								</form>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="card mb-4 shadow-sm">
							<div class="card-body">
								<h3>Accounts</h3>
								<form class="d-flex" action="getAccount.do" method="POST">
									<input class="form-control me-2" name="keyword" type="search"
										placeholder="Search" aria-label="Search">
									<button class="btn btn-outline-light" type="submit">Search</button>
								</form>
								<h3></h3>
								<div>
									<c:choose>
										<c:when test="${! empty accounts}">
											<c:forEach var="account" items="${accounts}">
												<form action="showDetails.do" method="POST">
													<div class="card">
														<div class="card-body">
															<input type="hidden" name="id" value="${account.id}">
															<h5 class="mt-0">
																<img
																	src="https://www.google.com/s2/favicons?domain=${account.url}"
																	class="mr-3" alt="favicon">&nbsp;&nbsp;${account.name}
															</h5>
															${account.username}
															<button class="stretched-link" type="submit"
																style="background: transparent; border: none; color: transparent;"></button>
														</div>
													</div>
												</form>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<p>No accounts found</p>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="card mb-4 shadow-sm">
							<div class="card-body">
								<h3>Info</h3>
								<c:choose>
									<c:when test="${! empty account}">
										<form action="editAccount.do" method="POST">
											<div>
												<h5 class="mt-0">
													<img
														src="https://www.google.com/s2/favicons?domain=${account.url}"
														class="mr-3" alt="favicon">&nbsp;&nbsp;${account.name}
												</h5>
												Username: ${account.username} <br> Password:
												${account.password} <br> URL: ${account.url} <br>
												Notes: ${account.notes} <br> <input type="hidden"
													name="id" value="${account.id}"> <input
													type="hidden" name="name" value="${account.name}">
												<input type="hidden" name="username"
													value="${account.username}"> <input type="hidden"
													name="password" value="${account.password}"> <input
													type="hidden" name="url" value="${account.url}"> <input
													type="hidden" name="notes" value="${account.notes}">
												<button class="btn btn-outline-danger pull-right"
													type="submit" name="action" value="Delete">Delete</button>
												<button class="btn btn-outline-warning pull-right"
													type="submit" name="action" value="Edit">Edit</button>
											</div>
										</form>
									</c:when>
									<c:otherwise>
										<p>No account selected</p>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>

	<footer class="footer">

		<div class="container">
			<a href="https://github.com/ryspc/JPACRUDProject">Follow the
				development on Github</a>
		</div>
	</footer>

</body>
</html>