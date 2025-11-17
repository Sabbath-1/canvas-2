CREATE TABLE circuits (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE members (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(255),
    phone VARCHAR(20),
    profile_picture_url VARCHAR(500),
    circuit_id INTEGER REFERENCES circuits(id),
    date_joined DATE NOT NULL,
    is_active BOOLEAN DEFAULT TRUE,
    address TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(100) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    full_name VARCHAR(200) NOT NULL,
    role VARCHAR(50) DEFAULT 'executive',
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE payment_periods (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,  -- e.g., "January 2024", "Q1 2024"
    due_date DATE NOT NULL,
    is_active BOOLEAN DEFAULT TRUE
);

CREATE TABLE dues_payments (
    id SERIAL PRIMARY KEY,
    member_id INTEGER REFERENCES members(id),
    period_id INTEGER REFERENCES payment_periods(id),
    amount DECIMAL(10,2) NOT NULL,
    date_paid DATE NOT NULL,
    payment_method VARCHAR(50),  -- Cash, Transfer, etc.
    notes TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE benefit_types (
    id SERIAL PRIMARY KEY,
    name VARCHAR(200) NOT NULL,  -- e.g., "Food Basket", "Medical Aid"
    description TEXT,
    amount DECIMAL(10,2),  -- If it's a fixed amount
    is_active BOOLEAN DEFAULT TRUE
);

CREATE TABLE benefit_disbursements (
    id SERIAL PRIMARY KEY,
    member_id INTEGER REFERENCES members(id),
    benefit_type_id INTEGER REFERENCES benefit_types(id),
    amount DECIMAL(10,2) NOT NULL,
    date_disbursed DATE,
    status VARCHAR(50) DEFAULT 'Pending',  -- Pending, Delivered, Cancelled
    notes TEXT,
    disbursed_by INTEGER REFERENCES users(id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE activity_logs (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users(id),
    action_type VARCHAR(100) NOT NULL,  -- e.g., "CREATE_MEMBER", "UPDATE_PAYMENT"
    description TEXT NOT NULL,  -- e.g., "John Doe updated payment status for member Mike Smith"
    table_name VARCHAR(100),  -- Which table was affected
    record_id INTEGER,  -- Which record was affected
    old_values JSONB,  -- What it was before (for updates)
    new_values JSONB,  -- What it became (for updates)
    ip_address INET,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE notifications (
    id SERIAL PRIMARY KEY,
    member_id INTEGER REFERENCES members(id),
    type VARCHAR(100) NOT NULL,  -- 'payment_reminder', 'benefit_alert'
    title VARCHAR(200) NOT NULL,
    message TEXT NOT NULL,
    is_sent BOOLEAN DEFAULT FALSE,
    scheduled_for TIMESTAMP,
    sent_at TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);