-- Insert circuits
INSERT INTO circuits (name, description) VALUES 
('Duayaw Nkwanta', 'Downtown area members'),
('Yamfo', 'Uptown district'),
('Bechem', 'Suburban members');

-- Insert payment periods
INSERT INTO payment_periods (name, due_date) VALUES
('January 2024', '2024-01-31'),
('February 2024', '2024-02-29'),
('March 2024', '2024-03-31');

-- Insert benefit types
INSERT INTO benefit_types (name, description, amount) VALUES
('Food Basket', 'Monthly food supplies', 150.00),
('Medical Aid', 'Healthcare assistance', 200.00),
('Education Grant', 'School fee support', 300.00);

-- Insert sample members
INSERT INTO members (first_name, last_name, email, phone, circuit_id, date_joined) VALUES
('John', 'Doe', 'john.doe@email.com', '555-0101', 1, '2023-01-15'),
('Jane', 'Smith', 'jane.smith@email.com', '555-0102', 1, '2023-02-20'),
('Mike', 'Johnson', 'mike.johnson@email.com', '555-0103', 2, '2023-03-10'),
('Sarah', 'Williams', 'sarah.williams@email.com', '555-0104', 3, '2023-01-05'),
('David', 'Brown', 'david.brown@email.com', '555-0105', 2, '2023-04-15');

-- Insert sample payments
INSERT INTO dues_payments (member_id, period_id, amount, date_paid) VALUES
(1, 1, 25.00, '2024-01-05'),
(2, 1, 25.00, '2024-01-07'),
(1, 2, 25.00, '2024-02-03'),
(3, 1, 25.00, '2024-01-10');

-- Insert sample benefits
INSERT INTO benefit_disbursements (member_id, benefit_type_id, amount, date_disbursed, status) VALUES
(1, 1, 150.00, '2024-01-15', 'Delivered'),
(2, 1, 150.00, '2024-01-16', 'Delivered'),
(1, 2, 200.00, '2024-01-20', 'Pending');

-- Create at least one admin user (you'll need this to login)
-- Password: "admin123" (you'll hash this properly later)
INSERT INTO users (username, password_hash, email, full_name, role) VALUES
('admin', '$2b$10$YourHashedPasswordHere', 'admin@welfare.org', 'System Administrator', 'admin');