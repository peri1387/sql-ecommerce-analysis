-- ====================================
-- E-COMMERCE DATABASE - INSERT DATA
-- ====================================
-- Author: Andrianos Periklis
-- Date: January 2026
-- DBMS: MySQL
-- ====================================

USE ecommerce_db;

-- Disable foreign key checks temporarily for smooth insertion
SET FOREIGN_KEY_CHECKS = 0;

-- ====================================
-- 1. INSERT INTO CATEGORIES (8 records)
-- ====================================
INSERT INTO Categories (category_name, description) VALUES
('Laptops', 'Φορητοί υπολογιστές για εργασία και ψυχαγωγία'),
('Smartphones', 'Έξυπνα κινητά τηλέφωνα και αξεσουάρ'),
('Tablets', 'Tablets για παραγωγικότητα και ψυχαγωγία'),
('Computer Accessories', 'Πληκτρολόγια, ποντίκια, webcams και άλλα αξεσουάρ'),
('Audio Equipment', 'Ακουστικά, ηχεία και audio συσκευές'),
('Gaming', 'Gaming κονσόλες, controllers και αξεσουάρ'),
('Smart Home', 'Έξυπνες συσκευές για το σπίτι'),
('Wearables', 'Smartwatches και fitness trackers');

-- ====================================
-- 2. INSERT INTO SUPPLIERS (10 records)
-- ====================================
INSERT INTO Suppliers (supplier_name, contact_name, email, phone, address, city, country) VALUES
('TechSupply Co.', 'Γιώργος Παπαδόπουλος', 'info@techsupply.gr', '+30 210 1234567', 'Λεωφ. Κηφισίας 123', 'Αθήνα', 'Greece'),
('GlobalTech Distribution', 'Maria Johnson', 'sales@globaltech.com', '+1 555-0101', '456 Tech Ave', 'New York', 'USA'),
('EuroComponents Ltd', 'Hans Mueller', 'contact@eurocomp.de', '+49 30 12345678', 'Berliner Str. 89', 'Berlin', 'Germany'),
('AsiaElectronics', 'Li Wei', 'info@asiaelectronics.cn', '+86 10 87654321', 'Beijing Road 456', 'Beijing', 'China'),
('MediterraneanTech', 'Σοφία Κωνσταντίνου', 'sales@medtech.gr', '+30 2310 555444', 'Τσιμισκή 78', 'Θεσσαλονίκη', 'Greece'),
('NorthernSupplies AB', 'Erik Johansson', 'info@northsupp.se', '+46 8 765432', 'Stockholm Gatan 12', 'Stockholm', 'Sweden'),
('SmartDevices Inc', 'Jennifer Taylor', 'orders@smartdev.com', '+1 555-0202', '789 Innovation Dr', 'San Francisco', 'USA'),
('BalkansElectro', 'Nikola Petrović', 'contact@balkanselectro.rs', '+381 11 234567', 'Knez Mihailova 45', 'Belgrade', 'Serbia'),
('PacificRim Traders', 'Yuki Tanaka', 'sales@pacificrim.jp', '+81 3 1234 5678', 'Shibuya 3-4-5', 'Tokyo', 'Japan'),
('AtlanticComponents', 'Pedro Silva', 'info@atlanticcomp.pt', '+351 21 987 6543', 'Rua Augusta 234', 'Lisbon', 'Portugal');

