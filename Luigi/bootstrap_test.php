<!DOCTYPE html>
<html lang="it">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Pagina di Login</title>
        <!-- Collegamento a Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">    </head>

    <body>
        <?php
            if(isset($_POST['accedi'])){
                $auth=true;
            }else{
                $auth=false;
            }
            $db=mysqli_connect('localhost','root','','phptest');
            if($db==false){
                echo '<h3 class=" card-title text-center"> connessione non riuscita </h3>';
                exit();
            }
            if ($_SERVER['REQUEST_METHOD'] == 'POST') {
                $u = $_POST['email'];
                $p = $_POST['password'];
                if($auth==true){
                    $QUERY="SELECT * FROM UTENTI where UTENTI.email='$u' AND UTENTI.password='$p'";
                    $RISULTATO=mysqli_query($db,$QUERY);
                    if(mysqli_num_rows($RISULTATO)>0){
                        echo'<h3 class="card-title text-center"> BENVENVENTUO'$u'</h3>';
                        
                    }else{
                        echo'<h3 class="card-title text-center"> credenziali errate</h3>';
                    }



                }else{
                    $QUERY="SELECT * FROM UTENTI where UTENTI.email='$u' AND UTENTI.password='$p'";
                    $RISULTATO=mysqli_query($db,$QUERY);
                    if(mysqli_num_rows($RISULTATO)>0){
                        echo'<h3 class="card-title text-center"> GIA PRESENTE'$u'</h3>';
                        
                    }else{
                        $ins="INSERT INTO UTENTI (email,password) values ('$u','$p')";
                        if(mysqli_query($db,$ins)){
                            echo'<h3 class="card-title text-center"> '$u'REGISTRATO</h3>';

                        }else{
                            die('errore nel db');
                        }
                    }

                }

            }
           mysqli_close($db); 
        ?>
        
        <!-- Container ombre e corpo della card contente il form-->
        <div class="container">
            <div class="card shodow mt-5"> 
                <div class="card-body">

                    <!-- Titolo della card per mostrare la scritta "Login" -->
                    <h3 class="card-title text-center">Login</h3>
                    
                    <!-- Form cper inserire i dati di login -->
                    <form method="post">
                        
                        <!-- Parte del form che fa agiungere la mail -->
                        <div class="mb-3">
                            <label for="email" class="form-label">Email</label>
                            <input type="email" name="email" class="form-control" id="email">
                        </div>

                        <!-- Parte del form che fa agiungere la password -->
                        <div class="mb-3">
                            <label for="password" class="form-label">Password</label>
                            <input type="password" name="password" class="form-control" id="password">
                        </div>

                        <!-- Codice per aggiungere il bottone di login -->
                        <div class="d-grid">
                            <button type="submit" name="accedi" class="btn btn-primary">Login</button>
                        </div>
                        <div class="d-grid mt-2">
                            <button type="submit" name="registrati" class="btn btn-primary">Registrati</button>
                        </div>
                    </form>
                    
                    <!-- Parte che mostra i tasti di registrazione e password dimenticata-->
                    <div class="text-center mt-3">
                        <a href="#" class="text-decoration-none">Hai dimenticato la password?</a>
                    </div>



                </div>
            </div>
                
        </div>
    
    
        <!-- Collegamento a Bootstrap JS e dipendenze -->
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
   
    </body>


</html>
