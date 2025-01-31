window.addEventListener('load', () => {
    // Crea il canvas
    let canvas = document.createElement('canvas');
    canvas.id = 'check_mark_canvas';
    canvas.width = document.getElementById('check_mark_container').getBoundingClientRect().width; // Imposta larghezza interna
    canvas.height = document.getElementById('check_mark_container').getBoundingClientRect().height; // Imposta altezza interna

    const context = canvas.getContext('2d');

    function easeOutQuad(t) {
        return 1 - (1 - t) * (1 - t); // Curva di interpolazione ease-out
    }

    function animateCheckMark(duration) {
        let startTime = null;
    
        // Punti della "X"
        const points = [
            { x: (canvas.width / 4) * 1.1,  y: (canvas.height / 4) * 1.1 }, // Inizio prima barra
            { x: (canvas.width / 4) * 2.95, y: (canvas.height - canvas.height / 4) * 0.95 }, // Fine prima barra
            { x: (canvas.width / 4) * 1.1,  y: (canvas.height - canvas.height / 4) * 0.95 }, // Inizio seconda barra
            { x: (canvas.width / 4) * 2.95, y: (canvas.height / 4) * 1.1 },  // Fine seconda barra
        ];
    
        function drawFrame(timestamp) {
            if (!startTime) startTime = timestamp;
            const elapsed = timestamp - startTime;
    
            // Calcola la progressione (tra 0 e 1) con easing
            const progress = easeOutQuad(Math.min(elapsed / duration, 1));
    
            // Pulisce il canvas
            context.clearRect(0, 0, canvas.width, canvas.height);
            context.beginPath();
            context.strokeStyle = 'white';
            context.lineWidth = 13;
            context.lineCap = 'round';
            context.lineJoin = 'round'; // Arrotonda gli spigoli
    
            // Disegna il primo segmento (prima barra della X)
            if (progress <= 0.5) {
                const segmentProgress = progress / 0.5; // Interpolazione per il primo segmento
                const currentX = points[0].x + (points[1].x - points[0].x) * segmentProgress;
                const currentY = points[0].y + (points[1].y - points[0].y) * segmentProgress;
                context.moveTo(points[0].x, points[0].y);
                context.lineTo(currentX, currentY);
            } else {
                // Disegna il primo segmento completo
                context.moveTo(points[0].x, points[0].y);
                context.lineTo(points[1].x, points[1].y);
    
                // Disegna il secondo segmento (seconda barra della X)
                const segmentProgress = (progress - 0.5) / 0.5; // Interpolazione per il secondo segmento
                const currentX = points[2].x + (points[3].x - points[2].x) * segmentProgress;
                const currentY = points[2].y + (points[3].y - points[2].y) * segmentProgress;
                context.moveTo(points[2].x, points[2].y); // Assicurati che la linea parta dal punto corretto
                context.lineTo(currentX, currentY);
            }
    
            context.stroke();
    
            // Se l'animazione non è completata, richiama il frame successivo
            if (progress < 1) {
                requestAnimationFrame(drawFrame);
            }
        }
    
        requestAnimationFrame(drawFrame);
    }
    

    // Aggiungi il listener per il click
    canvas.addEventListener('click', () => {
        animateCheckMark(400); // 1000ms = 1 secondo
    });

    // Aggiungi il canvas al container
    document.getElementById('check_mark_container').appendChild(canvas);
});