-- ====================================
-- 3. INSERT INTO CUSTOMERS (35 records)
-- ====================================
INSERT INTO Customers (first_name, last_name, email, phone, address, city, country, registration_date) VALUES
('Νίκος', 'Παπαδόπουλος', 'nikos.papa@email.gr', '+30 694 1234567', 'Ερμού 45', 'Αθήνα', 'Greece', '2024-01-15'),
('Μαρία', 'Γεωργίου', 'maria.geo@email.gr', '+30 694 2345678', 'Τσιμισκή 123', 'Θεσσαλονίκη', 'Greece', '2024-01-20'),
('Δημήτρης', 'Κωνσταντίνου', 'dimitris.k@email.gr', '+30 694 3456789', 'Αγίου Νικολάου 78', 'Πάτρα', 'Greece', '2024-02-05'),
('Ελένη', 'Αντωνίου', 'eleni.ant@email.gr', '+30 694 4567890', 'Βενιζέλου 34', 'Ηράκλειο', 'Greece', '2024-02-10'),
('Γιώργος', 'Δημητρίου', 'giorgos.d@email.gr', '+30 694 5678901', 'Κολοκοτρώνη 56', 'Αθήνα', 'Greece', '2024-02-15'),
('Κατερίνα', 'Παπαδάκη', 'katerina.p@email.gr', '+30 694 6789012', 'Μητροπόλεως 12', 'Λάρισα', 'Greece', '2024-03-01'),
('Αλέξανδρος', 'Ιωάννου', 'alex.i@email.gr', '+30 694 7890123', 'Εγνατία 234', 'Θεσσαλονίκη', 'Greece', '2024-03-05'),
('Σοφία', 'Νικολάου', 'sofia.n@email.gr', '+30 694 8901234', 'Αριστοτέλους 45', 'Βόλος', 'Greece', '2024-03-10'),
('Κώστας', 'Μιχαηλίδης', 'kostas.m@email.gr', '+30 694 9012345', 'Πανεπιστημίου 89', 'Αθήνα', 'Greece', '2024-03-15'),
('Αναστασία', 'Χριστοδούλου', 'anastasia.x@email.gr', '+30 694 0123456', 'Μακεδονίας 67', 'Ιωάννινα', 'Greece', '2024-04-01'),
('Παναγιώτης', 'Βασιλείου', 'panos.v@email.gr', '+30 694 1111111', 'Κύπρου 23', 'Καβάλα', 'Greece', '2024-04-05'),
('Χριστίνα', 'Σταματίου', 'christina.s@email.gr', '+30 694 2222222', 'Αγίας Σοφίας 15', 'Χανιά', 'Greece', '2024-04-10'),
('Βασίλης', 'Αθανασίου', 'vasilis.a@email.gr', '+30 694 3333333', 'Ομήρου 34', 'Ρόδος', 'Greece', '2024-04-15'),
('Ιωάννα', 'Παναγιώτου', 'ioanna.p@email.gr', '+30 694 4444444', 'Θεσσαλονίκης 56', 'Αλεξανδρούπολη', 'Greece', '2024-05-01'),
('Στέφανος', 'Χατζής', 'stefanos.x@email.gr', '+30 694 5555555', 'Κοραή 78', 'Κέρκυρα', 'Greece', '2024-05-05'),
('Εύη', 'Πετρίδου', 'evi.p@email.gr', '+30 694 6666666', 'Σπύρου Λούη 12', 'Αθήνα', 'Greece', '2024-05-10'),
('Μιχάλης', 'Οικονόμου', 'michalis.o@email.gr', '+30 694 7777777', 'Βασιλίσσης Όλγας 45', 'Θεσσαλονίκη', 'Greece', '2024-05-15'),
('Άννα', 'Μαυρίδη', 'anna.m@email.gr', '+30 694 8888888', 'Αθηνάς 23', 'Πειραιάς', 'Greece', '2024-06-01'),
('Θανάσης', 'Λάμπρου', 'thanasis.l@email.gr', '+30 694 9999999', 'Ελευθερίας 67', 'Καλαμάτα', 'Greece', '2024-06-05'),
('Ευαγγελία', 'Σπύρου', 'evaggelia.s@email.gr', '+30 694 0000000', 'Παπανδρέου 89', 'Τρίκαλα', 'Greece', '2024-06-10'),
('Χρήστος', 'Μάρκου', 'christos.mar@email.gr', '+30 695 1234567', 'Διοικητηρίου 15', 'Κομοτηνή', 'Greece', '2024-06-15'),
('Μαρίνα', 'Θεοδώρου', 'marina.theo@email.gr', '+30 695 2345678', 'Ρήγα Φεραίου 34', 'Σέρρες', 'Greece', '2024-07-01'),
('Αντώνης', 'Καραγιάννης', 'antonis.k@email.gr', '+30 695 3456789', 'Γούναρη 56', 'Κιλκίς', 'Greece', '2024-07-05'),
('Δέσποινα', 'Βλάχου', 'despoina.v@email.gr', '+30 695 4567890', 'Πλαστήρα 78', 'Καρδίτσα', 'Greece', '2024-07-10'),
('Σπύρος', 'Γρηγορίου', 'spyros.g@email.gr', '+30 695 5678901', 'Καραϊσκάκη 12', 'Άρτα', 'Greece', '2024-07-15'),
('Φωτεινή', 'Αλεξίου', 'foteini.a@email.gr', '+30 695 6789012', 'Ελ. Βενιζέλου 45', 'Ξάνθη', 'Greece', '2024-08-01'),
('Γιάννης', 'Σιδηρόπουλος', 'giannis.sid@email.gr', '+30 695 7890123', 'Κύπρου 23', 'Κοζάνη', 'Greece', '2024-08-05'),
('Βασιλική', 'Λιάκου', 'vasiliki.l@email.gr', '+30 695 8901234', 'Μεσολογγίου 67', 'Αγρίνιο', 'Greece', '2024-08-10'),
('Ορέστης', 'Νικολαΐδης', 'orestis.n@email.gr', '+30 695 9012345', 'Ολυμπίας 89', 'Πύργος', 'Greece', '2024-08-15'),
('Πηνελόπη', 'Καλλίνικου', 'pinelopi.k@email.gr', '+30 695 0123456', 'Αχαΐας 15', 'Πάτρα', 'Greece', '2024-09-01'),
('Λεωνίδας', 'Ζαχαρίας', 'leonidas.z@email.gr', '+30 696 1234567', 'Λεωφ. Αθηνών 234', 'Κόρινθος', 'Greece', '2024-09-05'),
('Χαρά', 'Παπαϊωάννου', 'xara.p@email.gr', '+30 696 2345678', 'Σταδίου 56', 'Λιβαδειά', 'Greece', '2024-09-10'),
('Θοδωρής', 'Κολοκοτρώνης', 'thodoris.k@email.gr', '+30 696 3456789', 'Αθηνών 78', 'Χαλκίδα', 'Greece', '2024-09-15'),
('Αλεξάνδρα', 'Μπούρα', 'alexandra.b@email.gr', '+30 696 4567890', 'Κεντρικής 12', 'Λαμία', 'Greece', '2024-10-01'),
('Διονύσης', 'Φίλιππος', 'dionisis.f@email.gr', '+30 696 5678901', 'Ναυάρχου 45', 'Ναύπλιο', 'Greece', '2024-10-05');

