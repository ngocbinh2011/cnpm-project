<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
        integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <title>Document</title>
</head>

<body>
    <section class="vh-100" style="background-color: #508bfc;">
        <!-- Section: Design Block -->
        <!-- Jumbotron -->
        <div class="px-4 py-5 px-md-5 text-center text-lg-start">
            <div class="container py-5 h-100">
                <div class="row d-flex justify-content-center align-items-center h-100">

                    <div class="col-lg-6 mb-5 mb-lg-0 ">
                        <div class="card shadow-2-strong" style="border-radius: 1rem;">
                            <div class="card-body py-5 px-md-5">
                                <c:if test="${message != null}">
                                    <h6 style="color: red">Error: ${message}</h6>
                                </c:if>
                                <h3 class="mb-5">Sign up</h3>
                                <form action="sign-up" method="post">
                                    <!-- 2 column grid layout with text inputs for the first and last names -->
                                    <div class="row">
                                        <div class="col-md-6 mb-4">
                                            <div class="form-outline">
                                                <input name="firstName" type="text" id="form3Example1" class="form-control"
                                                    placeholder="First name" />
                                                <label class="form-label" for="form3Example1"></label>
                                            </div>
                                        </div>
                                        <div class="col-md-6 mb-4">
                                            <div class="form-outline">
                                                <input name="lastName" type="text" id="form3Example2" class="form-control"
                                                    placeholder="Last name" />
                                                <label class="form-label" for="form3Example2"></label>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Email input -->
                                    <div class="form-outline mb-4">
                                        <input type="email" name="email" id="form3Example3" class="form-control"
                                            placeholder="Email address" />
                                        <label class="form-label" for="form3Example3"></label>
                                    </div>

                                    <!-- Password input -->
                                    <div class="form-outline mb-4">
                                        <input type="password" name="password1" id="form3Example4" class="form-control"
                                            placeholder="Password..." />
                                        <label class="form-label" for="form3Example4"></label>
                                    </div>

                                    <div class="form-outline mb-4">
                                        <input type="password" name="password2" id="form3Example4" class="form-control"
                                               placeholder="Confirm password..." />
                                        <label class="form-label" for="form3Example4"></label>
                                    </div>

                                    <!-- Checkbox -->
                                    <div class="form-check d-flex justify-content-center mb-4">
                                        <input class="form-check-input mr-2 position-static" type="checkbox" value=""
                                            id="form2Example33" checked />
                                        <label class="form-check-label " for="form2Example33">
                                            Subscribe to our newsletter
                                        </label>
                                    </div>

                                    <!-- Submit button -->
                                    <button type="submit" class="btn btn-primary btn-block mb-4">
                                        Sign up
                                    </button>

                                    <!-- Register buttons -->

                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</body>

</html>