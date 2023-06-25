<?php
    session_start();
    $_SESSION['login'] = 'login.php'; // i.e. "about.php" 

  //if (!isset($_SESSION['login'])) {
    //$_SESSION['login'] = $_SERVER['REQUEST_URI']; // i.e. "about.php"
  //}
  //header("Location: index.php");
?>
<!doctype html>
<html lang="es">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="assets/css/styles.css">
    <title>Login</title>
    <script src="assets/js/app.js"></script>
  </head>
  <body class="body">
  <section class="vh-100 bg-primary">
    <div class="container py-5 h-100">
      <div class="row d-flex justify-content-center align-items-center h-100">
        <div class="col-12 col-md-8 col-lg-6 col-xl-5">
          <div class="card shadow-2-strong" style="border-radius: 1rem;">
            <div class="card-body p-5 text-center">
                <div class="h2 mb-3">
                  <span class="text-primary">Login</span>
                </div>
                <div class="form-floating mb-3">
                  <input type="email" class="form-control" id="floatingInput" placeholder="name@example.com">
                  <label for="floatingInput">Usuario Id</label>
                </div>
                <div class="form-floating">
                  <input type="password" class="form-control" id="floatingPassword" placeholder="Password">
                  <label for="floatingPassword">NIP</label>
                </div>
                <div class="form-group my-3">
                  <button type="button" class="btn btn-primary" type="submit" onclick="login()" id="BotonLogin" >Ingresar</button>
                </div>
            </div> 
          </div> 
        </div>
      </div>
    </div>
  </section>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>
        