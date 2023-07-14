import express from 'express';
import path from 'path';
import {fileURLToPath} from 'url';
import {login} from './database.js';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const app = express();
const port = 3000;

// Statische Dateien bereitstellen
app.use(express.static(__dirname));

// Login-Endpunkt
app.post('/login', express.json(), async (req, res) => {
    const {name, password} = req.body;
    try {
        const result = await login(name, password);
        res.json(result);
    } catch (error) {
        res.status(400).json({error: error.message});
    }
});

// Alle Anfragen an die index.html weiterleiten
app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, 'index.html'));
});

// Server starten
app.listen(port, () => {
    console.log(`Server läuft auf Port ${port}`);
});
