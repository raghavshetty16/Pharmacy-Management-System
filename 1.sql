-- CUSTOMER TABLE
CREATE TABLE pharmacy_customer (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    password VARCHAR(128) NOT NULL,
    last_login DATETIME,
    is_superuser BOOL NOT NULL,
    username VARCHAR(150) NOT NULL UNIQUE,
    first_name VARCHAR(150) NOT NULL,
    last_name VARCHAR(150) NOT NULL,
    email VARCHAR(254) NOT NULL,
    is_staff BOOL NOT NULL,
    is_active BOOL NOT NULL,
    date_joined DATETIME NOT NULL,
    user_type VARCHAR(10) NOT NULL
);


-- PHARMACY CATEGORY TABLE
CREATE TABLE pharmacy_category (
    id INTEGER NOT NULL,
    name VARCHAR(50),
    PRIMARY KEY (id AUTOINCREMENT)
);


-- PATIENT TABLE
CREATE TABLE pharmacy_patients (
    id INTEGER NOT NULL,
    reg_no VARCHAR(30) UNIQUE,
    gender VARCHAR(7),
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    dob DATETIME,
    phone_number VARCHAR(10),
    profile_pic VARCHAR(100),
    age INTEGER,
    address VARCHAR(300),
    date_admitted DATETIME NOT NULL,
    last_updated DATETIME NOT NULL,
    admin_id BIGINT UNIQUE,
    PRIMARY KEY (id AUTOINCREMENT),
    FOREIGN KEY (admin_id) REFERENCES pharmacy_customer (id) 
);


-- PHARMACY STOCK TABLE
CREATE TABLE pharmacy_stock (
    id INTEGER NOT NULL,
    drug_imprint VARCHAR(6),
    drug_name VARCHAR(50),
    drug_color VARCHAR(50),
    drug_shape VARCHAR(50),
    quantity INTEGER,
    receive_quantity INTEGER,
    reorder_level INTEGER,
    manufacture VARCHAR(50),
    last_updated DATETIME NOT NULL,
    timestamp DATETIME NOT NULL,
    drug_strength VARCHAR(10),
    valid_from DATETIME,
    valid_to DATETIME,
    drug_description TEXT,
    drug_pic VARCHAR(100),
    category_id BIGINT,
    PRIMARY KEY (id AUTOINCREMENT),
    FOREIGN KEY (category_id) REFERENCES pharmacy_category (id) 
);


-- PRESCRIPTION TABLE
CREATE TABLE pharmacy_prescription (
    id INTEGER NOT NULL,
    description TEXT,
    prescribe VARCHAR(100),
    date_precribed DATETIME NOT NULL,
    patient_id_id BIGINT,
    PRIMARY KEY (id AUTOINCREMENT),
    FOREIGN KEY (patient_id_id) REFERENCES pharmacy_patients (id)
);


-- PHARMACY CLERK TABLE
CREATE TABLE pharmacy_pharmacyclerk (
    id INTEGER NOT NULL,
    emp_no VARCHAR(100),
    gender VARCHAR(100),
    mobile VARCHAR(10),
    address VARCHAR(300),
    profile_pic VARCHAR(100),
    age INTEGER,
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL,
    admin_id BIGINT UNIQUE,
    PRIMARY KEY (id AUTOINCREMENT),
    FOREIGN KEY (admin_id) REFERENCES pharmacy_customer (id)
);

-- PHARMACIST TABLE
CREATE TABLE pharmacy_pharmacist (
    id INTEGER NOT NULL,
    emp_no VARCHAR(100),
    age INTEGER,
    gender VARCHAR(100),
    mobile VARCHAR(10),
    address VARCHAR(300),
    profile_pic VARCHAR(100),
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL,
    admin_id BIGINT UNIQUE,
    PRIMARY KEY (id AUTOINCREMENT),
    FOREIGN KEY (admin_id) REFERENCES pharmacy_customer (id)
);


-- DOCTOR TABLE
CREATE TABLE pharmacy_doctor (
    id INTEGER NOT NULL,
    emp_no VARCHAR(100),
    age INTEGER,
    gender VARCHAR(100),
    mobile VARCHAR(10),
    address VARCHAR(300),
    profile_pic VARCHAR(100),
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL,
    admin_id BIGINT UNIQUE,
    PRIMARY KEY (id AUTOINCREMENT),
    FOREIGN KEY (admin_id) REFERENCES pharmacy_customer (id)
);

-- ADMIN TABLE
CREATE TABLE django_admin_log (
    id INTEGER NOT NULL,
    action_time DATETIME NOT NULL,
    object_id TEXT,
    object_repr VARCHAR(200) NOT NULL,
    change_message TEXT NOT NULL,
    content_type_id INTEGER,
    user_id BIGINT NOT NULL,
    action_flag SMALLINT UNSIGNED NOT NULL CHECK (action_flag >= 0),
    PRIMARY KEY (id AUTOINCREMENT),
    FOREIGN KEY (content_type_id) REFERENCES django_content_type (id),
    FOREIGN KEY (user_id) REFERENCES pharmacy_customer (id) 
);

