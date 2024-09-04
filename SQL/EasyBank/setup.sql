-- create the database.
CREATE DATABASE IF NOT EXISTS EasyBank;
USE EasyBank;

-- Create the tables.
CREATE TABLE IF NOT EXISTS branch (
                                      id INT PRIMARY KEY AUTO_INCREMENT,
                                      branch_name VARCHAR(100) NOT NULL, -- All columns are required, a branch should have all this info available.
                                      email VARCHAR(100) NOT NULL,
                                      phone VARCHAR(20) NOT NULL,
                                      address VARCHAR(200) NOT NULL,
                                      region VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS customer (
                                        id INT PRIMARY KEY AUTO_INCREMENT,
                                        first_name VARCHAR(70) NOT NULL,
                                        middle_name VARCHAR(100), -- Middle name is optional.
                                        last_name VARCHAR(70) NOT NULL,
                                        age INT NOT NULL, -- Age is required to know what the customer is eligible for.
                                        salary INT, -- Salary, email, phone, and address are optional. (don't want to lose customers who don't want to provide this info)
                                        email VARCHAR(100),
                                        phone VARCHAR(20),
                                        address VARCHAR(200) NOT NULL, -- Proof of address is usually required.
                                        branch_id INT, -- Foreign key to branch table (1 branch many customers).
                                        FOREIGN KEY (branch_id) REFERENCES branch(id)
);

CREATE TABLE IF NOT EXISTS online_banking (
                                              id INT PRIMARY KEY AUTO_INCREMENT,
                                              customer_id INT, -- Foreign key to customer table (1 customer 1 online banking account).
                                              username VARCHAR(50) NOT NULL,
                                              password VARCHAR(100) NOT NULL, -- No way someone uses a password longer than 100 characters.
                                              locked BOOLEAN NOT NULL DEFAULT FALSE, -- Is the account locked, lock after 10 failed login attempts.
                                              FOREIGN KEY (customer_id) REFERENCES customer(id)
);

CREATE TABLE IF NOT EXISTS account (
                                       id INT PRIMARY KEY AUTO_INCREMENT,
                                       customer_id INT, -- Foreign key to customer table (1 customer many accounts).
                                       online_banking_id INT, -- Foreign key to online_banking table (1 account 1 online banking).
                                       account_name VARCHAR(100) NOT NULL,
                                       balance DECIMAL(10, 2) NOT NULL,
                                       account_type VARCHAR(30) NOT NULL,
                                       branch_id INT, -- Foreign key to branch table (1 branch many accounts).
                                       FOREIGN KEY (branch_id) REFERENCES branch(id),
                                       FOREIGN KEY (customer_id) REFERENCES customer(id),
                                       FOREIGN KEY (online_banking_id) REFERENCES online_banking(id)
);

CREATE TABLE IF NOT EXISTS transaction (
                                           id INT PRIMARY KEY AUTO_INCREMENT,
                                           account_id INT, -- Foreign key to account table (1 account many transactions).
                                           transaction_timestamp TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                           amount DECIMAL(10, 2) NOT NULL,
                                           transaction_type VARCHAR(10) NOT NULL, -- In/Out
                                           FOREIGN KEY (account_id) REFERENCES account(id)
);

CREATE TABLE IF NOT EXISTS loan (
                                    id INT PRIMARY KEY AUTO_INCREMENT,
                                    customer_id INT, -- Foreign key to customer table (1 customer many loans).
                                    loan_amount DECIMAL(10, 2) NOT NULL,
                                    interest_rate DECIMAL(5, 2) NOT NULL,
                                    loan_term INT NOT NULL, -- Number of months the loan is for.
                                    start_date DATE NOT NULL,
                                    end_date DATE NOT NULL,
                                    FOREIGN KEY (customer_id) REFERENCES customer(id)
);

CREATE TABLE IF NOT EXISTS loan_payment (
                                            id INT PRIMARY KEY AUTO_INCREMENT,
                                            transaction_id INT, -- Foreign key to transaction table (1 transaction many loan payments).
                                            loan_id INT, -- Foreign key to loan table (1 loan many payments).
                                            amount DECIMAL(10, 2) NOT NULL,
                                            payment_date DATE NOT NULL, -- Would have just been date, but I think you're not supposed to use reserved words.
                                            FOREIGN KEY (transaction_id) REFERENCES transaction(id),
                                            FOREIGN KEY (loan_id) REFERENCES loan(id)
);

-- Security Tables
CREATE TABLE IF NOT EXISTS two_factor_auth (
                                               id INT PRIMARY KEY AUTO_INCREMENT,
                                               online_banking_id INT, -- Foreign key to online_banking table (1 online banking 1 two-factor auth).
                                               method VARCHAR(20) NOT NULL, -- Email, SMS, App
                                               enabled BOOLEAN NOT NULL DEFAULT FALSE, -- Does the customer have this enabled, default is false.
                                               FOREIGN KEY (online_banking_id) REFERENCES online_banking(id)
);

CREATE TABLE IF NOT EXISTS login_attempt (
                                             id INT PRIMARY KEY AUTO_INCREMENT,
                                             online_banking_id INT, -- Foreign key to online_banking table (1 online banking many login attempts).
                                             ip_address VARCHAR(50) NOT NULL, -- The IP address of the login attempt.
                                             attempt_timestamp TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, -- When the login attempt was made.
                                             success BOOLEAN NOT NULL DEFAULT FALSE, -- Was the login successful, default is false, better to be safe.
                                             FOREIGN KEY (online_banking_id) REFERENCES online_banking(id)
);

CREATE TABLE IF NOT EXISTS security_question (
                                                 id INT PRIMARY KEY AUTO_INCREMENT,
                                                 online_banking_id INT, -- Foreign key to online_banking table (1 online banking many security questions).
                                                 question VARCHAR(255) NOT NULL, -- The security question.
                                                 answer VARCHAR(255) NOT NULL, -- The answer to the security question.
                                                 FOREIGN KEY (online_banking_id) REFERENCES online_banking(id)
);


-- Added interest_rate to account table
ALTER TABLE account ADD COLUMN interest_rate DECIMAL(5, 2) DEFAULT 0.00;
-- Update interest_rate for different account types
UPDATE account SET interest_rate = 3.5 WHERE account_type = 'loan';
UPDATE account SET interest_rate = 1.0 WHERE account_type = 'checking';
UPDATE account SET interest_rate = 2.0 WHERE account_type = 'savings';