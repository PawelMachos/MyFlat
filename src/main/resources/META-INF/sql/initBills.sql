--user, but without decoded password

--INSERT INTO users (username, password, first_name, last_name, email, flat_number, role) VALUES ('jnowak', 'jnowak', 'Jan', 'Nowak','nowak@ziom.com', '1', 'ROLE_USER');

-- current data
INSERT INTO bills(user_id, category, invoice_number, invoice_date, gross_amount, active) VALUES (1,'EARMARKED_FUND','XY1234','2020-02-01',35,true);
INSERT INTO bills(user_id, category, invoice_number, invoice_date, gross_amount, active) VALUES (1,'REPAIR_FUND','51631','2020-02-01',21,true);
INSERT INTO bills(user_id, category, invoice_number, invoice_date, gross_amount, active) VALUES (1,'CO_AND_CW_FIXED_FEE','637235','2020-02-01',45,true);
INSERT INTO bills(user_id, category, invoice_number, invoice_date, gross_amount, active) VALUES (1,'MANAGEMENT_COSTS','12667','2020-02-01',12,true);
INSERT INTO bills(user_id, category, invoice_number, invoice_date, gross_amount, active) VALUES (1,'CENTRAL_HEATING','X23Y81234','2020-02-01',17,true);
INSERT INTO bills(user_id, category, invoice_number, invoice_date, gross_amount, active) VALUES (1,'WASTE_DISPOSAL','GHF251','2020-02-01',78,true);
INSERT INTO bills(user_id, category, invoice_number, invoice_date, gross_amount, active) VALUES (1,'WATER_HEATING','CTR24','2020-02-01',43.5,true);
INSERT INTO bills(user_id, category, invoice_number, invoice_date, gross_amount, active) VALUES (1,'COLD_WATER_AND_SEWAGE','777555','2020-02-01',28.5,true);
INSERT INTO bills(user_id, category, invoice_number, invoice_date, gross_amount, active) VALUES (1,'ENERGY','45','2020-02-01',106,true);
-- historical data
INSERT INTO bills(user_id, category, invoice_number, invoice_date, gross_amount, active) VALUES (1,'EARMARKED_FUND','XY1234','2020-01-01',35,false);
INSERT INTO bills(user_id, category, invoice_number, invoice_date, gross_amount, active) VALUES (1,'REPAIR_FUND','51631','2020-01-01',21,false);
INSERT INTO bills(user_id, category, invoice_number, invoice_date, gross_amount, active) VALUES (1,'CO_AND_CW_FIXED_FEE','637235','2020-01-01',45,false);
INSERT INTO bills(user_id, category, invoice_number, invoice_date, gross_amount, active) VALUES (1,'MANAGEMENT_COSTS','12667','2020-01-01',12,false);
INSERT INTO bills(user_id, category, invoice_number, invoice_date, gross_amount, active) VALUES (1,'CENTRAL_HEATING','X23Y81234','2020-01-01',16,false);
INSERT INTO bills(user_id, category, invoice_number, invoice_date, gross_amount, active) VALUES (1,'WASTE_DISPOSAL','GHF251','2020-01-01',78,false);
INSERT INTO bills(user_id, category, invoice_number, invoice_date, gross_amount, active) VALUES (1,'WATER_HEATING','CTR24','2020-01-01',43,false);
INSERT INTO bills(user_id, category, invoice_number, invoice_date, gross_amount, active) VALUES (1,'COLD_WATER_AND_SEWAGE','777555','2020-01-01',29,false);
INSERT INTO bills(user_id, category, invoice_number, invoice_date, gross_amount, active) VALUES (1,'ENERGY','45','2020-01-01',95.21,false);

