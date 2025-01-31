from flask import Flask, request  # Importazione corretta di request
from flask_socketio import SocketIO, emit

app = Flask(__name__)
app.config['SECRET_KEY'] = 'secret!'
socketio = SocketIO(app, cors_allowed_origins="*")

# Dizionario per tracciare i client connessi
clients = {}

# Evento di connessione
@socketio.on('connect')
def handle_connect():
    print('Un client si è connesso.')

# Evento di disconnessione
@socketio.on('disconnect')
def handle_disconnect():
    username = None
    for user, sid in clients.items():
        if sid == request.sid:
            username = user
            break
    if username:
        del clients[username]
        print(f'Utente {username} si è disconnesso.')
    else:
        print(f'Un client con ID {request.sid} si è disconnesso.')

# Registrazione dell'utente
@socketio.on('register_user')
def register_user(data):
    username = data.get('username')
    if username:
        clients[username] = request.sid
        print(f'Utente registrato: {username} con ID {request.sid}')
    else:
        print("Tentativo di registrazione fallito: username non valido.")

# Invia una richiesta di permesso
@socketio.on('send_permission_request')
def send_permission_request(data):
    target_user = data.get('target_user')
    requesting_user = data.get('requesting_user')
    if target_user in clients:
        emit('receive_permission_request', {'from_user': requesting_user}, room=clients[target_user])
    else:
        print(f"Utente {target_user} non trovato.")

# Risponde a una richiesta di permesso
@socketio.on('respond_permission_request')
def respond_permission_request(data):
    requesting_user = data.get('requesting_user')
    response = data.get('response')
    if requesting_user in clients:
        emit('permission_response', {'response': response}, room=clients[requesting_user])

if __name__ == '__main__':
    socketio.run(app, debug=True)
