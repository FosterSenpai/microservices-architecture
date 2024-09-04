INSERT INTO branch (branch_name, email, phone, address, region) VALUES
('Auckland Central', 'central@easybank.co.nz', '09-123-4567', '123 Queen St, Auckland Central', 'Auckland'),
('North Shore', 'northshore@easybank.co.nz', '09-234-5678', '456 Lake Rd, North Shore', 'Auckland'),
('Manukau', 'manukau@easybank.co.nz', '09-345-6789', '789 Great South Rd, Manukau', 'Auckland'),
('Waitakere', 'waitakere@easybank.co.nz', '09-456-7890', '101 Lincoln Rd, Waitakere', 'Auckland'),
('Papakura', 'papakura@easybank.co.nz', '09-567-8901', '202 Great South Rd, Papakura', 'Auckland');

INSERT INTO customer (first_name, middle_name, last_name, age, salary, email, phone, address, branch_id) VALUES
('John', 'A', 'Doe', 30, 50000, 'john.doe@example.com', '+64-555-1234', '789 Elm St, Auckland Central', 1),
('Jane', NULL, 'Smith', 25, 60000, 'jane.smith@example.com', '+64-555-5678', '101 Maple St, North Shore', 2),
('Michael', 'B', 'Johnson', 40, 70000, 'michael.johnson@example.com', '+64-555-8765', '202 Oak St, Manukau', 3),
('Emily', 'C', 'Davis', 35, 80000, 'emily.davis@example.com', '+64-555-4321', '303 Pine St, Waitakere', 4),
('David', 'D', 'Brown', 28, 55000, 'david.brown@example.com', '+64-555-6789', '404 Cedar St, Papakura', 5),
('Sarah', NULL, 'Wilson', 32, NULL, 'sarah.wilson@example.com', '+64-555-9876', '505 Birch St, Auckland Central', 1),
('Chris', 'F', 'Taylor', 45, 75000, NULL, '+64-555-5432', '606 Spruce St, North Shore', 2),
('Jessica', 'G', 'Anderson', 27, 58000, 'jessica.anderson@example.com', NULL, '707 Maple St, Manukau', 3),
('Daniel', NULL, 'Thomas', 33, 67000, 'daniel.thomas@example.com', '+64-555-7654', '808 Oak St, Waitakere', 4),
('Laura', 'I', 'Jackson', 29, 63000, 'laura.jackson@example.com', '+64-555-8765', '909 Pine St, Papakura', 5),
('Matthew', 'J', 'White', 38, 71000, 'matthew.white@example.com', NULL, '1010 Cedar St, Auckland Central', 1),
('Ashley', NULL, 'Harris', 31, 64000, 'ashley.harris@example.com', '+64-555-5432', '1111 Birch St, North Shore', 2),
('Joshua', 'L', 'Martin', 26, NULL, 'joshua.martin@example.com', '+64-555-6543', '1212 Spruce St, Manukau', 3),
('Amanda', 'M', 'Thompson', 34, 68000, NULL, '+64-555-7654', '1313 Maple St, Waitakere', 4),
('Andrew', 'N', 'Garcia', 37, 72000, 'andrew.garcia@example.com', '+64-555-8765', '1414 Oak St, Papakura', 5),
('Megan', 'O', 'Martinez', 30, 65000, 'megan.martinez@example.com', '+64-555-9876', '1515 Pine St, Auckland Central', 1),
('Ryan', 'P', 'Robinson', 28, 56000, 'ryan.robinson@example.com', '+64-555-5432', '1616 Cedar St, North Shore', 2),
('Olivia', NULL, 'Clark', 32, 62000, 'olivia.clark@example.com', '+64-555-6543', '1717 Birch St, Manukau', 3),
('Brandon', 'R', 'Rodriguez', 35, 70000, 'brandon.rodriguez@example.com', '+64-555-7654', '1818 Spruce St, Waitakere', 4),
('Sophia', 'S', 'Lewis', 29, 63000, 'sophia.lewis@example.com', '+64-555-8765', '1919 Maple St, Papakura', 5);

INSERT INTO online_banking (customer_id, username, password, locked) VALUES
(81, 'johndoe', 'password123', FALSE),
(82, 'janesmith', 'password456', FALSE),
(83, 'michaeljohnson', 'password789', FALSE),
(84, 'emilydavis', 'password101', FALSE),
(85, 'davidbrown', 'password202', FALSE),
(86, 'sarahwilson', 'password303', FALSE),
(87, 'christaylor', 'password404', FALSE),
(88, 'jessicaanderson', 'password505', FALSE),
(89, 'danielthomas', 'password606', FALSE),
(90, 'laurajackson', 'password707', FALSE);