-- ====================================
-- 4. INSERT INTO PRODUCTS (40 records)
-- ====================================
INSERT INTO Products (product_name, category_id, description, price, stock_quantity, created_date) VALUES
-- Laptops
('Dell XPS 13', 1, 'Premium ultrabook με 13.4" οθόνη και Intel i7', 1299.99, 15, '2024-01-10'),
('MacBook Air M2', 1, 'Apple laptop με M2 chip και 13.6" Retina display', 1449.99, 12, '2024-01-15'),
('Lenovo ThinkPad X1', 1, 'Business laptop με 14" οθόνη και εξαιρετική αντοχή', 1199.99, 10, '2024-01-20'),
('HP Pavilion 15', 1, 'All-around laptop για καθημερινή χρήση', 699.99, 25, '2024-02-01'),
('ASUS ROG Zephyrus', 1, 'Gaming laptop με RTX 4060 και 16" οθόνη', 1899.99, 8, '2024-02-05'),

-- Smartphones
('iPhone 15 Pro', 2, 'Apple smartphone με A17 Pro chip και τριπλή κάμερα', 1199.99, 30, '2024-01-10'),
('Samsung Galaxy S24', 2, 'Flagship Android με Snapdragon 8 Gen 3', 999.99, 35, '2024-01-15'),
('Google Pixel 8', 2, 'Pure Android experience με εξαιρετική κάμερα', 699.99, 20, '2024-01-20'),
('OnePlus 12', 2, 'Flagship killer με Snapdragon 8 Gen 3', 799.99, 18, '2024-02-01'),
('Xiaomi 14 Pro', 2, 'Premium smartphone με Leica κάμερα', 899.99, 22, '2024-02-10'),

-- Tablets
('iPad Pro 12.9"', 3, 'Professional tablet με M2 chip', 1099.99, 15, '2024-01-10'),
('Samsung Galaxy Tab S9', 3, 'Android tablet με S Pen', 849.99, 20, '2024-01-20'),
('iPad Air', 3, 'Ισορροπημένο tablet για όλες τις χρήσεις', 599.99, 25, '2024-02-01'),
('Lenovo Tab P12', 3, 'Large screen tablet για entertainment', 449.99, 18, '2024-02-10'),

-- Computer Accessories
('Logitech MX Master 3S', 4, 'Premium wireless mouse για παραγωγικότητα', 99.99, 50, '2024-01-05'),
('Keychron K8 Pro', 4, 'Mechanical keyboard με hot-swappable switches', 119.99, 40, '2024-01-10'),
('Webcam Logitech C920', 4, 'Full HD webcam για video calls', 79.99, 35, '2024-01-15'),
('USB-C Hub Anker', 4, '7-in-1 USB-C hub με HDMI και card reader', 49.99, 60, '2024-01-20'),
('Monitor LG 27" 4K', 4, '27-inch 4K IPS monitor με USB-C', 449.99, 20, '2024-02-01'),
('Laptop Stand Aluminum', 4, 'Adjustable laptop stand για καλύτερη εργονομία', 39.99, 45, '2024-02-05'),