INSERT INTO bills(user_id, category, invoice_number, invoice_date, gross_amount, active) VALUES (1,'EARMARKED_FUND','XY1234','2019-12-01',35,false);
INSERT INTO bills(user_id, category, invoice_number, invoice_date, gross_amount, active) VALUES (1,'REPAIR_FUND','51631','2019-12-01',21,false);
INSERT INTO bills(user_id, category, invoice_number, invoice_date, gross_amount, active) VALUES (1,'CO_AND_CW_FIXED_FEE','637235','2019-12-01',45,false);
INSERT INTO bills(user_id, category, invoice_number, invoice_date, gross_amount, active) VALUES (1,'MANAGEMENT_COSTS','12667','2019-12-01',12,false);
INSERT INTO bills(user_id, category, invoice_number, invoice_date, gross_amount, active) VALUES (1,'CENTRAL_HEATING','X23Y81234','2019-12-01',13,false);
INSERT INTO bills(user_id, category, invoice_number, invoice_date, gross_amount, active) VALUES (1,'WASTE_DISPOSAL','GHF251','2019-12-01',78,false);
INSERT INTO bills(user_id, category, invoice_number, invoice_date, gross_amount, active) VALUES (1,'WATER_HEATING','CTR24','2019-12-01',41.5,false);
INSERT INTO bills(user_id, category, invoice_number, invoice_date, gross_amount, active) VALUES (1,'COLD_WATER_AND_SEWAGE','777555','2019-12-01',30.2,false);
INSERT INTO bills(user_id, category, invoice_number, invoice_date, gross_amount, active) VALUES (1,'ENERGY','45','2019-12-01',105,false);

INSERT INTO bills(user_id, category, invoice_number, invoice_date, gross_amount, active) VALUES (1,'EARMARKED_FUND','XY1234','2019-11-01',35,false);
INSERT INTO bills(user_id, category, invoice_number, invoice_date, gross_amount, active) VALUES (1,'REPAIR_FUND','51631','2019-11-01',21,false);
INSERT INTO bills(user_id, category, invoice_number, invoice_date, gross_amount, active) VALUES (1,'CO_AND_CW_FIXED_FEE','637235','2019-11-01',45,false);
INSERT INTO bills(user_id, category, invoice_number, invoice_date, gross_amount, active) VALUES (1,'MANAGEMENT_COSTS','12667','2019-11-01',12,false);
INSERT INTO bills(user_id, category, invoice_number, invoice_date, gross_amount, active) VALUES (1,'CENTRAL_HEATING','X23Y81234','2019-11-01',12,false);
INSERT INTO bills(user_id, category, invoice_number, invoice_date, gross_amount, active) VALUES (1,'WASTE_DISPOSAL','GHF251','2019-11-01',78,false);
INSERT INTO bills(user_id, category, invoice_number, invoice_date, gross_amount, active) VALUES (1,'WATER_HEATING','CTR24','2019-11-01',40.4,false);
INSERT INTO bills(user_id, category, invoice_number, invoice_date, gross_amount, active) VALUES (1,'COLD_WATER_AND_SEWAGE','777555','2019-11-01',31,false);
INSERT INTO bills(user_id, category, invoice_number, invoice_date, gross_amount, active) VALUES (1,'ENERGY','45','2019-11-01',102,false);

INSERT INTO bills(user_id, category, invoice_number, invoice_date, gross_amount, active) VALUES (1,'EARMARKED_FUND','XY1234','2019-10-01',35,false);
INSERT INTO bills(user_id, category, invoice_number, invoice_date, gross_amount, active) VALUES (1,'REPAIR_FUND','51631','2019-10-01',21,false);
INSERT INTO bills(user_id, category, invoice_number, invoice_date, gross_amount, active) VALUES (1,'CO_AND_CW_FIXED_FEE','637235','2019-10-01',45,false);
INSERT INTO bills(user_id, category, invoice_number, invoice_date, gross_amount, active) VALUES (1,'MANAGEMENT_COSTS','12667','2019-10-01',12,false);
INSERT INTO bills(user_id, category, invoice_number, invoice_date, gross_amount, active) VALUES (1,'CENTRAL_HEATING','X23Y81234','2019-10-01',11.6,false);
INSERT INTO bills(user_id, category, invoice_number, invoice_date, gross_amount, active) VALUES (1,'WASTE_DISPOSAL','GHF251','2019-10-01',78,false);
INSERT INTO bills(user_id, category, invoice_number, invoice_date, gross_amount, active) VALUES (1,'WATER_HEATING','CTR24','2019-10-01',39.9,false);
INSERT INTO bills(user_id, category, invoice_number, invoice_date, gross_amount, active) VALUES (1,'COLD_WATER_AND_SEWAGE','777555','2019-10-01',32,false);
INSERT INTO bills(user_id, category, invoice_number, invoice_date, gross_amount, active) VALUES (1,'ENERGY','45','2019-10-01',100,false);

