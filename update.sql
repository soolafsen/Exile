SET SQL_SAFE_UPDATES=0;
UPDATE (player) SET name = REPLACE(name, '"', '');
UPDATE (clan) SET name = REPLACE(name, '"', '');
UPDATE (account) SET name = REPLACE(name, '"', '');
UPDATE (clan_map_marker) SET label = REPLACE(label, '"', '');
UPDATE (territory) SET name = REPLACE(name, '"', '');