-- Audio Equipment
('Sony WH-1000XM5', 5, 'Premium noise-cancelling headphones', 349.99, 30, '2024-01-10'),
('AirPods Pro 2', 5, 'Apple true wireless earbuds με ANC', 249.99, 40, '2024-01-15'),
('JBL Flip 6', 5, 'Portable Bluetooth speaker waterproof', 129.99, 35, '2024-01-20'),
('Bose QuietComfort 45', 5, 'Comfortable ANC headphones', 329.99, 25, '2024-02-01'),
('Beyerdynamic DT 770 Pro', 5, 'Professional studio headphones', 159.99, 22, '2024-02-10'),

-- Gaming
('PlayStation 5', 6, 'Sony next-gen gaming console', 499.99, 15, '2024-01-10'),
('Xbox Series X', 6, 'Microsoft flagship gaming console', 499.99, 12, '2024-01-15'),
('Nintendo Switch OLED', 6, 'Portable gaming console με OLED οθόνη', 349.99, 25, '2024-01-20'),
('DualSense Controller', 6, 'PS5 wireless controller με haptic feedback', 69.99, 40, '2024-02-01'),
('Xbox Wireless Controller', 6, 'Xbox Series controller', 59.99, 35, '2024-02-05'),

-- Smart Home
('Philips Hue Starter Kit', 7, 'Smart LED λάμπες με hub', 89.99, 30, '2024-01-10'),
('Amazon Echo Dot 5', 7, 'Smart speaker με Alexa', 49.99, 45, '2024-01-15'),
('Google Nest Thermostat', 7, 'Smart thermostat για εξοικονόμηση ενέργειας', 129.99, 20, '2024-01-20'),
('Ring Video Doorbell', 7, 'Smart doorbell με κάμερα', 99.99, 25, '2024-02-01'),
('TP-Link Tapo Camera', 7, 'Smart security camera 1080p', 39.99, 50, '2024-02-10'),

-- Wearables
('Apple Watch Series 9', 8, 'Smartwatch με health tracking', 429.99, 30, '2024-01-10'),
('Samsung Galaxy Watch 6', 8, 'Android smartwatch με Wear OS', 299.99, 25, '2024-01-15'),
('Fitbit Charge 6', 8, 'Fitness tracker με HR monitor', 159.99, 35, '2024-01-20'),
('Garmin Forerunner 265', 8, 'GPS running watch για αθλητές', 449.99, 18, '2024-02-01'),
('Xiaomi Mi Band 8', 8, 'Budget-friendly fitness tracker', 39.99, 60, '2024-02-10');

-- ====================================
-- 5. INSERT INTO PRODUCT_SUPPLIERS (50+ records)
-- ====================================
INSERT INTO Product_Suppliers (product_id, supplier_id, supply_price, last_supply_date) VALUES
-- Laptops suppliers
(1, 1, 1050.00, '2024-01-05'),
(1, 3, 1045.00, '2024-01-08'),
(2, 7, 1200.00, '2024-01-10'),
(2, 9, 1195.00, '2024-01-12'),
(3, 1, 950.00, '2024-01-15'),
(3, 6, 945.00, '2024-01-18'),
(4, 2, 550.00, '2024-01-20'),
(4, 5, 560.00, '2024-01-22'),
(5, 4, 1600.00, '2024-01-25'),

-- Smartphones suppliers
(6, 7, 980.00, '2024-01-05'),
(6, 9, 975.00, '2024-01-08'),
(7, 4, 820.00, '2024-01-10'),
(7, 8, 815.00, '2024-01-12'),
(8, 2, 570.00, '2024-01-15'),
(8, 7, 565.00, '2024-01-18'),
(9, 4, 650.00, '2024-01-20'),
(9, 10, 645.00, '2024-01-22'),
(10, 4, 730.00, '2024-01-25'),

-- Tablets suppliers
(11, 7, 900.00, '2024-01-05'),
(11, 9, 895.00, '2024-01-08'),
(12, 4, 690.00, '2024-01-10'),
(12, 8, 685.00, '2024-01-12'),
(13, 7, 480.00, '2024-01-15'),
(13, 9, 475.00, '2024-01-18'),
(14, 3, 360.00, '2024-01-20'),

-- Computer Accessories suppliers
(15, 1, 75.00, '2024-01-05'),
(15, 5, 73.00, '2024-01-08'),
(16, 2, 90.00, '2024-01-10'),
(16, 6, 88.00, '2024-01-12'),
(17, 1, 60.00, '2024-01-15'),
(17, 3, 58.00, '2024-01-18'),
(18, 2, 35.00, '2024-01-20'),
(18, 10, 33.00, '2024-01-22'),
(19, 3, 360.00, '2024-01-25'),
(19, 6, 355.00, '2024-01-28'),
(20, 1, 28.00, '2024-02-01'),
(20, 5, 27.00, '2024-02-03'),