INSERT INTO bills(user_id, category, invoice_number, invoice_date, gross_amount, active) VALUES (1,'EARMARKED_FUND','XY1234','2019-09-01',35,false);
INSERT INTO bills(user_id, category, invoice_number, invoice_date, gross_amount, active) VALUES (1,'REPAIR_FUND','51631','2019-09-01',21,false);
INSERT INTO bills(user_id, category, invoice_number, invoice_date, gross_amount, active) VALUES (1,'CO_AND_CW_FIXED_FEE','637235','2019-09-01',45,false);
INSERT INTO bills(user_id, category, invoice_number, invoice_date, gross_amount, active) VALUES (1,'MANAGEMENT_COSTS','12667','2019-09-01',12,false);
INSERT INTO bills(user_id, category, invoice_number, invoice_date, gross_amount, active) VALUES (1,'CENTRAL_HEATING','X23Y81234','2019-09-01',11.2,false);
INSERT INTO bills(user_id, category, invoice_number, invoice_date, gross_amount, active) VALUES (1,'WASTE_DISPOSAL','GHF251','2019-09-01',78,false);
INSERT INTO bills(user_id, category, invoice_number, invoice_date, gross_amount, active) VALUES (1,'WATER_HEATING','CTR24','2019-09-01',39.6,false);
INSERT INTO bills(user_id, category, invoice_number, invoice_date, gross_amount, active) VALUES (1,'COLD_WATER_AND_SEWAGE','777555','2019-09-01',36.7,false);
INSERT INTO bills(user_id, category, invoice_number, invoice_date, gross_amount, active) VALUES (1,'ENERGY','45','2019-09-01',99.5,false);

INSERT INTO bills(user_id, category, invoice_number, invoice_date, gross_amount, active) VALUES (1,'EARMARKED_FUND','XY1234','2019-08-01',35,false);
INSERT INTO bills(user_id, category, invoice_number, invoice_date, gross_amount, active) VALUES (1,'REPAIR_FUND','51631','2019-08-01',21,false);
INSERT INTO bills(user_id, category, invoice_number, invoice_date, gross_amount, active) VALUES (1,'CO_AND_CW_FIXED_FEE','637235','2019-08-01',45,false);
INSERT INTO bills(user_id, category, invoice_number, invoice_date, gross_amount, active) VALUES (1,'MANAGEMENT_COSTS','12667','2019-08-01',12,false);
INSERT INTO bills(user_id, category, invoice_number, invoice_date, gross_amount, active) VALUES (1,'CENTRAL_HEATING','X23Y81234','2019-08-01',11,false);
INSERT INTO bills(user_id, category, invoice_number, invoice_date, gross_amount, active) VALUES (1,'WASTE_DISPOSAL','GHF251','2019-08-01',78,false);
INSERT INTO bills(user_id, category, invoice_number, invoice_date, gross_amount, active) VALUES (1,'WATER_HEATING','CTR24','2019-08-01',38,false);
INSERT INTO bills(user_id, category, invoice_number, invoice_date, gross_amount, active) VALUES (1,'COLD_WATER_AND_SEWAGE','777555','2019-08-01',34,false);
INSERT INTO bills(user_id, category, invoice_number, invoice_date, gross_amount, active) VALUES (1,'ENERGY','45','2019-08-01',109,false);