-- Accounts linked to online banking
INSERT INTO account (customer_id, online_banking_id, account_name, balance, account_type, branch_id) VALUES
(81, 11, 'John Doe Checking', 1500.00, 'checking', 1),
(81, 11, 'John Doe Savings', 3000.00, 'savings', 1),
(82, 12, 'Jane Smith Checking', 2000.00, 'checking', 2),
(83, 13, 'Michael Johnson Savings', 2500.00, 'savings', 3),
(83, 13, 'Michael Johnson Loan', 10000.00, 'loan', 3),
(84, 14, 'Emily Davis Checking', 1800.00, 'checking', 4),
(85, 15, 'David Brown Loan', 7500.00, 'loan', 5),
(86, 16, 'Sarah Wilson Savings', 4000.00, 'savings', 1),
(87, 17, 'Chris Taylor Checking', 1600.00, 'checking', 2),
(88, 18, 'Jessica Anderson Loan', 9000.00, 'loan', 3),
(89, 19, 'Daniel Thomas Savings', 3300.00, 'savings', 4),
(90, 20, 'Laura Jackson Checking', 1700.00, 'checking', 5);

-- Accounts not linked to online banking
INSERT INTO account (customer_id, online_banking_id, account_name, balance, account_type, branch_id) VALUES
(91, NULL, 'Matthew White Checking', 7100.00, 'checking', 1),
(91, NULL, 'Matthew White Savings', 5000.00, 'savings', 1),
(92, NULL, 'Ashley Harris Savings', 6400.00, 'savings', 2),
(93, NULL, 'Joshua Martin Loan', 5000.00, 'loan', 3),
(94, NULL, 'Amanda Thompson Checking', 6800.00, 'checking', 4),
(95, NULL, 'Andrew Garcia Savings', 7200.00, 'savings', 5),
(96, NULL, 'Megan Martinez Loan', 6500.00, 'loan', 1),
(97, NULL, 'Ryan Robinson Checking', 5600.00, 'checking', 2),
(98, NULL, 'Olivia Clark Savings', 6200.00, 'savings', 3),
(99, NULL, 'Brandon Rodriguez Loan', 7000.00, 'loan', 4),
(100, NULL, 'Sophia Lewis Checking', 6300.00, 'checking', 5),
(100, NULL, 'Sophia Lewis Savings', 4000.00, 'savings', 5);

-- Transactions
INSERT INTO transaction (account_id, amount, transaction_type) VALUES
(61, 100.00, 'In'),
(61, 50.00, 'Out'),
(61, 200.00, 'In'),
(61, 75.00, 'Out'),
(61, 150.00, 'In'),
(61, 25.00, 'Out'),
(61, 300.00, 'In'),
(61, 100.00, 'Out'),
(61, 400.00, 'In'),
(61, 50.00, 'Out');

INSERT INTO transaction (account_id, amount, transaction_type) VALUES
(62, 500.00, 'In'),
(62, 100.00, 'Out'),
(62, 600.00, 'In'),
(62, 150.00, 'Out'),
(62, 700.00, 'In'),
(62, 200.00, 'Out'),
(62, 800.00, 'In'),
(62, 250.00, 'Out'),
(62, 900.00, 'In'),
(62, 300.00, 'Out');

INSERT INTO transaction (account_id, amount, transaction_type) VALUES
(63, 120.00, 'In'),
(63, 60.00, 'Out'),
(63, 220.00, 'In'),
(63, 80.00, 'Out'),
(63, 170.00, 'In'),
(63, 30.00, 'Out'),
(63, 320.00, 'In'),
(63, 110.00, 'Out'),
(63, 420.00, 'In'),
(63, 70.00, 'Out');

INSERT INTO transaction (account_id, amount, transaction_type) VALUES
(64, 520.00, 'In'),
(64, 130.00, 'Out'),
(64, 620.00, 'In'),
(64, 180.00, 'Out'),
(64, 720.00, 'In'),
(64, 230.00, 'Out'),
(64, 820.00, 'In'),
(64, 280.00, 'Out'),
(64, 920.00, 'In'),
(64, 330.00, 'Out');

