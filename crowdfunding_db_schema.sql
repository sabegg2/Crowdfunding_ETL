--Cleanup script
DROP TABLE IF EXISTS contacts CASCADE;
DROP TABLE IF EXISTS category CASCADE;
DROP TABLE IF EXISTS subcategory CASCADE;
DROP TABLE IF EXISTS campaign CASCADE;

--Creating the contacts table
CREATE TABLE contacts (
	contact_id BIGSERIAL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	email VARCHAR(50) NOT NULL,
	CONSTRAINT email_check CHECK (email LIKE '%@%')
);

--Creating the category table
CREATE TABLE category (
	category_id VARCHAR(5) PRIMARY KEY,
	category VARCHAR(50) NOT NULL,
	CONSTRAINT category_check CHECK (category_id LIKE 'cat%')
);

--Creating the subcategory table
CREATE TABLE subcategory (
	subcategory_id VARCHAR(10) PRIMARY KEY,
	subcategory VARCHAR(50) NOT NULL,
	CONSTRAINT subcategory_check CHECK (subcategory_id LIKE 'subcat%')
);

--Creating the campaign table
CREATE TABLE campaign (
	cf_id BIGSERIAL PRIMARY KEY,
	contact_id BIGINT NOT NULL,
	FOREIGN KEY (contact_id) REFERENCES Contacts (contact_id),
	company_name VARCHAR(100) NOT NULL,
	description VARCHAR NOT NULL,
	goal DOUBLE PRECISION NOT NULL,
	pledged DOUBLE PRECISION NOT NULL,
	outcome VARCHAR(50) NOT NULL,
	backers_count BIGINT NOT NULL,
	country VARCHAR(3) NOT NULL,
	currency VARCHAR(3) NOT NULL,
	launched_date DATE NOT NULL,
	end_date DATE NOT NULL,
	category_id VARCHAR(5) NOT NULL,
	FOREIGN KEY (category_id) REFERENCES Category (category_id),
	CONSTRAINT category_check CHECK (category_id LIKE 'cat%'),
	subcategory_id VARCHAR(10) NOT NULL,
	FOREIGN KEY (subcategory_id) REFERENCES Subcategory (subcategory_id),
	CONSTRAINT subcategory_check CHECK (subcategory_id LIKE 'subcat%'),
);
