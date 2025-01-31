// Connettiamo al server Flask tramite WebSocket
const socket = io('http://localhost:5000');

// Stato di connessione
const statusElement = document.getElementById('status');
const logElement = document.getElementById('log');

// Aggiorna stato di connessione
socket.on('connect', () => {
    statusElement.textContent = 'Stato: Connesso';
    console.log('Connesso al server WebSocket.');
});

socket.on('disconnect', () => {
    statusElement.textContent = 'Stato: Disconnesso';
    console.log('Disconnesso dal server WebSocket.');
});

// Assegna l'username (simulato con un prompt)
const username = prompt("Inserisci il tuo username:");
socket.emit('register_user', { username });

// Invia una richiesta di permesso
document.getElementById('sendRequestBtn').addEventListener('click', () => {
    const targetUser = document.getElementById('targetUser').value;
    if (targetUser) {
        socket.emit('send_permission_request', { target_user: targetUser, requesting_user: username });
        logMessage(`Richiesta inviata a ${targetUser}`);
    } else {
        alert('Inserisci un username valido!');
    }
});

// Riceve una richiesta di permesso
socket.on('receive_permission_request', (data) => {
    const fromUser = data.from_user;
    const accept = confirm(`L'utente ${fromUser} richiede l'accesso. Accetti?`);
    socket.emit('respond_permission_request', { requesting_user: fromUser, response: accept });
    logMessage(`Richiesta da ${fromUser} ${accept ? 'accettata' : 'rifiutata'}`);
});

// Riceve la risposta a una richiesta
socket.on('permission_response', (data) => {
    logMessage(`Risposta ricevuta: ${data.response ? 'Accettata' : 'Rifiutata'}`);
});

// Log helper
function logMessage(message) {
    const li = document.createElement('li');
    li.textContent = message;
    logElement.appendChild(li);
}
