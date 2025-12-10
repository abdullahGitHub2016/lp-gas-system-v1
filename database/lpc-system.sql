-- companies
CREATE TABLE companies (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL UNIQUE,
  code VARCHAR(50),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- cylinder_sizes (e.g., 12kg, 30kg)
CREATE TABLE cylinder_sizes (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,         -- "12kg", "30kg", "45kg", "small", "medium"
  weight_kg DECIMAL(6,2) NULL,       -- optional numeric weight
  description VARCHAR(255),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- lots (purchase batches)
CREATE TABLE lots (
  id INT AUTO_INCREMENT PRIMARY KEY,
  company_id INT NOT NULL,
  cylinder_size_id INT NOT NULL,
  lot_number VARCHAR(100) NOT NULL,
  purchase_price DECIMAL(14,2) NOT NULL, -- unit price per bottle in local currency
  quantity INT NOT NULL,                 -- original purchased quantity in this lot
  remaining_quantity INT NOT NULL,       -- remaining stock in this lot
  purchase_date DATE NOT NULL,
  expiry_date DATE NULL,
  remarks TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (company_id) REFERENCES companies(id),
  FOREIGN KEY (cylinder_size_id) REFERENCES cylinder_sizes(id),
  UNIQUE (company_id, cylinder_size_id, lot_number)
);

-- dealers (local dealers that the seller sells to)
CREATE TABLE dealers (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  contact_person VARCHAR(255),
  phone VARCHAR(50),
  address TEXT,
  credit_limit DECIMAL(14,2) DEFAULT 0,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- purchases (records when seller bought a lot - optional duplicates of lots)
CREATE TABLE purchases (
  id INT AUTO_INCREMENT PRIMARY KEY,
  lot_id INT NOT NULL,
  invoice_no VARCHAR(100),
  supplier_reference VARCHAR(255),
  created_by INT, -- user id
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (lot_id) REFERENCES lots(id)
);

-- sales (invoices / orders to dealers)
CREATE TABLE sales (
  id INT AUTO_INCREMENT PRIMARY KEY,
  dealer_id INT NOT NULL,
  invoice_no VARCHAR(100) NOT NULL UNIQUE,
  sale_date DATETIME DEFAULT CURRENT_TIMESTAMP,
  total_amount DECIMAL(14,2) NOT NULL,
  discount_amount DECIMAL(14,2) DEFAULT 0,
  vat_amount DECIMAL(14,2) DEFAULT 0,
  paid_amount DECIMAL(14,2) DEFAULT 0,
  status ENUM('draft','posted','paid','cancelled') DEFAULT 'draft',
  created_by INT,
  remarks TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (dealer_id) REFERENCES dealers(id)
);

-- sale_items (each line on the invoice; must reference a lot)
CREATE TABLE sale_items (
  id INT AUTO_INCREMENT PRIMARY KEY,
  sale_id INT NOT NULL,
  lot_id INT NOT NULL,            -- which lot the bottle came from
  cylinder_size_id INT NOT NULL,
  quantity INT NOT NULL,
  unit_price DECIMAL(14,2) NOT NULL, -- copied from lots.purchase_price at sale time (or can be overridden)
  subtotal DECIMAL(14,2) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (sale_id) REFERENCES sales(id),
  FOREIGN KEY (lot_id) REFERENCES lots(id),
  FOREIGN KEY (cylinder_size_id) REFERENCES cylinder_sizes(id)
);

-- optional: price_history for lots (if you want to change lot price)
CREATE TABLE lot_price_history (
  id INT AUTO_INCREMENT PRIMARY KEY,
  lot_id INT NOT NULL,
  old_price DECIMAL(14,2),
  new_price DECIMAL(14,2),
  changed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  changed_by INT,
  FOREIGN KEY (lot_id) REFERENCES lots(id)
);


ALTER TABLE users 
ADD COLUMN role ENUM('admin','seller') DEFAULT 'seller' AFTER password_hash;


