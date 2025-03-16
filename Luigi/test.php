<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <title>Login e Registrazione</title>
</head>
<body>
    <h1>Benvenuto!</h1>

    <?php
        // Verifica se il form è stato inviato
        if (isset($_POST['Accedi'])) {
            $auth = true;
        } else {
            $auth = false;
        }

        // Se il form è stato inviato, elabora i dati
        if ($_SERVER['REQUEST_METHOD'] == 'POST') {
            $u = $_POST['utente'];
            $p = $_POST['pass'];

            // Connessione al database
            $db = mysqli_connect("localhost", "root", "", "users");
            if ($db == false) {
                die("Errore in connessione dbms ...");
            }

            if ($auth) {
                // Autenticazione
                $sql = "SELECT * FROM utenti WHERE username = '$u' AND password = '$p'";
                $rec = mysqli_query($db, $sql);

                if (mysqli_num_rows($rec) > 0) {
                    echo "<h2 style='color:blue;'>Buongiorno " . $u . "</h2>";
                } else {
                    echo "<p style='color:red;'>Credenziali errate ...</p>";
                }
            } else {
                // Registrazione
                $sql = "SELECT * FROM utenti WHERE username = '$u'";
                $rec = mysqli_query($db, $sql);

                if (mysqli_num_rows($rec) > 0) {
                    echo "<p style='color:red;'>Attenzione ... utente " . $u . " già registrato ...</p>";
                } else {
                    $sql = "INSERT INTO utenti (username, password) VALUES ('$u', '$p')";
                    if (mysqli_query($db, $sql)) {
                        echo "<h2 style='color:darkblue;'>Inserimento avvenuto correttamente ...</h2>";
                    } else {
                        echo "<p style='color:red;'>Errore in inserimento utente ...</p>";
                    }
                }
            }

            mysqli_close($db);
        }
    ?>

    <!-- Form per Accesso o Registrazione -->
    <form method="POST" action="">
        <label for="utente">Username:</label>
        <input type="text" name="utente" id="utente" required>
        <br>
        <label for="pass">Password:</label>
        <input type="password" name="pass" id="pass" required>
        <br>
        <button type="submit" name="Accedi">Accedi</button>
        <button type="submit" name="Registrati">Registrati</button>
    </form>


</body>
</html>