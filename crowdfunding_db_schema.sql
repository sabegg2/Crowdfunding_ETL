--Cleanup script
DROP TABLE IF EXISTS Contacts CASCADE;
DROP TABLE IF EXISTS Category CASCADE;
DROP TABLE IF EXISTS Subcategory CASCADE;
DROP TABLE IF EXISTS Campaign CASCADE;

--Creating the Contacts Table
CREATE TABLE Contacts (
	contact_id BIGSERIAL PRIMARY KEY NOT NULL,
	first_name VARCHAR,
	last_name VARCHAR,
	email VARCHAR
);

CREATE TABLE Category (
	category_id VARCHAR PRIMARY KEY NOT NULL,
	category VARCHAR
);

CREATE TABLE Subcategory (
	subcategory_id VARCHAR PRIMARY KEY NOT NULL,
	subcategory VARCHAR
);

CREATE TABLE Campaign (
	cf_id BIGSERIAL NOT NULL,
	contact_id BIGINT NOT NULL,
	FOREIGN KEY (contact_id) REFERENCES Contacts (contact_id),
	company_name VARCHAR,
	description VARCHAR,
	goal DOUBLE,
	pleged DOUBLE,
	outcome VARCHAR,
	backers_count BIGINT,
	country VARCHAR,
	currency VARCHAR,
	launched_date DATETIME,
	end_date DATETIME,
	category_id VARCHAR,
	FOREIGN KEY (category_id) REFERENCES Category (category_id)
	subcategory_id VARCHAR,
	FOREIGN KEY (subcategory_id) REFERENCES Subcategory (subcategory_id)
);