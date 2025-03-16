<?php

	if (isset($_POST['Accedi'])) 
		$auth = true;
	else 						 
		$auth = false;

	$u = $_POST['utente'];
	$p = $_POST['pass'];

	/////////////////////////
	// Connessiona a MySql //
	/////////////////////////
	$db = mysqli_connect("127.0.0.1", "root", "", "MOSSCATIELLO");

	if ($db == false) {
		echo "Errore in connessione dbms ...";
		exit();
	}


	if ($auth) {
		////////////////////
		// Autenticazione //
		////////////////////
		$sql = "SELECT * FROM utenti";
		$rec = mysqli_query($db, $sql);

		if ($rec == false) {
			echo "Errore in esecuzione query ...";
			exit();
		}

		$found = false;
		while ($row = mysqli_fetch_array($rec)) {
			if ($u == $row['username'] && $p == $row['password']) {
				$found = true;
				break;
			}
		}

		if ($found) {
			echo "<h2 style='color:blue;'>Buongiorno " . $u . "</h2>";
		} else {
			echo "Credenziali errate ...";
		}

	} else {
		///////////////////
		// Registrazione //
		///////////////////

		// Verifica username //
		$sql = "SELECT * FROM utenti WHERE username='$u' ;";
		$rec = mysqli_query($db, $sql);

		if (mysqli_num_rows($rec) > 0) {
			// Utente già presente //
			echo "Attenzione ... utente " . $u . " gia' registrato ...";
			exit();
		}

		///////////////////////

		$sql = "INSERT INTO utenti (`username`,`password`) VALUES ('$u','$p');";
		$rec = mysqli_query($db, $sql);

		if (!$rec) {
			echo "Sql = " . $sql;
			echo "<h2 style='color:red;'>Errore in inserimento utente ...</h2>";
			exit();
		}

		echo "<h2 style='color:darkblue;'>Inserimento avvenuto correttamente ...</h2>";

	}
?>
