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
        <div class="container py-5 h-100">
            <div class="row d-flex justify-content-center align-items-center h-100">
                <div class="col-12 col-md-8 col-lg-6 col-xl-5">
                    <div class="card shadow-2-strong" style="border-radius: 1rem;">

                        <form action="/sign-in" method="post">
                            <div class="card-body p-5 text-center">
                                <h3 class="mb-5">Sign in</h3>

                                <div class="form-outline mb-4">
                                    <input name="email" type="email" id="typeEmailX-2" class="form-control form-control-lg"
                                           placeholder="Email" />
                                    <label class="form-label" for="typeEmailX-2"></label>
                                </div>

                                <div class="form-outline mb-4">
                                    <input name="password" type="password" id="typePasswordX-2" class="form-control form-control-lg"
                                           placeholder="Password" />
                                    <label class="form-label" for="typePasswordX-2"></label>
                                </div>

                                <!-- Checkbox -->
                                <div class="form-check d-flex justify-content-start mb-4">
                                    <input class="form-check-input" type="checkbox" value="" id="form1Example3" />
                                    <label class="form-check-label" for="form1Example3"> Remember password </label>
                                </div>

                                <button class="btn btn-primary btn-lg btn-block" type="submit">Login</button>

                                <hr class="my-4">

                                <button class="btn btn-lg btn-block btn-primary" style="background-color: #dd4b39;"
                                        type="submit"><i class="fab fa-google me-2"></i> Sign in with google</button>
                                <button class="btn btn-lg btn-block btn-primary mb-2" style="background-color: #3b5998;"
                                        type="submit"><i class="fab fa-facebook-f me-2"></i>Sign in with facebook</button>

                            </div>
                        </form>

                    </div>
                </div>
            </div>
        </div>
    </section>
</body>

</html>