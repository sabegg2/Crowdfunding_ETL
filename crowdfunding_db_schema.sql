--Cleanup script
DROP TABLE IF EXISTS contacts CASCADE;
DROP TABLE IF EXISTS category CASCADE;
DROP TABLE IF EXISTS subcategory CASCADE;
DROP TABLE IF EXISTS campaign CASCADE;

--Creating the contacts table
CREATE TABLE contacts (
	contact_id BIGSERIAL PRIMARY KEY,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	email VARCHAR NOT NULL
);

--Creating the category table
CREATE TABLE category (
	category_id VARCHAR PRIMARY KEY,
	category VARCHAR NOT NULL
);

--Creating the subcategory table
CREATE TABLE subcategory (
	subcategory_id VARCHAR PRIMARY KEY,
	subcategory VARCHAR NOT NULL
);

--Creating the campaign table
CREATE TABLE campaign (
	cf_id BIGSERIAL PRIMARY KEY,
	contact_id BIGINT NOT NULL,
	FOREIGN KEY (contact_id) REFERENCES Contacts (contact_id),
	company_name VARCHAR NOT NULL,
	description VARCHAR NOT NULL,
	goal DOUBLE PRECISION NOT NULL,
	pledged DOUBLE PRECISION NOT NULL,
	outcome VARCHAR NOT NULL,
	backers_count BIGINT NOT NULL,
	country VARCHAR NOT NULL,
	currency VARCHAR NOT NULL,
	launched_date DATE NOT NULL,
	end_date DATE NOT NULL,
	category_id VARCHAR NOT NULL,
	FOREIGN KEY (category_id) REFERENCES Category (category_id),
	subcategory_id VARCHAR NOT NULL,
	FOREIGN KEY (subcategory_id) REFERENCES Subcategory (subcategory_id)
);