-- Audio Equipment suppliers
(21, 2, 280.00, '2024-01-05'),
(21, 9, 275.00, '2024-01-08'),
(22, 7, 200.00, '2024-01-10'),
(22, 9, 195.00, '2024-01-12'),
(23, 4, 95.00, '2024-01-15'),
(23, 8, 93.00, '2024-01-18'),
(24, 2, 265.00, '2024-01-20'),
(24, 6, 260.00, '2024-01-22'),
(25, 3, 120.00, '2024-01-25'),

-- Gaming suppliers
(26, 4, 410.00, '2024-01-05'),
(26, 9, 405.00, '2024-01-08'),
(27, 2, 410.00, '2024-01-10'),
(27, 7, 405.00, '2024-01-12'),
(28, 9, 280.00, '2024-01-15'),
(28, 4, 275.00, '2024-01-18'),
(29, 4, 52.00, '2024-01-20'),
(29, 9, 50.00, '2024-01-22'),
(30, 2, 45.00, '2024-01-25'),
(30, 7, 43.00, '2024-01-28'),

-- Smart Home suppliers
(31, 1, 68.00, '2024-01-05'),
(31, 6, 66.00, '2024-01-08'),
(32, 2, 35.00, '2024-01-10'),
(32, 7, 33.00, '2024-01-12'),
(33, 2, 95.00, '2024-01-15'),
(33, 7, 93.00, '2024-01-18'),
(34, 1, 75.00, '2024-01-20'),
(34, 10, 73.00, '2024-01-22'),
(35, 4, 28.00, '2024-01-25'),
(35, 8, 27.00, '2024-01-28'),

-- Wearables suppliers
(36, 7, 350.00, '2024-01-05'),
(36, 9, 345.00, '2024-01-08'),
(37, 4, 240.00, '2024-01-10'),
(37, 8, 235.00, '2024-01-12'),
(38, 1, 120.00, '2024-01-15'),
(38, 5, 118.00, '2024-01-18'),
(39, 2, 360.00, '2024-01-20'),
(39, 6, 355.00, '2024-01-22'),
(40, 4, 28.00, '2024-01-25'),
(40, 8, 27.00, '2024-01-28');

-- ====================================
-- 6. INSERT INTO ORDERS (30 records)
-- ====================================
INSERT INTO Orders (customer_id, order_date, status, total_amount, shipping_address) VALUES
(1, '2024-10-05 10:30:00', 'Delivered', 1349.98, 'Ερμού 45, Αθήνα'),
(2, '2024-10-07 14:20:00', 'Delivered', 999.99, 'Τσιμισκή 123, Θεσσαλονίκη'),
(3, '2024-10-10 09:15:00', 'Delivered', 229.98, 'Αγίου Νικολάου 78, Πάτρα'),
(4, '2024-10-12 16:45:00', 'Delivered', 1449.99, 'Βενιζέλου 34, Ηράκλειο'),
(5, '2024-10-15 11:30:00', 'Shipped', 579.98, 'Κολοκοτρώνη 56, Αθήνα'),
(6, '2024-10-18 13:20:00', 'Shipped', 1899.99, 'Μητροπόλεως 12, Λάρισα'),
(7, '2024-10-20 10:00:00', 'Processing', 799.99, 'Εγνατία 234, Θεσσαλονίκη'),
(8, '2024-10-22 15:30:00', 'Processing', 349.99, 'Αριστοτέλους 45, Βόλος'),
(9, '2024-10-25 12:15:00', 'Pending', 659.97, 'Πανεπιστημίου 89, Αθήνα'),
(10, '2024-10-28 09:45:00', 'Pending', 1199.99, 'Μακεδονίας 67, Ιωάννινα'),
(11, '2024-11-01 14:00:00', 'Delivered', 499.99, 'Κύπρου 23, Καβάλα'),
(12, '2024-11-03 11:20:00', 'Delivered', 279.98, 'Αγίας Σοφίας 15, Χανιά'),
(13, '2024-11-05 16:30:00', 'Delivered', 699.99, 'Ομήρου 34, Ρόδος'),
(14, '2024-11-08 10:15:00', 'Shipped', 1549.98, 'Θεσσαλονίκης 56, Αλεξανδρούπολη'),
(15, '2024-11-10 13:45:00', 'Shipped', 429.99, 'Κοραή 78, Κέρκυρα'),
(16, '2024-11-12 09:30:00', 'Processing', 339.98, 'Σπύρου Λούη 12, Αθήνα'),
(17, '2024-11-15 15:00:00', 'Processing', 1099.99, 'Βασιλίσσης Όλγας 45, Θεσσαλονίκη'),
(18, '2024-11-18 11:45:00', 'Pending', 219.98, 'Αθηνάς 23, Πειραιάς'),
(19, '2024-11-20 14:20:00', 'Pending', 849.99, 'Ελευθερίας 67, Καλαμάτα'),
(20, '2024-11-22 10:30:00', 'Delivered', 159.99, 'Παπανδρέου 89, Τρίκαλα'),
(21, '2024-11-25 16:15:00', 'Delivered', 999.98, 'Διοικητηρίου 15, Κομοτηνή'),
(22, '2024-11-28 12:00:00', 'Shipped', 449.99, 'Ρήγα Φεραίου 34, Σέρρες'),
(23, '2024-12-01 09:30:00', 'Shipped', 1899.98, 'Γούναρη 56, Κιλκίς'),
(24, '2024-12-03 14:45:00', 'Processing', 329.99, 'Πλαστήρα 78, Καρδίτσα'),
(25, '2024-12-05 11:20:00', 'Processing', 699.98, 'Καραϊσκάκη 12, Άρτα'),
(26, '2024-12-08 15:30:00', 'Pending', 249.99, 'Ελ. Βενιζέλου 45, Ξάνθη'),
(27, '2024-12-10 10:00:00', 'Pending', 1299.99, 'Κύπρου 23, Κοζάνη'),
(28, '2024-12-12 13:15:00', 'Delivered', 189.98, 'Μεσολογγίου 67, Αγρίνιο'),
(29, '2024-12-15 09:45:00', 'Delivered', 599.99, 'Ολυμπίας 89, Πύργος'),
(30, '2024-12-18 16:00:00', 'Shipped', 1749.98, 'Αχαΐας 15, Πάτρα');

