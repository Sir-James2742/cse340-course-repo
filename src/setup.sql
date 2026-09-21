CREATE TABLE organization (
    organization_id SERIAL PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    description TEXT NOT NULL,
    contact_email VARCHAR(255) NOT NULL,
    logo_filename VARCHAR(255) NOT NULL
);
INSERT INTO organization (name, description, contact_email, logo_filename)
VALUES
('BrightFuture Builders', 'A nonprofit focused on improving community infrastructure through sustainable construction projects.', 'info@brightfuturebuilders.org', 'brightfuture-logo.png'),
('GreenHarvest Growers', 'An urban farming collective promoting food sustainability and education in local neighborhoods.', 'contact@greenharvest.org', 'greenharvest-logo.png'),
('UnityServe Volunteers', 'A volunteer coordination group supporting local charities and service initiatives.', 'hello@unityserve.org', 'unityserve-logo.png');
CREATE TABLE project (
    project_id SERIAL PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    description TEXT,
    location VARCHAR(150),
    organization_id INT,
    FOREIGN KEY (organization_id) REFERENCES organization(organization_id)
);
INSERT INTO project
(title, description, location, organization_id)
VALUES
('Community Center Renovation',
 'Renovation and improvement of an existing community center.',
 'Nairobi',
 1),

('Sustainable School Construction',
 'Construction of environmentally friendly classrooms.',
 'Kiambu',
 1),

('Rural Footbridge Project',
 'Construction of safe pedestrian footbridges for local communities.',
 'Machakos',
 1),

('Affordable Housing Initiative',
 'Development of affordable and sustainable housing units.',
 'Nakuru',
 1),

('Community Water Facility',
 'Construction of a community water facility to improve access to clean water.',
 'Kajiado',
 1),

('Community Vegetable Garden',
 'Establishment of a community vegetable garden to improve food security.',
 'Nairobi',
 2),

('Urban Farming Training',
 'Training residents on sustainable urban farming techniques.',
 'Kiambu',
 2),

('School Garden Program',
 'Creation of school gardens for agricultural and environmental education.',
 'Nakuru',
 2),

('Community Composting Project',
 'A project that converts organic household waste into useful compost.',
 'Machakos',
 2),

('Food Donation Harvest',
 'Harvesting and distributing surplus vegetables to families in need.',
 'Kajiado',
 2),

('Community Cleanup Drive',
 'Volunteers clean public spaces and promote responsible waste management.',
 'Nairobi',
 3),

('Elderly Support Program',
 'Volunteers provide assistance and support to elderly community members.',
 'Kiambu',
 3),

('School Supplies Donation',
 'Collection and distribution of school supplies to students in need.',
 'Machakos',
 3),

('Community Health Awareness',
 'Community activities promoting health, sanitation, and hygiene.',
 'Nakuru',
 3),

('Youth Mentorship Program',
 'Mentorship activities providing guidance on education and career development.',
 'Kajiado',
 3);

 CREATE TABLE category (
    category_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE project_category (
    project_id INT NOT NULL,
    category_id INT NOT NULL,
    PRIMARY KEY (project_id, category_id),
    FOREIGN KEY (project_id) REFERENCES project(project_id) ON DELETE CASCADE,
    FOREIGN KEY (category_id) REFERENCES category(category_id) ON DELETE CASCADE
);

INSERT INTO category (name)
  VALUES ('Environmental'),
         ('Educational'),
		 ('Community Service'),
		 ('Health and Wellness');

INSERT INTO project_category (project_id, category_id)
VALUES
    (1, 1),
    (2, 2),
    (3, 4);
INSERT INTO project_category (project_id, category_id)
VALUES
    (1, 3),
    (1, 4);		 

UPDATE project
SET project_date = CASE project_id
    WHEN 1 THEN '2026-12-08'::date
    WHEN 2 THEN '2026-11-03'::date
    WHEN 3 THEN '2027-01-01'::date
    WHEN 4 THEN '2026-08-10'::date
    WHEN 5 THEN '2026-10-20'::date
    WHEN 6 THEN '2026-11-11'::date
    WHEN 7 THEN '2026-10-10'::date
    WHEN 8 THEN '2026-12-30'::date
    WHEN 9 THEN '2026-10-20'::date
    WHEN 10 THEN '2026-12-24'::date
    WHEN 11 THEN '2026-11-15'::date
    WHEN 12 THEN '2026-12-01'::date
    WHEN 13 THEN '2027-02-10'::date
END
WHERE project_id BETWEEN 1 AND 13;

SELECT * FROM project

UPDATE project
SET project_date = CASE project_id
    WHEN 14 THEN '2026-12-29'::date
    WHEN 15 THEN '2027-11-03'::date
END
WHERE project_id BETWEEN 14 AND 15;
DELETE FROM project_category;


INSERT INTO project_category (project_id, category_id)
VALUES
    (1, 3),
    (2, 2),
    (2, 1),
    (3, 3),
    (4, 3),
    (4, 1),
    (5, 3),
    (5, 1),
    (6, 1),
    (6, 3),
    (7, 2),
    (7, 1),
    (8, 2),
    (8, 1),
    (9, 1),
    (9, 3),
    (10, 3),
    (10, 4),
    (11, 1),
    (11, 3),
    (12, 3),
    (12, 4),
    (13, 2),
    (13, 3),
    (14, 4),
    (14, 2),
    (15, 2),
    (15, 3);