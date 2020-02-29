# --user, but without decoded password
#
# --INSERT INTO users (username, password, first_name, last_name, email, flat_number, role) VALUES ('PawelGawel', 'pawelgawel', 'Paweł', 'Gaweł','pawelgawel@poczta.com', '1', 'ROLE_USER');

-- current data

INSERT INTO adverts(user_id, created_at, active, description, title) VALUES (1,'2020-02-29 18:06:58', true,'Znaleziono okrągłe klucze z zieloną nakładką przed klatką. Proszę dzwonić na numer 678456123 lub pukać do mieszkania 4 w godzinach dziennych.', 'ZNALEZIONO KLUCZE PRZED KLATKĄ');

INSERT INTO adverts(user_id, created_at, active, description, title) VALUES (1,'2020-01-13 13:45:58', true,'Wynajmę garaż na ulicy Słubickiej. Cena za miesiąc 150 zł. Garaż oświetlony z dostępem do prądu. Więcej informacji pod numerem 546382915.', 'WYNAJMĘ GARAŻ');


