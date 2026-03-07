-- Claude helped me set up this page. I had pseudo tables and I asked it to set them up with dependencies taken into account.
    -- I checked the entire code and learned the syntax I was unfamiliar with. I learned about primary keys and foreign keys here.

-- Create tables
CREATE DATABASE IF NOT EXISTS recipe_site;
USE recipe_site;

CREATE TABLE ingredients (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    info TEXT
);

CREATE TABLE recipes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    protein_type VARCHAR(100) NOT NULL,
    description TEXT,
    instructions TEXT
);

CREATE TABLE recipe_ingredients (
    recipe_id INT,
    ingredient_id INT,
    FOREIGN KEY (recipe_id) REFERENCES recipes(id),
    FOREIGN KEY (ingredient_id) REFERENCES ingredients(id),
    PRIMARY KEY (recipe_id, ingredient_id)
);

-- I gave claude an example code for these insertions and made it do it for the entire list of recipes I gave her. 
-- Also got help with writing some of the recipes I dont know cause free manual labor.

-- Populate tables
INSERT INTO ingredients (name, info) VALUES
('Artichoke', 'A plant that begs to not be eaten but we chop 80% of it and eat it anyways. Western turks go crazy for it and i am no exeption.'),
('Rice', 'The best carb with proteins imo'),
('Lemon', 'Fine touch on olive oil based dishes'),
('Herbs', 'Parsleys, Basil, Mint, etc.'),
('Olive Oil', 'I can just dip bread into olive oil and some spice.'),
('Beef', 'Best use is to mix it with 25% lamb and make some kebap'),
('Butter', 'Second best type of fat after olive oil. Why would one even eat margarin'),
('Garlic', 'Straight up magic'),     
('Pasta', 'Survival food for students but super good when cooked nice'),      
('Chicken', 'Nice'),    
('Orange', 'Zesty sweet fruit'),   
('Salmon', 'It rejects to be cooked bad. I cooked on highest once on accident and still turned out good'),     
('Fish', 'Any other fish than salmon'),      
('Cheese', 'Gouda, Parmesan, Tulum, Ezine, etc.'),   
('Pork', 'I do not prefer but its cheap'),       
('Eggs', 'No breakfast is breakfast without eggs'),       
('Tomato', 'So sad we had to ruin the genes of tomatoes'),    
('Pepper', 'Vitamin C and more');     

INSERT INTO recipes (name, protein_type, description, instructions) VALUES
('Artichoke Rice', 'Vegetarian', 'My mom cooks this very good. One of my favorite aegean meals', 'Chop and saute artichoke hearts in olive oil with garlic. Cook rice separately, then mix together with lemon juice and fresh herbs'),
('Ribeye', 'Beef', 'Fancyy', 'Let the steak reach room temp. Sear on high heat with butter and garlic, basting constantly. Rest 5 minutes before cutting.'),
('Bouillon Soup with Noodles', 'Chicken', 'Grandma would cook it and the house would smell amazing', 'Simmer chicken in water with herbs and olive oil until you have a rich broth. Add pasta and cook until tender. Season with salt.'),
('Chicken Legs & Rice', 'Chicken', 'Classic!', 'Season legs and cook on stove with butter and a little water. Cook rice with butter and a pinch of salt. Serve chicken on top.'),
('Orange Glazed Salmon', 'Fish', 'Almost impossible to cook salmon bad. Best fish ever', 'Get the ready-to-cook ones from H-E-B and cook on both sides on stove, very easy.'),
('Oven Baked Sea Bass', 'Fish', 'My dads delicacy', 'Clean the fish, stuff with garlic, drizzle olive oil all over. Bake at 400F for 20 minutes until skin is crispy and inside juicyy.'),
('Pasta Carbonara', 'Pork', 'The authentic (and overrated) way', 'Get a lot of parmesan and black pepper, grind it with egg yolks. Cook guanciale and add the fat into the sauce. Cook spaghetti and mix with the sauce carefully.'),
('Menemen', 'Vegetarian', 'Best breakfast ever.', 'Saute diced pepper and tomato in olive oil until soft. Crack eggs in and scramble gently into the mix. Pro tip: Dont pop the yolks until last minute so it is creamy. Credits to my sister');

INSERT INTO recipe_ingredients (recipe_id, ingredient_id) VALUES
-- 1: Artichoke Rice (artichoke, rice, lemon, herbs, olive oil)
(1, 1), (1, 2), (1, 3), (1, 4), (1, 5),
-- 2: Ribeye (beef, butter, garlic, herbs) - salt removed
(2, 6), (2, 7), (2, 8), (2, 4),
-- 3: Bouillon Soup (pasta, chicken, olive oil, herbs)
(3, 9), (3, 10), (3, 5), (3, 4),
-- 4: Chicken Legs & Rice (chicken, rice, butter)
(4, 10), (4, 2), (4, 7),
-- 5: Orange Glazed Salmon (orange, salmon, butter)
(5, 11), (5, 12), (5, 7),
-- 6: Oven Baked Sea Bass (olive oil, fish, garlic)
(6, 5), (6, 13), (6, 8),
-- 7: Pasta Carbonara (pasta, cheese, pork, eggs)
(7, 9), (7, 14), (7, 15), (7, 16),
-- 9: Menemen (eggs, tomato, pepper, olive oil)
(8, 16), (8, 17), (8, 18), (8, 5);