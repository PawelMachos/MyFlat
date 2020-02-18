
INSERT INTO users (username, password, first_name, last_name, email, flat_number, role) VALUES ('jnowak', 'jnowak', 'Jan', 'Nowak','nowak@ziom.com', '1', 'ROLE_USER');

INSERT INTO bills(user_id, category, invoice_number, invoice_date, gross_amount, active) VALUES (1,'EARMARKED_FUND','XY1234','2020-02-01',35,true);
INSERT INTO bills(user_id, category, invoice_number, invoice_date, gross_amount, active) VALUES (1,'REPAIR_FUND','51631','2020-02-01',21,true);
INSERT INTO bills(user_id, category, invoice_number, invoice_date, gross_amount, active) VALUES (1,'CO_AND_CW_FIXED_FEE','637235','2020-02-01',45,true);
INSERT INTO bills(user_id, category, invoice_number, invoice_date, gross_amount, active) VALUES (1,'MANAGEMENT_COSTS','12667','2020-02-01',12,true);
INSERT INTO bills(user_id, category, invoice_number, invoice_date, gross_amount, active) VALUES (1,'CENTRAL_HEATING','X23Y81234','2020-02-01',13,true);
INSERT INTO bills(user_id, category, invoice_number, invoice_date, gross_amount, active) VALUES (1,'WASTE_DISPOSAL','GHF251','2020-02-01',78,true);
INSERT INTO bills(user_id, category, invoice_number, invoice_date, gross_amount, active) VALUES (1,'WATER_HEATING','CTR24','2020-02-01',41,true);
INSERT INTO bills(user_id, category, invoice_number, invoice_date, gross_amount, active) VALUES (1,'COLD_WATER_AND_SEWAGE','777555','2020-02-01',31,true);
INSERT INTO bills(user_id, category, invoice_number, invoice_date, gross_amount, active) VALUES (1,'ENERGY','45','2020-02-01',106,true);