INSERT INTO transaction (account_id, amount, transaction_type) VALUES
(64, 150.00, 'In'),
(64, 75.00, 'Out'),
(64, 250.00, 'In'),
(64, 100.00, 'Out'),
(64, 350.00, 'In'),
(64, 50.00, 'Out'),
(64, 450.00, 'In'),
(64, 125.00, 'Out'),
(64, 550.00, 'In'),
(64, 75.00, 'Out');

INSERT INTO transaction (account_id, amount, transaction_type) VALUES
(65, 1000.00, 'In'),
(65, 200.00, 'Out'),
(65, 1100.00, 'In'),
(65, 250.00, 'Out'),
(65, 1200.00, 'In'),
(65, 300.00, 'Out'),
(65, 1300.00, 'In'),
(65, 350.00, 'Out'),
(65, 1400.00, 'In'),
(65, 400.00, 'Out');

INSERT INTO transaction (account_id, amount, transaction_type) VALUES
(66, 200.00, 'In'),
(66, 100.00, 'Out'),
(66, 300.00, 'In'),
(66, 150.00, 'Out'),
(66, 400.00, 'In'),
(66, 50.00, 'Out'),
(66, 500.00, 'In'),
(66, 200.00, 'Out'),
(66, 600.00, 'In'),
(66, 100.00, 'Out');

INSERT INTO transaction (account_id, amount, transaction_type) VALUES
(67, 1100.00, 'In'),
(67, 220.00, 'Out'),
(67, 1200.00, 'In'),
(67, 270.00, 'Out'),
(67, 1300.00, 'In'),
(67, 320.00, 'Out'),
(67, 1400.00, 'In'),
(67, 370.00, 'Out'),
(67, 1500.00, 'In'),
(67, 420.00, 'Out');

INSERT INTO transaction (account_id, amount, transaction_type) VALUES
(68, 600.00, 'In'),
(68, 120.00, 'Out'),
(68, 700.00, 'In'),
(68, 170.00, 'Out'),
(68, 800.00, 'In'),
(68, 220.00, 'Out'),
(68, 900.00, 'In'),
(68, 270.00, 'Out'),
(68, 1000.00, 'In'),
(68, 320.00, 'Out');

INSERT INTO transaction (account_id, amount, transaction_type) VALUES
(69, 130.00, 'In'),
(69, 65.00, 'Out'),
(69, 230.00, 'In'),
(69, 90.00, 'Out'),
(69, 330.00, 'In'),
(69, 45.00, 'Out'),
(69, 430.00, 'In'),
(69, 115.00, 'Out'),
(69, 530.00, 'In'),
(69, 65.00, 'Out');

INSERT INTO transaction (account_id, amount, transaction_type) VALUES
(70, 1050.00, 'In'),
(70, 210.00, 'Out'),
(70, 1150.00, 'In'),
(70, 260.00, 'Out'),
(70, 1250.00, 'In'),
(70, 310.00, 'Out'),
(70, 1350.00, 'In'),
(70, 360.00, 'Out'),
(70, 1450.00, 'In'),
(70, 410.00, 'Out');

INSERT INTO transaction (account_id, amount, transaction_type) VALUES
(71, 700.00, 'In'),
(71, 140.00, 'Out'),
(71, 800.00, 'In'),
(71, 190.00, 'Out'),
(71, 900.00, 'In'),
(71, 240.00, 'Out'),
(71, 1000.00, 'In'),
(71, 290.00, 'Out'),
(71, 1100.00, 'In'),
(71, 340.00, 'Out');

-- Loans
INSERT INTO loan (customer_id, loan_amount, interest_rate, loan_term, start_date, end_date) VALUES
    (81, 5000.00, 3.5, 36, '2023-01-01', '2026-01-01');

INSERT INTO loan (customer_id, loan_amount, interest_rate, loan_term, start_date, end_date) VALUES
    (82, 7500.00, 4.0, 48, '2023-02-01', '2027-02-01');

INSERT INTO loan (customer_id, loan_amount, interest_rate, loan_term, start_date, end_date) VALUES
    (83, 10000.00, 4.5, 60, '2023-03-01', '2028-03-01');

INSERT INTO loan (customer_id, loan_amount, interest_rate, loan_term, start_date, end_date) VALUES
    (84, 6000.00, 3.8, 36, '2023-04-01', '2026-04-01');

INSERT INTO loan (customer_id, loan_amount, interest_rate, loan_term, start_date, end_date) VALUES
    (85, 8000.00, 4.2, 48, '2023-05-01', '2027-05-01');

