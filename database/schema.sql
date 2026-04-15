-- Database schema for the E-commerce SQL Analysis project

-- =========================
-- E-commerce Database Schema
-- =========================

-- Customers table
CREATE TABLE customers (
    id INTEGER,
    name TEXT NOT NULL,
    
    PRIMARY KEY (id)
);

-- Products table
CREATE TABLE products (
    id INTEGER,
    name TEXT NOT NULL,
    price REAL NOT NULL,
    
    PRIMARY KEY (id),
    CHECK (price > 0)
);

-- Orders table
CREATE TABLE orders (
    id INTEGER,
    customer_id INTEGER,
    amount REAL,
    order_date TEXT,
    
    PRIMARY KEY (id),
    FOREIGN KEY (customer_id) REFERENCES customers(id),
    CHECK (amount >= 0)
);

-- Order items table
CREATE TABLE order_items (
    id INTEGER,
    order_id INTEGER,
    product_id INTEGER,
    quantity INTEGER,
    
    PRIMARY KEY (id),
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id),
    CHECK (quantity > 0)
);
