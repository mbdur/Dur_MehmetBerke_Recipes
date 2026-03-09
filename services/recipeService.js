module.exports = { getAllRecipes, getAllIngredients, getRecipeById, insertRecipe };
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

function getAllIngredients(callback){
    let sql = 'SELECT * from ingredients'
    
    database.query(sql, (err,result) => {
        if (err) throw err;
        for (let i = 0; i < result.length; i++) {
            console.log(result[i].name);  
        }
        callback(result);
    });
}

function getRecipeById(id, callback) {
    // =? placeholder is used for safety
    let recipeSql = 'SELECT * FROM recipes WHERE id = ?';
    let ingredientSql = `
        SELECT i.name, i.info 
        FROM ingredients i
        JOIN recipe_ingredients ri ON i.id = ri.ingredient_id
        WHERE ri.recipe_id = ?
    `;

    database.query(recipeSql, [id], (err, recipeResult) => {
        if (err) throw err;
        database.query(ingredientSql, [id], (err, ingredientResult) => {
            if (err) throw err;
            callback(recipeResult[0], ingredientResult);
        });
    });
}


function insertRecipe(name, protein_type, description, instructions, callback) {
    let sql = "INSERT INTO recipes (name, protein_type, description, instructions) VALUES (?,?,?,?)";

    database.query(sql, [name, protein_type, description, instructions], (err, result) => {
        if (err) throw err;
        callback(result);
    });
}


