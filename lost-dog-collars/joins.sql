SELECT dog_owners.name AS owner, lost_dog_collars.dog_name AS dog
  FROM dog_owners
  JOIN lost_dog_collars
  ON (dog_owners.dog_name = lost_dog_collars.dog_name);

SELECT lost_dog_collars.dog_name AS dog
  FROM lost_dog_collars
  LEFT JOIN dog_owners
  ON (dog_owners.dog_name = lost_dog_collars.dog_name)
  WHERE dog_owners.name IS NULL;

  SELECT lost_dog_collars.dog_name as dog, dog_owners.name as owner
  FROM lost_dog_collars
  LEFT OUTER JOIN dog_owners
  ON (dog_owners.dog_name = lost_dog_collars.dog_name);

  SELECT dog_owners.name as name, lost_dog_collars.dog_name as dog
  FROM dog_owners
  LEFT OUTER JOIN lost_dog_collars
  ON (dog_owners.dog_name = lost_dog_collars.dog_name);