INSERT INTO loan (customer_id, loan_amount, interest_rate, loan_term, start_date, end_date) VALUES
    (86, 5500.00, 3.9, 36, '2023-06-01', '2026-06-01');

INSERT INTO loan (customer_id, loan_amount, interest_rate, loan_term, start_date, end_date) VALUES
    (87, 7000.00, 4.1, 48, '2023-07-01', '2027-07-01');

-- Loan Payments
INSERT INTO transaction (account_id, amount, transaction_type) VALUES
(81, 500.00, 'Out'),
(81, 500.00, 'Out'),
(81, 500.00, 'Out'),
(81, 500.00, 'Out'),
(81, 500.00, 'Out'),
(81, 500.00, 'Out'),
(81, 500.00, 'Out'),
(81, 500.00, 'Out'),
(81, 500.00, 'Out'),
(81, 500.00, 'Out');

-- Last insert ID didn't work well with this test data, so I had to go back and change the transaction_id manually.
INSERT INTO loan_payment (transaction_id, loan_id, amount, payment_date) VALUES
(LAST_INSERT_ID(), 1, 500.00, '2023-02-01'),
(LAST_INSERT_ID(), 1, 500.00, '2023-03-01'),
(LAST_INSERT_ID(), 1, 500.00, '2023-04-01'),
(LAST_INSERT_ID(), 1, 500.00, '2023-05-01'),
(LAST_INSERT_ID(), 1, 500.00, '2023-06-01'),
(LAST_INSERT_ID(), 1, 500.00, '2023-07-01'),
(LAST_INSERT_ID(), 1, 500.00, '2023-08-01'),
(LAST_INSERT_ID(), 1, 500.00, '2023-09-01'),
(LAST_INSERT_ID(), 1, 500.00, '2023-10-01'),
(LAST_INSERT_ID(), 1, 500.00, '2023-11-01');

INSERT INTO transaction (account_id, amount, transaction_type) VALUES
(82, 625.00, 'Out'),
(82, 625.00, 'Out'),
(82, 625.00, 'Out'),
(82, 625.00, 'Out'),
(82, 625.00, 'Out'),
(82, 625.00, 'Out'),
(82, 625.00, 'Out'),
(82, 625.00, 'Out'),
(82, 625.00, 'Out'),
(82, 625.00, 'Out');

INSERT INTO loan_payment (transaction_id, loan_id, amount, payment_date) VALUES
(LAST_INSERT_ID(), 2, 625.00, '2023-03-01'),
(LAST_INSERT_ID(), 2, 625.00, '2023-04-01'),
(LAST_INSERT_ID(), 2, 625.00, '2023-05-01'),
(LAST_INSERT_ID(), 2, 625.00, '2023-06-01'),
(LAST_INSERT_ID(), 2, 625.00, '2023-07-01'),
(LAST_INSERT_ID(), 2, 625.00, '2023-08-01'),
(LAST_INSERT_ID(), 2, 625.00, '2023-09-01'),
(LAST_INSERT_ID(), 2, 625.00, '2023-10-01'),
(LAST_INSERT_ID(), 2, 625.00, '2023-11-01'),
(LAST_INSERT_ID(), 2, 625.00, '2023-12-01');

INSERT INTO transaction (account_id, amount, transaction_type) VALUES
(83, 833.33, 'Out'),
(83, 833.33, 'Out'),
(83, 833.33, 'Out'),
(83, 833.33, 'Out'),
(83, 833.33, 'Out'),
(83, 833.33, 'Out'),
(83, 833.33, 'Out'),
(83, 833.33, 'Out'),
(83, 833.33, 'Out'),
(83, 833.33, 'Out');

INSERT INTO loan_payment (transaction_id, loan_id, amount, payment_date) VALUES
(LAST_INSERT_ID(), 3, 833.33, '2023-04-01'),
(LAST_INSERT_ID(), 3, 833.33, '2023-05-01'),
(LAST_INSERT_ID(), 3, 833.33, '2023-06-01'),
(LAST_INSERT_ID(), 3, 833.33, '2023-07-01'),
(LAST_INSERT_ID(), 3, 833.33, '2023-08-01'),
(LAST_INSERT_ID(), 3, 833.33, '2023-09-01'),
(LAST_INSERT_ID(), 3, 833.33, '2023-10-01'),
(LAST_INSERT_ID(), 3, 833.33, '2023-11-01'),
(LAST_INSERT_ID(), 3, 833.33, '2023-12-01'),
(LAST_INSERT_ID(), 3, 833.33, '2024-01-01');

