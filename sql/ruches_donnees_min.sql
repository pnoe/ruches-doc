INSERT INTO public.personne
  (id, active, email, login, nom, prenom, password, roles, adresse)
  VALUES (1, true, 'admin@admin.fr', 'admin', 'admin', 'admin', '$2a$10$1LqLK3XoVufvBFNG5UyiveWsovMbfkp1FBViNwfxbl0UfNeHdqtlO', 'admin', '');
SELECT nextval('public.personne_seq');
INSERT INTO public.rucher
  (id, actif, altitude, depot, latitude, longitude, nom, contact_id)
  VALUES (1, true, 100, true, 43.5383759, 5.5266428, 'Dépôt', 1);
SELECT nextval('public.rucher_seq');
