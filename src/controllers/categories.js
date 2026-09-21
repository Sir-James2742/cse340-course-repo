
import { getAllCategories } from '../models/categories.js';
import { getCategoryById } from '../models/categories.js';
import { getServiceProjectsByCategoryId } from '../models/categories.js';


const showCategoryDetailsPage = async (req, res) => {
    const categoryId = req.params.id;
    const category = await getCategoryById(categoryId);
    const projects = await getServiceProjectsByCategoryId(categoryId);
    const title = 'Category Projects';

    res.render('category', { title, category, projects });
};

const showCategoriesPage = async (req, res) => {
    const categories = await getAllCategories();
    const title = 'Service Categories';

    res.render('categories', { title, categories });
};

export { showCategoryDetailsPage, showCategoriesPage };