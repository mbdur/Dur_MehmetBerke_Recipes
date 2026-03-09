var express = require('express');
var app = express();
const { databaseConnection: database } = require('./db/database');

app.set('view engine', 'ejs');
app.use(express.static('public'));
app.use(express.urlencoded({ extended: true })); // for reading form submissions

const { getAllRecipes, getAllIngredients, getRecipeById, insertRecipe } = require('./services/recipeService');

app.get('/', (req, res) => {
    res.render('index');
});

app.get('/recipes', (req, res) => {
  getAllRecipes((results) => {
    res.render('recipes', { recipes: results });
  });
});

app.get('/recipes/:id', (req, res) => {
  getRecipeById(req.params.id, (recipe, ingredients) =>{
    res.render('recipe', {recipe: recipe, ingredients: ingredients});
  });
});

app.get('/add-recipe', (req, res) => {
  getAllIngredients((results) => {
    res.render('add-recipe', {ingredients: results});
  });
});

// req.body, redirect, and the declaration of values const were done by Claude. Adding the ingredients was challenging and it is kinda restrictive rn with limited options.
app.post('/add-recipe', (req, res) => {
  const { name, protein_type, description, instructions } = req.body;
  const selected = req.body.ingredients || []; // array of ingredient ids checked
  
  insertRecipe(name, protein_type, description, instructions, (result) => {
    const recipeId = result.insertId;
    const values = [].concat(selected).map(ingId => [recipeId, ingId]);
    if (values.length > 0) {
      database.query('INSERT INTO recipe_ingredients (recipe_id, ingredient_id) VALUES ?', [values], (err) => {
        if (err) throw err;
        res.redirect('/recipes');
      });
    } else {
      res.redirect('/recipes');
    }
  });
});

app.listen(3000, () => console.log('Server running on port 3000'));