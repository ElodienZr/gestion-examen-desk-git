const express = require('express');
const cors = require('cors');
const { Pool } = require('pg');
const bcrypt = require('bcrypt');
const bodyParser = require('body-parser');
const { body, validationResult } = require('express-validator');


// Initialisation de l'application Express
const app = express();
app.use(cors());
app.use(bodyParser.json());
app.use(express.json());

// Connexion à PostgreSQL
const pool = new Pool({
  user: 'postgres', // Remplacez par vos informations PostgreSQL
  host: 'localhost',
  database: 'dev_exam', // Nom de la base de données
  password: 'devdev2025',
  port: 5432,
});

const corsOptions = {
  origin: 'http://localhost:3000',  // React app URL (make sure it's correct)
  methods: ['GET', 'POST'],
};
app.use(cors(corsOptions));


// Récupérer les informations d'un utilisateur
app.get('/api/user/:username', async (req, res) => {
  const { username } = req.params;
  const query = 'SELECT username, user_nom, user_prenom, im, email, sexe, tel FROM t_users WHERE username = $1 AND enabled = 1';
  
  try {
    const result = await pool.query(query, [username]);
    
    if (result.rows.length > 0) {
      res.json(result.rows[0]);  // Renvoie les données de l'utilisateur sous forme de JSON
    } else {
      res.status(404).send('User not found');  // Si l'utilisateur n'existe pas
    }
  } catch (error) {
    console.error('Error fetching user data:', error);
    res.status(500).send('Server error');  // Si erreur serveur
  }
});

// Mettre à jour les informations d'un utilisateur
app.put('/api/user/:username', [
  body('email').isEmail().withMessage('Email invalide'),
  body('tel').isMobilePhone().withMessage('Numéro de téléphone invalide')
], async (req, res) => {
  const errors = validationResult(req);
  if (!errors.isEmpty()) {
    return res.status(400).json({ errors: errors.array() });
  }

  const { username } = req.params;
  const { user_nom, user_prenom, im, email, sexe, tel, examen_id } = req.body;

  try {
    const query = `
      UPDATE t_users 
      SET user_nom = $1, user_prenom = $2, im = $3, email = $4, sexe = $5, tel = $6, examen_id = $7 
      WHERE username = $8
    `;
    const result = await pool.query(query, [user_nom, user_prenom, im, email, sexe, tel, examen_id, username]);

    if (result.rowCount > 0) {
      res.status(200).send('Utilisateur mis à jour avec succès');
    } else {
      res.status(400).json({ error: 'Échec de la mise à jour de l\'utilisateur' });
    }
  } catch (error) {
    console.error('Erreur lors de la mise à jour de l\'utilisateur:', error);
    res.status(500).json({ error: 'Erreur interne du serveur' });
  }
});


app.get('/candidats', async (req, res) => {
  const { search, ecole } = req.query;  // Récupérer les paramètres de la requête

  console.log('Requête reçue avec les paramètres:', { search, ecole });

  try {
    let query = 'SELECT * FROM t_inscription WHERE 1=1';
    const values = [];

    // Ajouter des conditions à la requête si les paramètres sont présents
    if (search && search.trim()) {
      query += ` AND (LOWER(nom_prenom) LIKE LOWER($1) OR LOWER(genre) LIKE LOWER($1))`;
      values.push(`%${search}%`);
    }

    if (ecole && ecole.trim()) {
      query += ` AND id_etablissement_origine = $2`;
      values.push(ecole);
    }

    // Exécuter la requête SQL
    const result = await pool.query(query, values);
    res.json(result.rows);  // Retourner les résultats sous forme de JSON
  } catch (error) {
    console.error('Erreur lors de la récupération des candidats:', error);
    res.status(500).send('Erreur du serveur');
  }
});

app.put('/candidats/:id', async (req, res) => {
  const { id } = req.params;
  const { nom_prenom, genre, adresse, id_etablissement_origine } = req.body;

  try {
    const result = await pool.query(
      'UPDATE t_inscription SET nom_prenom = $1, genre = $2, adresse = $3, id_etablissement_origine = $4 WHERE id = $5 RETURNING *',
      [nom_prenom, genre, adresse, id_etablissement_origine, id]
    );
    res.json(result.rows[0]);
  } catch (error) {
    console.error('Erreur lors de la modification du candidat', error);
    res.status(500).send('Erreur du serveur');
  }
});



