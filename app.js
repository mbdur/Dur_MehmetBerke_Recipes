var express = require('express');
var app = express();
const { databaseConnection: database } = require('./db/database');

app.set('view engine', 'ejs');
app.use(express.static('public'));
app.use(express.urlencoded({ extended: true })); // for reading form submissions

const { getAllRecipes, getRecipeById, insertRecipe } = require('./services/recipeService');

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
    res.render('add-recipe');
});

// didn't know how to read user submissions, Claude generated this code. I asked how req.body and redirect works
app.post('/add-recipe', (req, res) => {
  const { name, protein_type, description, instructions } = req.body;
    insertRecipe(name, protein_type, description, instructions, (result) => {
        res.redirect('add-recipe');
  });
});

app.listen(3000, () => console.log('Server running on port 3000'));