-- ====================================
-- 7. INSERT INTO ORDER_ITEMS (60+ records)
-- ====================================
INSERT INTO Order_Items (order_id, product_id, quantity, unit_price) VALUES
-- Order 1: Customer 1 bought laptop accessories
(1, 1, 1, 1299.99),
(1, 17, 1, 49.99),

-- Order 2: Customer 2 bought smartphone
(2, 7, 1, 999.99),

-- Order 3: Customer 3 bought audio equipment
(3, 23, 1, 129.99),
(3, 15, 1, 99.99),

-- Order 4: Customer 4 bought MacBook
(4, 2, 1, 1449.99),

-- Order 5: Customer 5 bought accessories
(5, 16, 1, 119.99),
(5, 20, 2, 39.99),
(5, 18, 4, 49.99),
(5, 15, 2, 99.99),

-- Order 6: Customer 6 bought gaming laptop
(6, 5, 1, 1899.99),

-- Order 7: Customer 7 bought smartphone
(7, 9, 1, 799.99),

-- Order 8: Customer 8 bought Nintendo Switch
(8, 28, 1, 349.99),

-- Order 9: Customer 9 bought smart home products
(9, 31, 1, 89.99),
(9, 32, 2, 49.99),
(9, 35, 5, 39.99),
(9, 34, 2, 99.99),

-- Order 10: Customer 10 bought iPhone
(10, 6, 1, 1199.99),

-- Order 11: Customer 11 bought PlayStation
(11, 26, 1, 499.99),

-- Order 12: Customer 12 bought headphones and speaker
(12, 21, 1, 349.99),
(12, 23, 2, 129.99),

-- Order 13: Customer 13 bought laptop
(13, 4, 1, 699.99),

-- Order 14: Customer 14 bought tablets and accessories
(14, 11, 1, 1099.99),
(14, 20, 1, 39.99),
(14, 18, 2, 49.99),
(14, 15, 3, 99.99),

-- Order 15: Customer 15 bought Apple Watch
(15, 36, 1, 429.99),

-- Order 16: Customer 16 bought audio equipment
(16, 22, 1, 249.99),
(16, 23, 1, 129.99),
(16, 15, 3, 99.99),

-- Order 17: Customer 17 bought iPad
(17, 11, 1, 1099.99),

-- Order 18: Customer 18 bought accessories
(18, 17, 2, 79.99),
(18, 18, 1, 49.99),

-- Order 19: Customer 19 bought Samsung tablet
(19, 12, 1, 849.99),

-- Order 20: Customer 20 bought fitness tracker
(20, 38, 1, 159.99),