app.get('/ecoles', async (req, res) => {
  try {
    const query = 'SELECT sigle FROM e_etablissement'; // Remplacez par votre requête appropriée
    const result = await pool.query(query);
    res.json(result.rows); // Renvoie les données des écoles sous forme de JSON
  } catch (error) {
    console.error('Erreur lors de la récupération des établissementS:', error);
    res.status(500).send('Erreur du serveur');
  }
});


// API route to fetch the establissements
app.get('/etablissements', async (req, res) => {
  try {
    // Fetch data from the database
    const result = await pool.query(`
      SELECT *
      FROM public.ref_etablissement
      ORDER BY zap ASC
    `);
    
    // Check if data is found
    if (result.rows.length === 0) {
      return res.status(404).json({ message: 'Aucun établissement trouvé' });
    }

    // Send the data as a JSON response
    res.json(result.rows);

  } catch (err) {
    // Log the error for debugging
    console.error('Erreur de serveur :', err);

    // Réponse générique pour l'utilisateur final (en production, éviter de montrer trop de détails)
    res.status(500).json({ message: 'Erreur serveur', error: err.message });
  }
});

// Route pour ajouter une salle et mettre à jour le nombre de classes
app.post('/etablissements/:code/salles', async (req, res) => {
  const { code } = req.params;  // Le code de l'établissement
  const { salle } = req.body;   // Les données de la salle envoyées par le frontend

  if (!salle || salle.trim() === "") {
    return res.status(400).json({ error: "Le nom de la salle est requis." });
  }

  try {
    // 1. Ajouter la salle dans la table t_salles (assurez-vous que la table existe)
    const insertSalleQuery = `
      INSERT INTO t_salles (code_etab, salle) 
      VALUES ($1, $2)
      RETURNING id;
    `;
    const values = [code, salle];
    const resultSalle = await pool.query(insertSalleQuery, values);

    // Récupérer l'id de la nouvelle salle insérée
    const salleId = resultSalle.rows[0].id;

    // 2. Mettre à jour le nombre de salles dans ref_etablissement
    const updateEtablissementQuery = `
      UPDATE ref_etablissement
      SET nombresalles = nombresalles + 1
      WHERE code = $1
      RETURNING nombresalles;
    `;
    const updateValues = [code];
    const resultUpdate = await pool.query(updateEtablissementQuery, updateValues);

    // Vérifiez si l'établissement a bien été mis à jour
    if (resultUpdate.rowCount > 0) {
      res.status(200).json({
        message: "Salle ajoutée et nombre de classes mis à jour.",
        nombre_classes: resultUpdate.rows[0].nombre_classes,  // Renvoyer le nouveau nombre de classes
      });
    } else {
      res.status(400).json({ error: "Établissement non trouvé ou échec de la mise à jour." });
    }
  } catch (error) {
    console.error('Erreur lors de l\'ajout de la salle ou de la mise à jour du nombre de classes:', error);
    res.status(500).json({ error: "Erreur serveur lors de l'ajout de la salle." });
  }
});

// Route pour supprimer une salle et mettre à jour le nombre de classes
app.delete('/etablissements/:code/salles/:salleId', async (req, res) => {
  const { code, salleId } = req.params;  // Le code de l'établissement et l'ID de la salle à supprimer

  try {
    // 1. Supprimer la salle dans la table t_salles
    const deleteSalleQuery = `
      DELETE FROM t_salles
      WHERE id = $1 AND code_etab = $2
    `;
    const deleteValues = [salleId, code];
    const resultSalle = await pool.query(deleteSalleQuery, deleteValues);

    // Vérifier si la salle a bien été supprimée
    if (resultSalle.rowCount === 0) {
      return res.status(404).json({ error: "Salle non trouvée." });
    }

    // 2. Mettre à jour le nombre de salles dans ref_etablissement
    const updateEtablissementQuery = `
      UPDATE ref_etablissement
      SET nombresalles = nombresalles - 1
      WHERE code = $1
      RETURNING nombresalles;
    `;
    const updateValues = [code];
    const resultUpdate = await pool.query(updateEtablissementQuery, updateValues);

    // Vérifier si l'établissement a bien été mis à jour
    if (resultUpdate.rowCount > 0) {
      res.status(200).json({
        message: "Salle supprimée et nombre de classes mis à jour.",
        nombre_classes: resultUpdate.rows[0].nombre_classes,  // Renvoyer le nouveau nombre de classes
      });
    } else {
      res.status(400).json({ error: "Établissement non trouvé ou échec de la mise à jour." });
    }
  } catch (error) {
    console.error('Erreur lors de la suppression de la salle ou de la mise à jour du nombre de classes:', error);
    res.status(500).json({ error: "Erreur serveur lors de la suppression de la salle." });
  }
});

