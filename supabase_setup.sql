-- Supabase Database Setup for Samadhan AI
-- Government Complaint Management System

-- Enable necessary extensions
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE EXTENSION IF NOT EXISTS "pgcrypto";

-- Drop existing tables if they exist
DROP TABLE IF EXISTS complaint_updates CASCADE;
DROP TABLE IF EXISTS complaints CASCADE;
DROP TABLE IF EXISTS departments CASCADE;
DROP TABLE IF EXISTS users CASCADE;

-- Users table
CREATE TABLE users (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    full_name VARCHAR(255) NOT NULL,
    phone VARCHAR(20),
    address TEXT,
    role VARCHAR(20) DEFAULT 'citizen' CHECK (role IN ('citizen', 'admin', 'department_head')),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Departments table
CREATE TABLE departments (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name VARCHAR(255) NOT NULL,
    description TEXT,
    head_email VARCHAR(255),
    contact_phone VARCHAR(20),
    response_time_hours INTEGER DEFAULT 48,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Complaints table
CREATE TABLE complaints (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID REFERENCES users(id) ON DELETE CASCADE,
    department_id UUID REFERENCES departments(id),
    title VARCHAR(500) NOT NULL,
    description TEXT NOT NULL,
    category VARCHAR(100) NOT NULL,
    priority VARCHAR(20) DEFAULT 'medium' CHECK (priority IN ('low', 'medium', 'high', 'critical')),
    status VARCHAR(20) DEFAULT 'pending' CHECK (status IN ('pending', 'assigned', 'in_progress', 'resolved', 'closed')),
    location TEXT,
    latitude DECIMAL(10, 8),
    longitude DECIMAL(11, 8),
    image_url TEXT,
    ai_analysis JSONB,
    estimated_resolution_date DATE,
    actual_resolution_date DATE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Complaint updates table
CREATE TABLE complaint_updates (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    complaint_id UUID REFERENCES complaints(id) ON DELETE CASCADE,
    user_id UUID REFERENCES users(id),
    message TEXT NOT NULL,
    status_change VARCHAR(20),
    is_internal BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Create indexes for better performance
CREATE INDEX idx_complaints_user_id ON complaints(user_id);
CREATE INDEX idx_complaints_department_id ON complaints(department_id);
CREATE INDEX idx_complaints_status ON complaints(status);
CREATE INDEX idx_complaints_category ON complaints(category);
CREATE INDEX idx_complaints_created_at ON complaints(created_at);
CREATE INDEX idx_complaint_updates_complaint_id ON complaint_updates(complaint_id);

-- Insert sample departments
INSERT INTO departments (name, description, head_email, contact_phone, response_time_hours) VALUES
('Public Works Department', 'Handles infrastructure, roads, bridges, and public buildings', 'pwd.head@gov.in', '+91-11-23456789', 72),
('Water Supply Department', 'Manages water supply, quality, and distribution', 'water.head@gov.in', '+91-11-23456790', 24),
('Traffic Police Department', 'Traffic management, signals, and road safety', 'traffic.head@gov.in', '+91-11-23456791', 4),
('Environment Department', 'Environmental issues, pollution, and waste management', 'env.head@gov.in', '+91-11-23456792', 48),
('Healthcare Department', 'Public health services and hospital management', 'health.head@gov.in', '+91-11-23456793', 12),
('Education Department', 'School infrastructure and educational services', 'edu.head@gov.in', '+91-11-23456794', 168);

-- Insert sample users
INSERT INTO users (email, password_hash, full_name, phone, address, role) VALUES
('admin@samadhan.gov.in', crypt('admin123', gen_salt('bf')), 'System Administrator', '+91-9876543210', 'Government Office, New Delhi', 'admin'),
('rajesh.kumar@email.com', crypt('user123', gen_salt('bf')), 'Rajesh Kumar', '+91-9876543211', 'Sector 15, Noida, UP', 'citizen'),
('priya.sharma@email.com', crypt('user123', gen_salt('bf')), 'Priya Sharma', '+91-9876543212', 'Connaught Place, New Delhi', 'citizen'),
('amit.singh@email.com', crypt('user123', gen_salt('bf')), 'Amit Singh', '+91-9876543213', 'Bandra West, Mumbai, MH', 'citizen'),
('dept.head@gov.in', crypt('dept123', gen_salt('bf')), 'Department Head', '+91-9876543214', 'Government Office', 'department_head');

-- Insert sample complaints
INSERT INTO complaints (user_id, department_id, title, description, category, priority, status, location, latitude, longitude, ai_analysis) VALUES
(
    (SELECT id FROM users WHERE email = 'rajesh.kumar@email.com'),
    (SELECT id FROM departments WHERE name = 'Public Works Department'),
    'Large pothole on main road causing accidents',
    'There is a very large pothole on the main road near Sector 15 metro station. Multiple vehicles have been damaged and it is causing traffic jams. This needs immediate attention as it is a safety hazard.',
    'Infrastructure',
    'high',
    'assigned',
    'Sector 15, Noida, UP',
    28.5355,
    77.3910,
    '{"sentiment": "urgent", "category_confidence": 0.95, "priority_score": 8.5, "keywords": ["pothole", "safety", "traffic", "accidents"]}'
),
(
    (SELECT id FROM users WHERE email = 'priya.sharma@email.com'),
    (SELECT id FROM departments WHERE name = 'Water Supply Department'),
    'No water supply for 3 days',
    'Our area has been without water supply for the past 3 days. We have contacted the local office multiple times but no action has been taken. This is causing severe hardship for families with children and elderly.',
    'Utilities',
    'critical',
    'in_progress',
    'Connaught Place, New Delhi',
    28.6315,
    77.2167,
    '{"sentiment": "frustrated", "category_confidence": 0.98, "priority_score": 9.2, "keywords": ["water", "supply", "emergency", "families"]}'
),
(
    (SELECT id FROM users WHERE email = 'amit.singh@email.com'),
    (SELECT id FROM departments WHERE name = 'Traffic Police Department'),
    'Traffic signal not working',
    'The traffic signal at the intersection near Bandra station has not been working for 2 weeks. This is causing major traffic congestion during peak hours and increasing the risk of accidents.',
    'Traffic',
    'medium',
    'pending',
    'Bandra West, Mumbai, MH',
    19.0596,
    72.8295,
    '{"sentiment": "concerned", "category_confidence": 0.92, "priority_score": 7.0, "keywords": ["traffic", "signal", "congestion", "safety"]}'
),
(
    (SELECT id FROM users WHERE email = 'rajesh.kumar@email.com'),
    (SELECT id FROM departments WHERE name = 'Environment Department'),
    'Illegal waste dumping in residential area',
    'Construction waste is being illegally dumped in our residential area for the past month. It is creating health hazards and attracting pests. The smell is unbearable and affecting quality of life.',
    'Environment',
    'high',
    'resolved',
    'Sector 15, Noida, UP',
    28.5355,
    77.3910,
    '{"sentiment": "disgusted", "category_confidence": 0.89, "priority_score": 8.0, "keywords": ["waste", "dumping", "health", "residential"]}'
);

-- Insert sample complaint updates
INSERT INTO complaint_updates (complaint_id, user_id, message, status_change) VALUES
(
    (SELECT id FROM complaints WHERE title LIKE '%pothole%'),
    (SELECT id FROM users WHERE role = 'admin'),
    'Complaint has been assigned to PWD field team. Inspection scheduled for tomorrow.',
    'assigned'
),
(
    (SELECT id FROM complaints WHERE title LIKE '%water supply%'),
    (SELECT id FROM users WHERE role = 'admin'),
    'Emergency repair team dispatched. Water tanker arranged for temporary supply.',
    'in_progress'
),
(
    (SELECT id FROM complaints WHERE title LIKE '%waste dumping%'),
    (SELECT id FROM users WHERE role = 'admin'),
    'Site cleaned and illegal dumping stopped. Warning issued to construction company.',
    'resolved'
);

-- Update estimated resolution dates
UPDATE complaints SET 
    estimated_resolution_date = CURRENT_DATE + INTERVAL '3 days'
WHERE status IN ('pending', 'assigned', 'in_progress');

UPDATE complaints SET 
    actual_resolution_date = CURRENT_DATE - INTERVAL '2 days'
WHERE status = 'resolved';

-- Create a function to automatically update the updated_at timestamp
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ language 'plpgsql';

-- Create triggers for automatic timestamp updates
CREATE TRIGGER update_users_updated_at BEFORE UPDATE ON users
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_complaints_updated_at BEFORE UPDATE ON complaints
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

-- Enable Row Level Security (RLS)
ALTER TABLE users ENABLE ROW LEVEL SECURITY;
ALTER TABLE complaints ENABLE ROW LEVEL SECURITY;
ALTER TABLE complaint_updates ENABLE ROW LEVEL SECURITY;

-- Create RLS policies
CREATE POLICY "Users can view own data" ON users
    FOR SELECT USING (auth.uid()::text = id::text OR 
                     EXISTS (SELECT 1 FROM users WHERE id::text = auth.uid()::text AND role IN ('admin', 'department_head')));

CREATE POLICY "Users can view complaints" ON complaints
    FOR SELECT USING (true);

CREATE POLICY "Users can insert own complaints" ON complaints
    FOR INSERT WITH CHECK (auth.uid()::text = user_id::text);

CREATE POLICY "Admins can update complaints" ON complaints
    FOR UPDATE USING (EXISTS (SELECT 1 FROM users WHERE id::text = auth.uid()::text AND role IN ('admin', 'department_head')));

-- Grant necessary permissions
GRANT USAGE ON SCHEMA public TO anon, authenticated;
GRANT ALL ON ALL TABLES IN SCHEMA public TO anon, authenticated;
GRANT ALL ON ALL SEQUENCES IN SCHEMA public TO anon, authenticated;

-- Create view for complaint statistics
CREATE VIEW complaint_stats AS
SELECT 
    d.name as department_name,
    COUNT(*) as total_complaints,
    COUNT(CASE WHEN c.status = 'resolved' THEN 1 END) as resolved_complaints,
    COUNT(CASE WHEN c.status = 'pending' THEN 1 END) as pending_complaints,
    AVG(CASE WHEN c.actual_resolution_date IS NOT NULL 
        THEN EXTRACT(EPOCH FROM (c.actual_resolution_date - c.created_at::date))/86400 
        END) as avg_resolution_days
FROM complaints c
JOIN departments d ON c.department_id = d.id
GROUP BY d.id, d.name;

COMMENT ON TABLE users IS 'User accounts for citizens, admins, and department heads';
COMMENT ON TABLE departments IS 'Government departments handling different complaint categories';
COMMENT ON TABLE complaints IS 'Citizen complaints with AI analysis and tracking';
COMMENT ON TABLE complaint_updates IS 'Status updates and communication history for complaints';