-- Login attempts
INSERT INTO login_attempt (online_banking_id, ip_address, success) VALUES
(11, '192.168.1.1', TRUE),
(11, '192.168.1.2', FALSE),
(11, '192.168.1.3', TRUE),
(11, '192.168.1.4', FALSE),
(11, '192.168.1.5', TRUE);

INSERT INTO login_attempt (online_banking_id, ip_address, success) VALUES
(12, '192.168.2.1', FALSE),
(12, '192.168.2.2', TRUE),
(12, '192.168.2.3', FALSE),
(12, '192.168.2.4', TRUE),
(12, '192.168.2.5', FALSE);

INSERT INTO login_attempt (online_banking_id, ip_address, success) VALUES
(13, '192.168.3.1', TRUE),
(13, '192.168.3.2', TRUE),
(13, '192.168.3.3', FALSE),
(13, '192.168.3.4', TRUE),
(13, '192.168.3.5', FALSE);

INSERT INTO login_attempt (online_banking_id, ip_address, success) VALUES
(14, '192.168.4.1', FALSE),
(14, '192.168.4.2', FALSE),
(14, '192.168.4.3', TRUE),
(14, '192.168.4.4', TRUE),
(14, '192.168.4.5', FALSE);

INSERT INTO login_attempt (online_banking_id, ip_address, success) VALUES
(15, '192.168.5.1', TRUE),
(15, '192.168.5.2', FALSE),
(15, '192.168.5.3', TRUE),
(15, '192.168.5.4', FALSE),
(15, '192.168.5.5', TRUE);

INSERT INTO login_attempt (online_banking_id, ip_address, success) VALUES
(16, '192.168.6.1', FALSE),
(16, '192.168.6.2', TRUE),
(16, '192.168.6.3', FALSE),
(16, '192.168.6.4', TRUE),
(16, '192.168.6.5', FALSE);

INSERT INTO login_attempt (online_banking_id, ip_address, success) VALUES
(17, '192.168.7.1', TRUE),
(17, '192.168.7.2', TRUE),
(17, '192.168.7.3', FALSE),
(17, '192.168.7.4', TRUE),
(17, '192.168.7.5', FALSE);

INSERT INTO login_attempt (online_banking_id, ip_address, success) VALUES
(18, '192.168.8.1', FALSE),
(18, '192.168.8.2', FALSE),
(18, '192.168.8.3', TRUE),
(18, '192.168.8.4', TRUE),
(18, '192.168.8.5', FALSE);

INSERT INTO login_attempt (online_banking_id, ip_address, success) VALUES
(19, '192.168.9.1', TRUE),
(19, '192.168.9.2', FALSE),
(19, '192.168.9.3', TRUE),
(19, '192.168.9.4', FALSE),
(19, '192.168.9.5', TRUE);

INSERT INTO login_attempt (online_banking_id, ip_address, success) VALUES
(20, '192.168.10.1', FALSE),
(20, '192.168.10.2', TRUE),
(20, '192.168.10.3', FALSE),
(20, '192.168.10.4', TRUE),
(20, '192.168.10.5', FALSE);

INSERT INTO login_attempt (online_banking_id, ip_address, success) VALUES
(11, '192.168.1.6', FALSE),
(11, '192.168.1.7', FALSE),
(11, '192.168.1.8', FALSE),
(11, '192.168.1.9', FALSE),
(11, '192.168.1.10', FALSE);

INSERT INTO security_question (online_banking_id, question, answer) VALUES
(11, 'What is your mother\'s maiden name?', 'Doe'),
(12, 'What was the name of your first pet?', 'Fluffy'),
(13, 'What is your favorite color?', 'Blue'),
(14, 'What is your favorite food?', 'Pizza'),
(15, 'What city were you born in?', 'New York'),
(16, 'What is your favorite movie?', 'Inception'),
(17, 'What is your favorite book?', '1984'),
(18, 'What was the name of your elementary school?', 'Lincoln'),
(19, 'What is your father\'s middle name?', 'Thomas'),
(20, 'What was your childhood nickname?', 'LJ');

INSERT INTO two_factor_auth (online_banking_id, method, enabled) VALUES
(11, 'Email', TRUE),
(12, 'None', FALSE),
(13, 'App', TRUE),
(14, 'None', FALSE),
(15, 'SMS', TRUE),
(16, 'None', FALSE),
(17, 'Email', TRUE),
(18, 'None', FALSE),
(19, 'App', TRUE),
(20, 'None', FALSE);

