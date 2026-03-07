module.exports = { getAllRecipes, getRecipeById, insertRecipe };
const { databaseConnection: database } = require('../db/database');

function getAllRecipes(callback) {
    let sql = 'SELECT * FROM recipes';
 
    database.query(sql, (err, result) => {
        if (err) throw err;
        for (let i = 0; i < result.length; i++) {
            console.log(result[i].name);  
        }
        callback(result);
    });
}

function getRecipeById(id, callback) {
    // =? placeholder is used for safety
    let sql = 'SELECT * FROM recipes WHERE id = ?';
 
    database.query(sql, [id], (err, result) => {
        if (err) throw err;
        console.log(result[0].name);  
        callback(result[0]);
    });

}

function insertRecipe(name, protein_type, description, instructions, callback) {
    let sql = "INSERT INTO recipes (name, protein_type, description, instructions) VALUES (?,?,?,?)";

    database.query(sql, [name, protein_type, description, instructions], (err, result) => {
        if (err) throw err;
        callback(result);
    });
}