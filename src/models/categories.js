import db from './db.js'

const getAllCategories = async () => {
    const query = `
        SELECT category_id, name
      FROM public.category;
    `;
    const result = await db.query(query);
    return result.rows;
};

const getCategoryById = async (categoryId) => {
    const query = `
        SELECT category_id, name
      FROM public.category
      WHERE category_id = $1;
    `;
    const queryParams = [categoryId];
    const result = await db.query(query, queryParams);
    return result.rows[0];
} 

const getCategoriesByProjectId = async (projectId) => {
    const query = `
        SELECT c.category_id, c.name
      FROM public.category c
      JOIN project_category pc ON c.category_id = pc.category_id
      WHERE pc.project_id = $1;
    `;  
    const queryParams = [projectId];
    const result = await db.query(query, queryParams);
    return result.rows;
};

const getServiceProjectsByCategoryId = async (categoryId) => {
    const query = `
        SELECT p.project_id, p.organization_id, p.title, p.description, p.location, p.project_date
      FROM public.project p
      JOIN project_category pc ON p.project_id = pc.project_id
      WHERE pc.category_id = $1;
    `;
    const queryParams = [categoryId];
    const result = await db.query(query, queryParams);
    return result.rows;
};

export { getAllCategories, getCategoryById, getCategoriesByProjectId, getServiceProjectsByCategoryId };  