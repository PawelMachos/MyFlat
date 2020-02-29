# --user, but without decoded password
#
# --INSERT INTO users (username, password, first_name, last_name, email, flat_number, role) VALUES ('jnowak', 'jnowak', 'Jan', 'Nowak','nowak@ziom.com', '1', 'ROLE_USER');

# -- current data

INSERT INTO flats(active, flat_number, user_id) VALUES (true, 1, 1);
INSERT INTO flats(active, flat_number) VALUES (true, 2);
INSERT INTO flats(active, flat_number) VALUES (true, 3);
INSERT INTO flats(active, flat_number) VALUES (true, 4);
INSERT INTO flats(active, flat_number) VALUES (true, 5);
INSERT INTO flats(active, flat_number) VALUES (true, 6);
INSERT INTO flats(active, flat_number) VALUES (true, 7);
INSERT INTO flats(active, flat_number) VALUES (true, 8);
INSERT INTO flats(active, flat_number) VALUES (true, 9);
INSERT INTO flats(active, flat_number) VALUES (true, 10);