// Route pour ajouter une inscription
// API pour enregistrer les données
app.post("/enregistrer-inscription", async (req, res) => {
  const {
    code_dren,
    code_cisco,
    id_centre_correction,
    id_etablissement_ecrit,
    nom_prenom,
    genre,
    adresse,
    date_naissance,
    nee_vers,
    lieu_naissance,
    fils_de,
    et_de,
    id_etablissement_origine,
    classe,
    option,
    id_etablissement_demande,
    nationalite,
    observation,
  } = req.body;

  // Vérifier que code_dren n'est pas vide ou null
  if (!code_dren || code_dren === "") {
    return res.status(400).send("Le code DREN est requis.");
  }

  const formattedDateNaissance = date_naissance ? date_naissance : null;
  try {
    const query = `
        INSERT INTO t_inscription (code_dren, code_cisco, id_centre_correction, id_etablissement_ecrit, nom_prenom, genre, adresse, date_naissance, nee_vers, lieu_naissance, fils_de, et_de, id_etablissement_origine, classe, option, id_etablissement_demande, nationalite, observation)
        VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16, $17, $18);
    `;
    const values = [
      code_dren,
      code_cisco,
      id_centre_correction,
      id_etablissement_ecrit,
      nom_prenom,
      genre,
      adresse,
      formattedDateNaissance,
      nee_vers,
      lieu_naissance,
      fils_de,
      et_de,
      id_etablissement_origine,
      classe,
      option,
      id_etablissement_demande,
      nationalite,
      observation,
    ];

    await pool.query(query, values);

    res.status(200).send("Inscription enregistrée avec succès.");
  } catch (err) {
    console.error("Erreur lors de l'enregistrement : ", err);
    res.status(500).send("Erreur lors de l'enregistrement.");
  }
});

// Route pour login
app.post('/api/login', async (req, res) => {
  const { username, password } = req.body;
  console.log("Tentative de connexion avec le nom d'utilisateur:", username);

  if (!username || !password) {
    return res.status(400).json({ error: "Nom d'utilisateur et mot de passe requis" });
  }

  try {
    // Requête pour récupérer l'utilisateur
    const query = 'SELECT username, password, code_cisco, roles FROM t_users WHERE username = $1 AND enabled = 1';
    const result = await pool.query(query, [username]);

    if (result.rows.length === 0) {
      return res.status(401).json({ error: 'Nom d\'utilisateur incorrect' });
    }

    const user = result.rows[0];
    console.log('Utilisateur trouvé:', user);

    // Comparaison du mot de passe fourni avec celui haché dans la base de données
    const match = await bcrypt.compare(password, user.password);

    if (match) {
      // Mot de passe correct, réponse avec les données de l'utilisateur
      res.json({
        localite: user.code_cisco,
        roles: user.roles,
      });
    } else {
      // Mot de passe incorrect
      res.status(401).json({ error: 'Mot de passe incorrect' });
    }
  } catch (error) {
    console.error('Erreur lors de la tentative de connexion:', error);
    res.status(500).json({ error: 'Erreur interne du serveur' });
  }
});



// Démarrer le serveur
const PORT = process.env.PORT || 5000;
app.listen(PORT, () => {
  console.log(`Serveur en écoute sur http://localhost:${PORT}`);
});
