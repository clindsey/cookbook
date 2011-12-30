# Cookbook

#### MIT License, Chris Lindsey, 2011

### How I Use This
As I'm baking or cooking, I usually take notes using my iPhone, which syncs to iCloud. At the end of the night/week, I'll sit down at my computer and go through the notes listed in my Mail app (it syncs notes across my iOS devices), and do some simple work to convert them to YAML format, which I upload to the `recipes/` folder in this project, along with a picture in the `public/images/` folder.

### How You Should Use It
Naming convention is important here, make sure image and recipe file names are in slug format (SEO friendly, dasherized).

recipes/delicious-burrito.yaml needs to have a corresponding image, public/images/delicious-burrito.png.

Then add it to the site with `rake recipes:add[delicious-burrito]`

example recipe.yaml -

    ---
    title: Chocolate Chunk Cookies
    date: 20111102

    description:  >
      Pretty good, kinda dry, medium thick, tapers / not uniform thickness. Very dry after several days, maybe because of nuts?

    ingredients:
      - flour, 1.5 cups
      - baking soda, 1 tsp
      - white sugar,  0.5 cups
      - brown sugar, 0.3 cups
      - butter, 1.5 sticks
      - eggs, 1
      - vanilla extract, 1 tsp
      - chocolate chunks, 2 cups

    directions:
      - Preheat oven to 340 degrees.
      - In a medium bowl, mix together flour and baking soda; set aside.
      - Cream butter and sugars until light and fluffy.
      - Add eggs and vanilla to cream; beat until well combined
      - Add the flour mixture all at once, and beat until just combined.
      - Stir in chocolate chunks.
      - Drop tablespoons of batter onto prepared cookie sheets, two inches apart.
      - Bake until golden brown, about 15 minutes.

    categories:
      - Cookies
      - Chocolate
