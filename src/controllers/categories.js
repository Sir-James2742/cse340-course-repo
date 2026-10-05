
import { getAllCategories } from '../models/categories.js';
import { getCategoryById } from '../models/categories.js';
import { getServiceProjectsByCategoryId } from '../models/categories.js';
import { updateCategoryAssignments , createCategory, updateCategory} from '../models/categories.js';
import { body, validationResult } from 'express-validator';

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
const showAssignCategoriesForm = async (req, res) => {
    const projectId = req.params.projectId;

    const projectDetails = await getProjectDetails(projectId);
    const categories = await getAllCategories();
    const assignedCategories = await getCategoriesByServiceProjectId(projectId);

    const title = 'Assign Categories to Project';

    res.render('assign-categories', { title, projectId, projectDetails, categories, assignedCategories });
};

const processAssignCategoriesForm = async (req, res) => {
    const projectId = req.params.projectId;
    const selectedCategoryIds = req.body.categoryIds || [];

    // Ensure selectedCategoryIds is an array
    const categoryIdsArray = Array.isArray(selectedCategoryIds) ? selectedCategoryIds : [selectedCategoryIds];
    await updateCategoryAssignments(projectId, categoryIdsArray);
    req.flash('success', 'Categories updated successfully.');
    res.redirect(`/project/${projectId}`);
};

const showNewCategoryForm = async (req, res) => {
    const title = 'Add New Category';

    res.render('new-category', { title });
}

const processNewCategoryForm = async (req, res) => {
    const { name, description } = req.body;
    await createCategory(name);
    req.flash('success', 'Category created successfully.');
    res.redirect('/categories');
};
const categoryValidation = [
    body('name')
        .trim()
        .isLength({ min: 2, max: 150 })
        .withMessage('Category name must be between 2 and 150 characters.')
];

const showEditCategoryForm = async (req, res) => {
    const categoryId = req.params.id;
    const category = await getCategoryById(categoryId);
    const title = 'Edit Category';
    res.render('edit-category', { title, category });
};
const processEditCategoryForm = async (req, res) => {
    const categoryId = req.params.id;
    const { name } = req.body;
    await updateCategory(categoryId, name);
    req.flash('success', 'Category updated successfully.');
    res.redirect('/categories');
};  

export {
    showCategoryDetailsPage,
    showCategoriesPage, showAssignCategoriesForm,
    processAssignCategoriesForm, showNewCategoryForm,
    processNewCategoryForm, categoryValidation, showEditCategoryForm, processEditCategoryForm
};