-- Order 21: Customer 21 bought Xbox and controllers
(21, 27, 1, 499.99),
(21, 30, 2, 59.99),
(21, 29, 4, 69.99),

-- Order 22: Customer 22 bought Garmin watch
(22, 39, 1, 449.99),

-- Order 23: Customer 23 bought laptops
(23, 3, 1, 1199.99),
(23, 4, 1, 699.99),

-- Order 24: Customer 24 bought Bose headphones
(24, 24, 1, 329.99),

-- Order 25: Customer 25 bought Google Pixel and accessories
(25, 8, 1, 699.99),
(25, 15, 3, 99.99),
(25, 17, 2, 79.99),
(25, 18, 5, 49.99),

-- Order 26: Customer 26 bought AirPods
(26, 22, 1, 249.99),

-- Order 27: Customer 27 bought Dell XPS
(27, 1, 1, 1299.99),

-- Order 28: Customer 28 bought wearables
(28, 40, 2, 39.99),
(28, 38, 1, 159.99),
(28, 36, 2, 429.99),

-- Order 29: Customer 29 bought iPad Air
(29, 13, 1, 599.99),

-- Order 30: Customer 30 bought Sony headphones and monitor
(30, 21, 1, 349.99),
(30, 19, 1, 449.99),
(30, 15, 5, 99.99),
(30, 16, 3, 119.99);

-- ====================================
-- 8. INSERT INTO REVIEWS (35+ records)
-- ====================================
INSERT INTO Reviews (product_id, customer_id, rating, comment, review_date) VALUES
(1, 1, 5, 'Εξαιρετικό laptop! Πολύ γρήγορο και ελαφρύ. Το συνιστώ ανεπιφύλακτα.', '2024-10-15 14:30:00'),
(7, 2, 5, 'Το καλύτερο Android smartphone που είχα ποτέ. Η κάμερα είναι φανταστική!', '2024-10-20 11:45:00'),
(23, 3, 4, 'Πολύ καλό ηχείο για την τιμή του. Μόνο το bass θα μπορούσε να είναι καλύτερο.', '2024-10-25 16:20:00'),
(2, 4, 5, 'MacBook Air M2 - απλά τέλειο! Η μπαταρία κρατάει όλη μέρα.', '2024-10-28 10:15:00'),
(5, 6, 5, 'Gaming laptop υψηλών προδιαγραφών. Τρέχει όλα τα παιχνίδια στο max!', '2024-11-02 13:30:00'),
(9, 7, 4, 'Πολύ καλό smartphone, αλλά η μπαταρία θα μπορούσε να είναι μεγαλύτερη.', '2024-11-05 15:45:00'),
(28, 8, 5, 'Nintendo Switch OLED - η οθόνη είναι υπέροχη! Τα παιδιά το λατρεύουν.', '2024-11-10 09:20:00'),
(6, 10, 5, 'iPhone 15 Pro - το καλύτερο iPhone μέχρι σήμερα. Η κάμερα είναι εκπληκτική!', '2024-11-15 14:00:00'),
(26, 11, 4, 'PlayStation 5 - γενικά πολύ καλή, αλλά δύσκολο να βρεις παιχνίδια.', '2024-11-18 11:30:00'),
(21, 12, 5, 'Sony WH-1000XM5 - τα καλύτερα ακουστικά που είχα! Το ANC είναι φανταστικό.', '2024-11-22 16:45:00'),
(4, 13, 4, 'HP Pavilion - καλό laptop για την τιμή. Κάνει τη δουλειά του.', '2024-11-25 10:20:00'),
(11, 14, 5, 'iPad Pro 12.9" - τέλειο για σχεδιασμό και παραγωγικότητα!', '2024-11-28 13:15:00'),
(36, 15, 5, 'Apple Watch Series 9 - must have gadget! Tracking υγείας σε άλλο επίπεδο.', '2024-12-01 15:30:00'),
(22, 16, 4, 'AirPods Pro 2 - εξαιρετικά, αλλά λίγο ακριβά.', '2024-12-04 09:45:00'),
(12, 19, 5, 'Samsung Galaxy Tab S9 - καταπληκτικό tablet! Το S Pen είναι bonus.', '2024-12-08 14:20:00'),
(38, 20, 4, 'Fitbit Charge 6 - καλό fitness tracker, αλλά η εφαρμογή θέλει βελτίωση.', '2024-12-11 11:00:00'),
(27, 21, 5, 'Xbox Series X - gaming στο απόλυτο! Γρήγορο loading και εκπληκτικά γραφικά.', '2024-12-14 16:15:00'),
(39, 22, 5, 'Garmin Forerunner 265 - το καλύτερο ρολόι για τρέξιμο. Ακριβό αλλά αξίζει!', '2024-12-17 10:30:00'),
(3, 23, 4, 'Lenovo ThinkPad X1 - σταθερό business laptop. Λίγο βαρύ αλλά ανθεκτικό.', '2024-12-20 13:45:00'),
(24, 24, 5, 'Bose QuietComfort 45 - άνετα και με εξαιρετικό ήχο!', '2024-12-23 15:00:00'),
(15, 5, 5, 'Logitech MX Master 3S - το καλύτερο ποντίκι για productivity!', '2024-11-03 12:20:00'),
(16, 5, 4, 'Keychron K8 Pro - εξαιρετικό μηχανικό πληκτρολόγιο, αλλά λίγο θορυβώδες.', '2024-11-04 14:35:00'),
(31, 9, 4, 'Philips Hue - πολύ ωραίες λάμπες, αλλά το σύστημα είναι ακριβό.', '2024-11-12 10:15:00'),
(32, 9, 5, 'Amazon Echo Dot 5 - μικρό αλλά πολύ χρήσιμο! Η Alexa βοηθάει πολύ.', '2024-11-13 11:30:00'),
(17, 14, 5, 'Webcam Logitech C920 - άψογη εικόνα για video calls!', '2024-12-02 09:40:00'),
(13, 29, 4, 'iPad Air - πολύ καλό, αλλά θα προτιμούσα το Pro για τα λεφτά.', '2024-12-25 14:50:00'),
(19, 30, 5, 'Monitor LG 27" 4K - εκπληκτική ποιότητα εικόνας! Τέλειο για editing.', '2024-12-28 16:20:00'),
(8, 25, 5, 'Google Pixel 8 - η κάμερα είναι η καλύτερη που υπάρχει!', '2024-12-10 13:25:00'),
(40, 28, 5, 'Xiaomi Mi Band 8 - απίστευτη value for money!', '2024-12-26 11:45:00'),
(35, 9, 3, 'TP-Link Tapo Camera - καλή για την τιμή, αλλά η εφαρμογή κολλάει μερικές φορές.', '2024-11-14 15:50:00'),
(30, 21, 4, 'Xbox Wireless Controller - άνετο και responsive, αλλά η μπαταρία τελειώνει γρήγορα.', '2024-12-15 12:10:00'),
(18, 5, 5, 'USB-C Hub Anker - must have για laptop! Πολλές θύρες σε μικρό μέγεθος.', '2024-11-05 16:30:00'),
(20, 14, 4, 'Laptop Stand - πολύ καλό για εργονομία, αλλά θα μπορούσε να είναι πιο σταθερό.', '2024-12-03 10:55:00'),
(37, 28, 4, 'Samsung Galaxy Watch 6 - ωραίο smartwatch, αλλά το Apple Watch είναι καλύτερο.', '2024-12-27 14:15:00'),
(25, 5, 3, 'Beyerdynamic DT 770 Pro - καλά ακουστικά για studio, αλλά όχι για casual ακρόαση.', '2024-11-06 17:20:00');

-- Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS = 1;

-- ====================================
-- VERIFICATION QUERIES
-- ====================================
-- Έλεγχος πλήθους εγγραφών ανά πίνακα
SELECT 'Categories' AS table_name, COUNT(*) AS record_count FROM Categories
UNION ALL
SELECT 'Suppliers', COUNT(*) FROM Suppliers
UNION ALL
SELECT 'Customers', COUNT(*) FROM Customers
UNION ALL
SELECT 'Products', COUNT(*) FROM Products
UNION ALL
SELECT 'Product_Suppliers', COUNT(*) FROM Product_Suppliers
UNION ALL
SELECT 'Orders', COUNT(*) FROM Orders
UNION ALL
SELECT 'Order_Items', COUNT(*) FROM Order_Items
UNION ALL
SELECT 'Reviews', COUNT(*) FROM Reviews;

-- Δείγμα δεδομένων από κάθε πίνακα
SELECT '=== SAMPLE CUSTOMERS ===' AS info;
SELECT * FROM Customers LIMIT 5;

SELECT '=== SAMPLE PRODUCTS ===' AS info;
SELECT * FROM Products LIMIT 5;

SELECT '=== SAMPLE ORDERS ===' AS info;
SELECT * FROM Orders LIMIT 5;

SELECT '=== SAMPLE ORDER_ITEMS ===' AS info;
SELECT * FROM Order_Items LIMIT 10;

SELECT '=== SAMPLE REVIEWS ===' AS info;
SELECT * FROM Reviews LIMIT 5;
