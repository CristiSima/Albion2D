INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,6,1,'Iron Ore',4,0,0,0.5);
INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,6,2,'Uncommon Iron Ore',4,1,0,0.5);
INSERT INTO _TAG_Recipes VALUES (_TAG_SEQ_Recipes.NEXTVAL,'Smelter',NULL,NULL);
   INSERT INTO _TAG_Ingredients VALUES (_TAG_SEQ_Recipes.currval,1,1);
   INSERT INTO _TAG_Possible_outcomes VALUES (_TAG_SEQ_Recipes.currval,2,100,1);

INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,6,3,'Rare Iron Ore',4,2,0,0.5);
INSERT INTO _TAG_Recipes VALUES (_TAG_SEQ_Recipes.NEXTVAL,'Smelter',NULL,NULL);
   INSERT INTO _TAG_Ingredients VALUES (_TAG_SEQ_Recipes.currval,2,1);
   INSERT INTO _TAG_Possible_outcomes VALUES (_TAG_SEQ_Recipes.currval,3,100,1);

INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,6,4,'Rare Titanium Ore',5,2,0,0.8);
INSERT INTO _TAG_Recipes VALUES (_TAG_SEQ_Recipes.NEXTVAL,'Smelter',NULL,NULL);
   INSERT INTO _TAG_Ingredients VALUES (_TAG_SEQ_Recipes.currval,3,1);
   INSERT INTO _TAG_Possible_outcomes VALUES (_TAG_SEQ_Recipes.currval,4,100,1);

INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,6,5,'Tin Ore',3,0,0,0.3);
INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,6,6,'Copper Ore',2,0,0,0.2);
INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,5,7,'Copper Bar',2,0,0,0.2);
INSERT INTO _TAG_Recipes VALUES (_TAG_SEQ_Recipes.NEXTVAL,'Smelter',NULL,NULL);
   INSERT INTO _TAG_Ingredients VALUES (_TAG_SEQ_Recipes.currval,6,1);
   INSERT INTO _TAG_Possible_outcomes VALUES (_TAG_SEQ_Recipes.currval,7,100,1);

INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,5,8,'Bronze Bar',3,0,0,0.3);
INSERT INTO _TAG_Recipes VALUES (_TAG_SEQ_Recipes.NEXTVAL,'Smelter',8,1);
   INSERT INTO _TAG_Ingredients VALUES (_TAG_SEQ_Recipes.currval,5,2);
   INSERT INTO _TAG_Ingredients VALUES (_TAG_SEQ_Recipes.currval,7,1);
   INSERT INTO _TAG_Possible_outcomes VALUES (_TAG_SEQ_Recipes.currval,8,100,1);

INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,5,9,'Rare Steel Bar',4,2,0,0.5);
INSERT INTO _TAG_Recipes VALUES (_TAG_SEQ_Recipes.NEXTVAL,'Smelter',29,1);
   INSERT INTO _TAG_Ingredients VALUES (_TAG_SEQ_Recipes.currval,3,2);
   INSERT INTO _TAG_Ingredients VALUES (_TAG_SEQ_Recipes.currval,8,1);
   INSERT INTO _TAG_Possible_outcomes VALUES (_TAG_SEQ_Recipes.currval,9,100,1);

INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,5,10,'Rare Titanium Steel Bar',5,2,0,0.8);
INSERT INTO _TAG_Recipes VALUES (_TAG_SEQ_Recipes.NEXTVAL,'Smelter',30,1);
   INSERT INTO _TAG_Ingredients VALUES (_TAG_SEQ_Recipes.currval,4,3);
   INSERT INTO _TAG_Ingredients VALUES (_TAG_SEQ_Recipes.currval,9,1);
   INSERT INTO _TAG_Possible_outcomes VALUES (_TAG_SEQ_Recipes.currval,10,100,1);

INSERT INTO _TAG_Abilities VALUES (1,'Energy Regain',30,'Descriere',0,NULL,NULL);
INSERT INTO _TAG_Abilities VALUES (2,'Stone Skin',45,'Descriere',0,NULL,NULL);
INSERT INTO _TAG_Abilities VALUES (3,'Block',30,'Descriere',0,NULL,NULL);
INSERT INTO _TAG_Ability_slots VALUES (1);
  INSERT INTO _TAG_List_Actives VALUES (1,1);
  INSERT INTO _TAG_List_Actives VALUES (1,2);
  INSERT INTO _TAG_List_Actives VALUES (1,3);
INSERT INTO _TAG_Abilities VALUES (4,'Toughness',0,'Descriere',0,NULL,NULL);
INSERT INTO _TAG_Abilities VALUES (5,'Authority',0,'Descriere',0,NULL,NULL);
INSERT INTO _TAG_Abilities VALUES (6,'Tenacity',0,'Descriere',0,NULL,NULL);
INSERT INTO _TAG_Passive_slots VALUES (1);
INSERT INTO _TAG_List_Passives VALUES (1,4);
INSERT INTO _TAG_List_Passives VALUES (1,5);
INSERT INTO _TAG_List_Passives VALUES (1,6);
INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,Quality,item_value,weight,Slot,Item_Power,durability,bonus_HP,bonus_energy,rezistance_magincal,rezistance_physical,rezistance_CC,type,skill_ID,skill_lvl,ability_armour,Passive_armour) VALUES (2,8,11,'Expert''s Soldier Helmet',5,0,0,0,2.5,'HEAD',800,99999,0,0,0,0,0,'plate',81,10,1,1);
INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,Quality,item_value,weight,Slot,Item_Power,durability,bonus_HP,bonus_energy,rezistance_magincal,rezistance_physical,rezistance_CC,type,skill_ID,skill_lvl,ability_armour,Passive_armour) VALUES (2,8,12,'Expert''s Soldier Helmet',5,0,1,0,2.5,'HEAD',800,99999,0,0,0,0,0,'plate',81,10,1,1);
INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,Quality,item_value,weight,Slot,Item_Power,durability,bonus_HP,bonus_energy,rezistance_magincal,rezistance_physical,rezistance_CC,type,skill_ID,skill_lvl,ability_armour,Passive_armour) VALUES (2,8,13,'Expert''s Soldier Helmet',5,0,2,0,2.5,'HEAD',800,99999,0,0,0,0,0,'plate',81,10,1,1);
INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,Quality,item_value,weight,Slot,Item_Power,durability,bonus_HP,bonus_energy,rezistance_magincal,rezistance_physical,rezistance_CC,type,skill_ID,skill_lvl,ability_armour,Passive_armour) VALUES (2,8,14,'Expert''s Soldier Helmet',5,0,3,0,2.5,'HEAD',800,99999,0,0,0,0,0,'plate',81,10,1,1);
INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,Quality,item_value,weight,Slot,Item_Power,durability,bonus_HP,bonus_energy,rezistance_magincal,rezistance_physical,rezistance_CC,type,skill_ID,skill_lvl,ability_armour,Passive_armour) VALUES (2,8,15,'Expert''s Soldier Helmet',5,0,4,0,2.5,'HEAD',800,99999,0,0,0,0,0,'plate',81,10,1,1);
INSERT INTO _TAG_Recipes VALUES (_TAG_SEQ_Recipes.NEXTVAL,'Warrior''s Forge',81,10);
   INSERT INTO _TAG_Ingredients VALUES (_TAG_SEQ_Recipes.currval,10,8);
   INSERT INTO _TAG_Possible_outcomes VALUES (_TAG_SEQ_Recipes.currval,11,68.8,1);
   INSERT INTO _TAG_Possible_outcomes VALUES (_TAG_SEQ_Recipes.currval,12,25,1);
   INSERT INTO _TAG_Possible_outcomes VALUES (_TAG_SEQ_Recipes.currval,13,5,1);
   INSERT INTO _TAG_Possible_outcomes VALUES (_TAG_SEQ_Recipes.currval,14,1.1,1);
   INSERT INTO _TAG_Possible_outcomes VALUES (_TAG_SEQ_Recipes.currval,15,0.1,1);

INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,6,16,'Titanium Ore',5,0,0,0.8);
INSERT INTO _TAG_Recipes VALUES (_TAG_SEQ_Recipes.NEXTVAL,'Smelter',NULL,NULL);
   INSERT INTO _TAG_Ingredients VALUES (_TAG_SEQ_Recipes.currval,1,1);
   INSERT INTO _TAG_Possible_outcomes VALUES (_TAG_SEQ_Recipes.currval,16,100,1);

INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,6,17,'Runite Ore',6,0,0,1.1);
INSERT INTO _TAG_Recipes VALUES (_TAG_SEQ_Recipes.NEXTVAL,'Smelter',NULL,NULL);
   INSERT INTO _TAG_Ingredients VALUES (_TAG_SEQ_Recipes.currval,16,1);
   INSERT INTO _TAG_Possible_outcomes VALUES (_TAG_SEQ_Recipes.currval,17,100,1);

INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,5,18,'Steel Bar',4,0,0,0.5);
INSERT INTO _TAG_Recipes VALUES (_TAG_SEQ_Recipes.NEXTVAL,'Smelter',29,1);
   INSERT INTO _TAG_Ingredients VALUES (_TAG_SEQ_Recipes.currval,1,2);
   INSERT INTO _TAG_Ingredients VALUES (_TAG_SEQ_Recipes.currval,8,1);
   INSERT INTO _TAG_Possible_outcomes VALUES (_TAG_SEQ_Recipes.currval,18,100,1);

INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,5,19,'Titanium Steel Bar',5,0,0,0.8);
INSERT INTO _TAG_Recipes VALUES (_TAG_SEQ_Recipes.NEXTVAL,'Smelter',30,1);
   INSERT INTO _TAG_Ingredients VALUES (_TAG_SEQ_Recipes.currval,16,3);
   INSERT INTO _TAG_Ingredients VALUES (_TAG_SEQ_Recipes.currval,18,1);
   INSERT INTO _TAG_Possible_outcomes VALUES (_TAG_SEQ_Recipes.currval,19,100,1);

INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,5,20,'Runite Steel Bar',6,0,0,1.1);
INSERT INTO _TAG_Recipes VALUES (_TAG_SEQ_Recipes.NEXTVAL,'Smelter',31,1);
   INSERT INTO _TAG_Ingredients VALUES (_TAG_SEQ_Recipes.currval,17,4);
   INSERT INTO _TAG_Ingredients VALUES (_TAG_SEQ_Recipes.currval,19,1);
   INSERT INTO _TAG_Possible_outcomes VALUES (_TAG_SEQ_Recipes.currval,20,100,1);

INSERT INTO _TAG_Abilities VALUES (7,'Mend Wounds',30,'Descriere',0,NULL,NULL);
INSERT INTO _TAG_Abilities VALUES (8,'Taunt',10,'Descriere',9,NULL,NULL);
INSERT INTO _TAG_Abilities VALUES (9,'Fury',40,'Descriere',11,NULL,NULL);
INSERT INTO _TAG_Ability_slots VALUES (2);
  INSERT INTO _TAG_List_Actives VALUES (2,7);
  INSERT INTO _TAG_List_Actives VALUES (2,8);
  INSERT INTO _TAG_List_Actives VALUES (2,9);
INSERT INTO _TAG_Abilities VALUES (10,'Toughness',0,'Descriere',0,NULL,NULL);
INSERT INTO _TAG_Abilities VALUES (11,'Authority',0,'Descriere',0,NULL,NULL);
INSERT INTO _TAG_Abilities VALUES (12,'Tenacity',0,'Descriere',0,NULL,NULL);
INSERT INTO _TAG_Passive_slots VALUES (2);
INSERT INTO _TAG_List_Passives VALUES (2,10);
INSERT INTO _TAG_List_Passives VALUES (2,11);
INSERT INTO _TAG_List_Passives VALUES (2,12);
INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,Quality,item_value,weight,Slot,Item_Power,durability,bonus_HP,bonus_energy,rezistance_magincal,rezistance_physical,rezistance_CC,type,skill_ID,skill_lvl,ability_armour,Passive_armour) VALUES (2,7,21,'Master''s Soldier Armor',6,0,0,0,7.6,'ARMOR',900,99999,0,0,112,143,0,'plate',99,30,2,2);
INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,Quality,item_value,weight,Slot,Item_Power,durability,bonus_HP,bonus_energy,rezistance_magincal,rezistance_physical,rezistance_CC,type,skill_ID,skill_lvl,ability_armour,Passive_armour) VALUES (2,7,22,'Master''s Soldier Armor',6,0,1,0,7.6,'ARMOR',900,99999,0,0,112,143,0,'plate',99,30,2,2);
INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,Quality,item_value,weight,Slot,Item_Power,durability,bonus_HP,bonus_energy,rezistance_magincal,rezistance_physical,rezistance_CC,type,skill_ID,skill_lvl,ability_armour,Passive_armour) VALUES (2,7,23,'Master''s Soldier Armor',6,0,2,0,7.6,'ARMOR',900,99999,0,0,112,143,0,'plate',99,30,2,2);
INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,Quality,item_value,weight,Slot,Item_Power,durability,bonus_HP,bonus_energy,rezistance_magincal,rezistance_physical,rezistance_CC,type,skill_ID,skill_lvl,ability_armour,Passive_armour) VALUES (2,7,24,'Master''s Soldier Armor',6,0,3,0,7.6,'ARMOR',900,99999,0,0,112,143,0,'plate',99,30,2,2);
INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,Quality,item_value,weight,Slot,Item_Power,durability,bonus_HP,bonus_energy,rezistance_magincal,rezistance_physical,rezistance_CC,type,skill_ID,skill_lvl,ability_armour,Passive_armour) VALUES (2,7,25,'Master''s Soldier Armor',6,0,4,0,7.6,'ARMOR',900,99999,0,0,112,143,0,'plate',99,30,2,2);
INSERT INTO _TAG_Recipes VALUES (_TAG_SEQ_Recipes.NEXTVAL,'Warrior''s Forge',99,30);
   INSERT INTO _TAG_Ingredients VALUES (_TAG_SEQ_Recipes.currval,20,16);
   INSERT INTO _TAG_Possible_outcomes VALUES (_TAG_SEQ_Recipes.currval,21,68.8,1);
   INSERT INTO _TAG_Possible_outcomes VALUES (_TAG_SEQ_Recipes.currval,22,25,1);
   INSERT INTO _TAG_Possible_outcomes VALUES (_TAG_SEQ_Recipes.currval,23,5,1);
   INSERT INTO _TAG_Possible_outcomes VALUES (_TAG_SEQ_Recipes.currval,24,1.1,1);
   INSERT INTO _TAG_Possible_outcomes VALUES (_TAG_SEQ_Recipes.currval,25,0.1,1);

INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,6,26,'Exceptional Iron Ore',4,3,0,0.5);
INSERT INTO _TAG_Recipes VALUES (_TAG_SEQ_Recipes.NEXTVAL,'Smelter',NULL,NULL);
   INSERT INTO _TAG_Ingredients VALUES (_TAG_SEQ_Recipes.currval,3,1);
   INSERT INTO _TAG_Possible_outcomes VALUES (_TAG_SEQ_Recipes.currval,26,100,1);

INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,5,27,'Exceptional Steel Bar',4,3,0,0.5);
INSERT INTO _TAG_Recipes VALUES (_TAG_SEQ_Recipes.NEXTVAL,'Smelter',29,1);
   INSERT INTO _TAG_Ingredients VALUES (_TAG_SEQ_Recipes.currval,26,2);
   INSERT INTO _TAG_Ingredients VALUES (_TAG_SEQ_Recipes.currval,8,1);
   INSERT INTO _TAG_Possible_outcomes VALUES (_TAG_SEQ_Recipes.currval,27,100,1);

INSERT INTO _TAG_Abilities VALUES (13,'Run',30,'Descriere',0,NULL,NULL);
INSERT INTO _TAG_Abilities VALUES (14,'Rejuvenating Sprint',30,'Descriere',0,NULL,NULL);
INSERT INTO _TAG_Abilities VALUES (15,'Shield Charge',25,'Descriere',0,NULL,NULL);
INSERT INTO _TAG_Ability_slots VALUES (3);
  INSERT INTO _TAG_List_Actives VALUES (3,13);
  INSERT INTO _TAG_List_Actives VALUES (3,14);
  INSERT INTO _TAG_List_Actives VALUES (3,15);
INSERT INTO _TAG_Abilities VALUES (16,'Courier',0,'Descriere',0,NULL,NULL);
INSERT INTO _TAG_Passive_slots VALUES (3);
INSERT INTO _TAG_List_Passives VALUES (3,16);
INSERT INTO _TAG_List_Passives VALUES (3,4);
INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,Quality,item_value,weight,Slot,Item_Power,durability,bonus_HP,bonus_energy,rezistance_magincal,rezistance_physical,rezistance_CC,type,skill_ID,skill_lvl,ability_armour,Passive_armour) VALUES (2,9,28,'Adept''s Knight Boots',4,0,0,0,1.7,'SHOES',700,99999,0,0,0,0,0,'plate',86,1,3,3);
INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,Quality,item_value,weight,Slot,Item_Power,durability,bonus_HP,bonus_energy,rezistance_magincal,rezistance_physical,rezistance_CC,type,skill_ID,skill_lvl,ability_armour,Passive_armour) VALUES (2,9,29,'Adept''s Knight Boots',4,0,1,0,1.7,'SHOES',700,99999,0,0,0,0,0,'plate',86,1,3,3);
INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,Quality,item_value,weight,Slot,Item_Power,durability,bonus_HP,bonus_energy,rezistance_magincal,rezistance_physical,rezistance_CC,type,skill_ID,skill_lvl,ability_armour,Passive_armour) VALUES (2,9,30,'Adept''s Knight Boots',4,0,2,0,1.7,'SHOES',700,99999,0,0,0,0,0,'plate',86,1,3,3);
INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,Quality,item_value,weight,Slot,Item_Power,durability,bonus_HP,bonus_energy,rezistance_magincal,rezistance_physical,rezistance_CC,type,skill_ID,skill_lvl,ability_armour,Passive_armour) VALUES (2,9,31,'Adept''s Knight Boots',4,0,3,0,1.7,'SHOES',700,99999,0,0,0,0,0,'plate',86,1,3,3);
INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,Quality,item_value,weight,Slot,Item_Power,durability,bonus_HP,bonus_energy,rezistance_magincal,rezistance_physical,rezistance_CC,type,skill_ID,skill_lvl,ability_armour,Passive_armour) VALUES (2,9,32,'Adept''s Knight Boots',4,0,4,0,1.7,'SHOES',700,99999,0,0,0,0,0,'plate',86,1,3,3);
INSERT INTO _TAG_Recipes VALUES (_TAG_SEQ_Recipes.NEXTVAL,'Warrior''s Forge',86,1);
   INSERT INTO _TAG_Ingredients VALUES (_TAG_SEQ_Recipes.currval,27,8);
   INSERT INTO _TAG_Possible_outcomes VALUES (_TAG_SEQ_Recipes.currval,28,68.8,1);
   INSERT INTO _TAG_Possible_outcomes VALUES (_TAG_SEQ_Recipes.currval,29,25,1);
   INSERT INTO _TAG_Possible_outcomes VALUES (_TAG_SEQ_Recipes.currval,30,5,1);
   INSERT INTO _TAG_Possible_outcomes VALUES (_TAG_SEQ_Recipes.currval,31,1.1,1);
   INSERT INTO _TAG_Possible_outcomes VALUES (_TAG_SEQ_Recipes.currval,32,0.1,1);

INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,2,33,'Hemp',4,0,0,0.5);
INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,2,34,'Uncommon Hemp',4,1,0,0.5);
INSERT INTO _TAG_Recipes VALUES (_TAG_SEQ_Recipes.NEXTVAL,'Weaver',NULL,NULL);
   INSERT INTO _TAG_Ingredients VALUES (_TAG_SEQ_Recipes.currval,33,1);
   INSERT INTO _TAG_Possible_outcomes VALUES (_TAG_SEQ_Recipes.currval,34,100,1);

INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,2,35,'Uncommon Skyflower',5,1,0,0.8);
INSERT INTO _TAG_Recipes VALUES (_TAG_SEQ_Recipes.NEXTVAL,'Weaver',NULL,NULL);
   INSERT INTO _TAG_Ingredients VALUES (_TAG_SEQ_Recipes.currval,34,1);
   INSERT INTO _TAG_Possible_outcomes VALUES (_TAG_SEQ_Recipes.currval,35,100,1);

INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,2,36,'Uncommon Redleaf Cotton',6,1,0,1.1);
INSERT INTO _TAG_Recipes VALUES (_TAG_SEQ_Recipes.NEXTVAL,'Weaver',NULL,NULL);
   INSERT INTO _TAG_Ingredients VALUES (_TAG_SEQ_Recipes.currval,35,1);
   INSERT INTO _TAG_Possible_outcomes VALUES (_TAG_SEQ_Recipes.currval,36,100,1);

INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,2,37,'Uncommon Sunflax',7,1,0,1.7);
INSERT INTO _TAG_Recipes VALUES (_TAG_SEQ_Recipes.NEXTVAL,'Weaver',NULL,NULL);
   INSERT INTO _TAG_Ingredients VALUES (_TAG_SEQ_Recipes.currval,36,1);
   INSERT INTO _TAG_Possible_outcomes VALUES (_TAG_SEQ_Recipes.currval,37,100,1);

INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,2,38,'Flax',3,0,0,0.3);
INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,2,39,'Cotton',2,0,0,0.2);
INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,1,40,'Simple Cloth',2,0,0,0.2);
INSERT INTO _TAG_Recipes VALUES (_TAG_SEQ_Recipes.NEXTVAL,'Weaver',NULL,NULL);
   INSERT INTO _TAG_Ingredients VALUES (_TAG_SEQ_Recipes.currval,39,1);
   INSERT INTO _TAG_Possible_outcomes VALUES (_TAG_SEQ_Recipes.currval,40,100,1);

INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,1,41,'Neat Cloth',3,0,0,0.3);
INSERT INTO _TAG_Recipes VALUES (_TAG_SEQ_Recipes.NEXTVAL,'Weaver',8,1);
   INSERT INTO _TAG_Ingredients VALUES (_TAG_SEQ_Recipes.currval,38,2);
   INSERT INTO _TAG_Ingredients VALUES (_TAG_SEQ_Recipes.currval,40,1);
   INSERT INTO _TAG_Possible_outcomes VALUES (_TAG_SEQ_Recipes.currval,41,100,1);

INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,1,42,'Uncommon Fine Cloth',4,1,0,0.5);
INSERT INTO _TAG_Recipes VALUES (_TAG_SEQ_Recipes.NEXTVAL,'Weaver',24,1);
   INSERT INTO _TAG_Ingredients VALUES (_TAG_SEQ_Recipes.currval,34,2);
   INSERT INTO _TAG_Ingredients VALUES (_TAG_SEQ_Recipes.currval,41,1);
   INSERT INTO _TAG_Possible_outcomes VALUES (_TAG_SEQ_Recipes.currval,42,100,1);

INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,1,43,'Uncommon Ornate Cloth',5,1,0,0.8);
INSERT INTO _TAG_Recipes VALUES (_TAG_SEQ_Recipes.NEXTVAL,'Weaver',25,1);
   INSERT INTO _TAG_Ingredients VALUES (_TAG_SEQ_Recipes.currval,35,3);
   INSERT INTO _TAG_Ingredients VALUES (_TAG_SEQ_Recipes.currval,42,1);
   INSERT INTO _TAG_Possible_outcomes VALUES (_TAG_SEQ_Recipes.currval,43,100,1);

INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,1,44,'Uncommon Lavish Cloth',6,1,0,1.1);
INSERT INTO _TAG_Recipes VALUES (_TAG_SEQ_Recipes.NEXTVAL,'Weaver',26,1);
   INSERT INTO _TAG_Ingredients VALUES (_TAG_SEQ_Recipes.currval,36,4);
   INSERT INTO _TAG_Ingredients VALUES (_TAG_SEQ_Recipes.currval,43,1);
   INSERT INTO _TAG_Possible_outcomes VALUES (_TAG_SEQ_Recipes.currval,44,100,1);

INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,1,45,'Uncommon Opulent Cloth',7,1,0,1.7);
INSERT INTO _TAG_Recipes VALUES (_TAG_SEQ_Recipes.NEXTVAL,'Weaver',27,1);
   INSERT INTO _TAG_Ingredients VALUES (_TAG_SEQ_Recipes.currval,37,5);
   INSERT INTO _TAG_Ingredients VALUES (_TAG_SEQ_Recipes.currval,44,1);
   INSERT INTO _TAG_Possible_outcomes VALUES (_TAG_SEQ_Recipes.currval,45,100,1);

INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,3,46,'Medium Hide',4,0,0,0.5);
INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,3,47,'Uncommon Medium Hide',4,1,0,0.5);
INSERT INTO _TAG_Recipes VALUES (_TAG_SEQ_Recipes.NEXTVAL,'Tanner',NULL,NULL);
   INSERT INTO _TAG_Ingredients VALUES (_TAG_SEQ_Recipes.currval,46,1);
   INSERT INTO _TAG_Possible_outcomes VALUES (_TAG_SEQ_Recipes.currval,47,100,1);

INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,3,48,'Uncommon Heavy Hide',5,1,0,0.8);
INSERT INTO _TAG_Recipes VALUES (_TAG_SEQ_Recipes.NEXTVAL,'Tanner',NULL,NULL);
   INSERT INTO _TAG_Ingredients VALUES (_TAG_SEQ_Recipes.currval,47,1);
   INSERT INTO _TAG_Possible_outcomes VALUES (_TAG_SEQ_Recipes.currval,48,100,1);

INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,3,49,'Uncommon Robust Hide',6,1,0,1.1);
INSERT INTO _TAG_Recipes VALUES (_TAG_SEQ_Recipes.NEXTVAL,'Tanner',NULL,NULL);
   INSERT INTO _TAG_Ingredients VALUES (_TAG_SEQ_Recipes.currval,48,1);
   INSERT INTO _TAG_Possible_outcomes VALUES (_TAG_SEQ_Recipes.currval,49,100,1);

INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,3,50,'Uncommon Thick Hide',7,1,0,1.7);
INSERT INTO _TAG_Recipes VALUES (_TAG_SEQ_Recipes.NEXTVAL,'Tanner',NULL,NULL);
   INSERT INTO _TAG_Ingredients VALUES (_TAG_SEQ_Recipes.currval,49,1);
   INSERT INTO _TAG_Possible_outcomes VALUES (_TAG_SEQ_Recipes.currval,50,100,1);

INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,3,51,'Thin Hide',3,0,0,0.3);
INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,3,52,'Rugged Hide',2,0,0,0.2);
INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,4,53,'Stiff Leather',2,0,0,0.2);
INSERT INTO _TAG_Recipes VALUES (_TAG_SEQ_Recipes.NEXTVAL,'Tanner',NULL,NULL);
   INSERT INTO _TAG_Ingredients VALUES (_TAG_SEQ_Recipes.currval,52,1);
   INSERT INTO _TAG_Possible_outcomes VALUES (_TAG_SEQ_Recipes.currval,53,100,1);

INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,4,54,'Thick Leather',3,0,0,0.3);
INSERT INTO _TAG_Recipes VALUES (_TAG_SEQ_Recipes.NEXTVAL,'Tanner',8,1);
   INSERT INTO _TAG_Ingredients VALUES (_TAG_SEQ_Recipes.currval,51,2);
   INSERT INTO _TAG_Ingredients VALUES (_TAG_SEQ_Recipes.currval,53,1);
   INSERT INTO _TAG_Possible_outcomes VALUES (_TAG_SEQ_Recipes.currval,54,100,1);

INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,4,55,'Uncommon Worked Leather',4,1,0,0.5);
INSERT INTO _TAG_Recipes VALUES (_TAG_SEQ_Recipes.NEXTVAL,'Tanner',9,1);
   INSERT INTO _TAG_Ingredients VALUES (_TAG_SEQ_Recipes.currval,47,2);
   INSERT INTO _TAG_Ingredients VALUES (_TAG_SEQ_Recipes.currval,54,1);
   INSERT INTO _TAG_Possible_outcomes VALUES (_TAG_SEQ_Recipes.currval,55,100,1);

INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,4,56,'Uncommon Cured Leather',5,1,0,0.8);
INSERT INTO _TAG_Recipes VALUES (_TAG_SEQ_Recipes.NEXTVAL,'Tanner',10,1);
   INSERT INTO _TAG_Ingredients VALUES (_TAG_SEQ_Recipes.currval,48,3);
   INSERT INTO _TAG_Ingredients VALUES (_TAG_SEQ_Recipes.currval,55,1);
   INSERT INTO _TAG_Possible_outcomes VALUES (_TAG_SEQ_Recipes.currval,56,100,1);

INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,4,57,'Uncommon Hardened Leather',6,1,0,1.1);
INSERT INTO _TAG_Recipes VALUES (_TAG_SEQ_Recipes.NEXTVAL,'Tanner',11,1);
   INSERT INTO _TAG_Ingredients VALUES (_TAG_SEQ_Recipes.currval,49,4);
   INSERT INTO _TAG_Ingredients VALUES (_TAG_SEQ_Recipes.currval,56,1);
   INSERT INTO _TAG_Possible_outcomes VALUES (_TAG_SEQ_Recipes.currval,57,100,1);

INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,4,58,'Uncommon Reinforced Leather',7,1,0,1.7);
INSERT INTO _TAG_Recipes VALUES (_TAG_SEQ_Recipes.NEXTVAL,'Tanner',12,1);
   INSERT INTO _TAG_Ingredients VALUES (_TAG_SEQ_Recipes.currval,50,5);
   INSERT INTO _TAG_Ingredients VALUES (_TAG_SEQ_Recipes.currval,57,1);
   INSERT INTO _TAG_Possible_outcomes VALUES (_TAG_SEQ_Recipes.currval,58,100,1);

INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,Quality,item_value,weight,Slot,Item_Power,durability,skill_ID,skill_lvl) VALUES (14,1,59,'Grandmaster''s Tome of Spells',7,0,0,0,5.7,'OFF',1000,999,189,60);
INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,Quality,item_value,weight,Slot,Item_Power,durability,skill_ID,skill_lvl) VALUES (14,1,60,'Grandmaster''s Tome of Spells',7,0,1,0,5.7,'OFF',1000,999,189,60);
INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,Quality,item_value,weight,Slot,Item_Power,durability,skill_ID,skill_lvl) VALUES (14,1,61,'Grandmaster''s Tome of Spells',7,0,2,0,5.7,'OFF',1000,999,189,60);
INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,Quality,item_value,weight,Slot,Item_Power,durability,skill_ID,skill_lvl) VALUES (14,1,62,'Grandmaster''s Tome of Spells',7,0,3,0,5.7,'OFF',1000,999,189,60);
INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,Quality,item_value,weight,Slot,Item_Power,durability,skill_ID,skill_lvl) VALUES (14,1,63,'Grandmaster''s Tome of Spells',7,0,4,0,5.7,'OFF',1000,999,189,60);
INSERT INTO _TAG_Recipes VALUES (_TAG_SEQ_Recipes.NEXTVAL,'Mage''s Tower',189,60);
   INSERT INTO _TAG_Ingredients VALUES (_TAG_SEQ_Recipes.currval,45,4);
   INSERT INTO _TAG_Ingredients VALUES (_TAG_SEQ_Recipes.currval,58,4);
   INSERT INTO _TAG_Possible_outcomes VALUES (_TAG_SEQ_Recipes.currval,59,68.8,1);
   INSERT INTO _TAG_Possible_outcomes VALUES (_TAG_SEQ_Recipes.currval,60,25,1);
   INSERT INTO _TAG_Possible_outcomes VALUES (_TAG_SEQ_Recipes.currval,61,5,1);
   INSERT INTO _TAG_Possible_outcomes VALUES (_TAG_SEQ_Recipes.currval,62,1.1,1);
   INSERT INTO _TAG_Possible_outcomes VALUES (_TAG_SEQ_Recipes.currval,63,0.1,1);

INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,6,64,'Meteorite Ore',7,0,0,1.7);
INSERT INTO _TAG_Recipes VALUES (_TAG_SEQ_Recipes.NEXTVAL,'Smelter',NULL,NULL);
   INSERT INTO _TAG_Ingredients VALUES (_TAG_SEQ_Recipes.currval,17,1);
   INSERT INTO _TAG_Possible_outcomes VALUES (_TAG_SEQ_Recipes.currval,64,100,1);

INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,6,65,'Adamantium Ore',8,0,0,2.6);
INSERT INTO _TAG_Recipes VALUES (_TAG_SEQ_Recipes.NEXTVAL,'Smelter',NULL,NULL);
   INSERT INTO _TAG_Ingredients VALUES (_TAG_SEQ_Recipes.currval,64,1);
   INSERT INTO _TAG_Possible_outcomes VALUES (_TAG_SEQ_Recipes.currval,65,100,1);

INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,5,66,'Meteorite Steel Bar',7,0,0,1.7);
INSERT INTO _TAG_Recipes VALUES (_TAG_SEQ_Recipes.NEXTVAL,'Smelter',32,1);
   INSERT INTO _TAG_Ingredients VALUES (_TAG_SEQ_Recipes.currval,64,5);
   INSERT INTO _TAG_Ingredients VALUES (_TAG_SEQ_Recipes.currval,20,1);
   INSERT INTO _TAG_Possible_outcomes VALUES (_TAG_SEQ_Recipes.currval,66,100,1);

INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,5,67,'Adamantium Steel Bar',8,0,0,2.6);
INSERT INTO _TAG_Recipes VALUES (_TAG_SEQ_Recipes.NEXTVAL,'Smelter',33,1);
   INSERT INTO _TAG_Ingredients VALUES (_TAG_SEQ_Recipes.currval,65,5);
   INSERT INTO _TAG_Ingredients VALUES (_TAG_SEQ_Recipes.currval,66,1);
   INSERT INTO _TAG_Possible_outcomes VALUES (_TAG_SEQ_Recipes.currval,67,100,1);

INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,3,68,'Heavy Hide',5,0,0,0.8);
INSERT INTO _TAG_Recipes VALUES (_TAG_SEQ_Recipes.NEXTVAL,'Tanner',NULL,NULL);
   INSERT INTO _TAG_Ingredients VALUES (_TAG_SEQ_Recipes.currval,46,1);
   INSERT INTO _TAG_Possible_outcomes VALUES (_TAG_SEQ_Recipes.currval,68,100,1);

INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,3,69,'Robust Hide',6,0,0,1.1);
INSERT INTO _TAG_Recipes VALUES (_TAG_SEQ_Recipes.NEXTVAL,'Tanner',NULL,NULL);
   INSERT INTO _TAG_Ingredients VALUES (_TAG_SEQ_Recipes.currval,68,1);
   INSERT INTO _TAG_Possible_outcomes VALUES (_TAG_SEQ_Recipes.currval,69,100,1);

INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,3,70,'Thick Hide',7,0,0,1.7);
INSERT INTO _TAG_Recipes VALUES (_TAG_SEQ_Recipes.NEXTVAL,'Tanner',NULL,NULL);
   INSERT INTO _TAG_Ingredients VALUES (_TAG_SEQ_Recipes.currval,69,1);
   INSERT INTO _TAG_Possible_outcomes VALUES (_TAG_SEQ_Recipes.currval,70,100,1);

INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,3,71,'Resilient Hide',8,0,0,2.6);
INSERT INTO _TAG_Recipes VALUES (_TAG_SEQ_Recipes.NEXTVAL,'Tanner',NULL,NULL);
   INSERT INTO _TAG_Ingredients VALUES (_TAG_SEQ_Recipes.currval,70,1);
   INSERT INTO _TAG_Possible_outcomes VALUES (_TAG_SEQ_Recipes.currval,71,100,1);

INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,4,72,'Worked Leather',4,0,0,0.5);
INSERT INTO _TAG_Recipes VALUES (_TAG_SEQ_Recipes.NEXTVAL,'Tanner',9,1);
   INSERT INTO _TAG_Ingredients VALUES (_TAG_SEQ_Recipes.currval,46,2);
   INSERT INTO _TAG_Ingredients VALUES (_TAG_SEQ_Recipes.currval,54,1);
   INSERT INTO _TAG_Possible_outcomes VALUES (_TAG_SEQ_Recipes.currval,72,100,1);

INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,4,73,'Cured Leather',5,0,0,0.8);
INSERT INTO _TAG_Recipes VALUES (_TAG_SEQ_Recipes.NEXTVAL,'Tanner',10,1);
   INSERT INTO _TAG_Ingredients VALUES (_TAG_SEQ_Recipes.currval,68,3);
   INSERT INTO _TAG_Ingredients VALUES (_TAG_SEQ_Recipes.currval,72,1);
   INSERT INTO _TAG_Possible_outcomes VALUES (_TAG_SEQ_Recipes.currval,73,100,1);

INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,4,74,'Hardened Leather',6,0,0,1.1);
INSERT INTO _TAG_Recipes VALUES (_TAG_SEQ_Recipes.NEXTVAL,'Tanner',11,1);
   INSERT INTO _TAG_Ingredients VALUES (_TAG_SEQ_Recipes.currval,69,4);
   INSERT INTO _TAG_Ingredients VALUES (_TAG_SEQ_Recipes.currval,73,1);
   INSERT INTO _TAG_Possible_outcomes VALUES (_TAG_SEQ_Recipes.currval,74,100,1);

INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,4,75,'Reinforced Leather',7,0,0,1.7);
INSERT INTO _TAG_Recipes VALUES (_TAG_SEQ_Recipes.NEXTVAL,'Tanner',12,1);
   INSERT INTO _TAG_Ingredients VALUES (_TAG_SEQ_Recipes.currval,70,5);
   INSERT INTO _TAG_Ingredients VALUES (_TAG_SEQ_Recipes.currval,74,1);
   INSERT INTO _TAG_Possible_outcomes VALUES (_TAG_SEQ_Recipes.currval,75,100,1);

INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,4,76,'Fortified Leather',8,0,0,2.6);
INSERT INTO _TAG_Recipes VALUES (_TAG_SEQ_Recipes.NEXTVAL,'Tanner',13,1);
   INSERT INTO _TAG_Ingredients VALUES (_TAG_SEQ_Recipes.currval,71,5);
   INSERT INTO _TAG_Ingredients VALUES (_TAG_SEQ_Recipes.currval,75,1);
   INSERT INTO _TAG_Possible_outcomes VALUES (_TAG_SEQ_Recipes.currval,76,100,1);

INSERT INTO _TAG_Abilities VALUES (17,'Heroic Strike',3,'Descriere',2,NULL,NULL);
INSERT INTO _TAG_Abilities VALUES (18,'Heroic Cleave',3,'Descriere',3,NULL,NULL);
INSERT INTO _TAG_Ability_slots VALUES (4);
  INSERT INTO _TAG_List_Actives VALUES (4,17);
  INSERT INTO _TAG_List_Actives VALUES (4,18);
INSERT INTO _TAG_Abilities VALUES (19,'Interrupt',10,'Descriere',10,NULL,NULL);
INSERT INTO _TAG_Abilities VALUES (20,'Iron Will',20,'Descriere',9,NULL,NULL);
INSERT INTO _TAG_Abilities VALUES (21,'Hamstring',10,'Descriere',10,NULL,NULL);
INSERT INTO _TAG_Abilities VALUES (22,'Splitting Slash',15,'Descriere',12,NULL,NULL);
INSERT INTO _TAG_Abilities VALUES (23,'Parry Strike',15,'Descriere',0,NULL,NULL);
INSERT INTO _TAG_Ability_slots VALUES (5);
  INSERT INTO _TAG_List_Actives VALUES (5,19);
  INSERT INTO _TAG_List_Actives VALUES (5,20);
  INSERT INTO _TAG_List_Actives VALUES (5,21);
  INSERT INTO _TAG_List_Actives VALUES (5,22);
  INSERT INTO _TAG_List_Actives VALUES (5,23);
INSERT INTO _TAG_Abilities VALUES (24,'Mighty Blow',10,'Descriere',11,NULL,NULL);
INSERT INTO _TAG_Ability_slots VALUES (6);
  INSERT INTO _TAG_List_Actives VALUES (6,24);
INSERT INTO _TAG_Abilities VALUES (25,'Deep Cuts',0,'Descriere',0,NULL,NULL);
INSERT INTO _TAG_Abilities VALUES (26,'Weakening',0,'Descriere',0,NULL,NULL);
INSERT INTO _TAG_Abilities VALUES (27,'Heroic Fighting',0,'Descriere',0,NULL,NULL);
INSERT INTO _TAG_Abilities VALUES (28,'Increased Defence',0,'Descriere',0,NULL,NULL);
INSERT INTO _TAG_Passive_slots VALUES (4);
INSERT INTO _TAG_List_Passives VALUES (4,25);
INSERT INTO _TAG_List_Passives VALUES (4,26);
INSERT INTO _TAG_List_Passives VALUES (4,27);
INSERT INTO _TAG_List_Passives VALUES (4,28);
INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,Quality,item_value,weight,Slot,Item_Power,durability,damage,dmg_type,attack_speed,skill_ID,skill_lvl,ability_Q,ability_W,ability_E,Passive_weapon) VALUES (12,7,77,'Elder''s Broadsword',8,0,0,0,25.6,'MAIN',1100,68344,45,'physical',1.0,76,100,4,5,6,4);
INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,Quality,item_value,weight,Slot,Item_Power,durability,damage,dmg_type,attack_speed,skill_ID,skill_lvl,ability_Q,ability_W,ability_E,Passive_weapon) VALUES (12,7,78,'Elder''s Broadsword',8,0,1,0,25.6,'MAIN',1100,68344,45,'physical',1.0,76,100,4,5,6,4);
INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,Quality,item_value,weight,Slot,Item_Power,durability,damage,dmg_type,attack_speed,skill_ID,skill_lvl,ability_Q,ability_W,ability_E,Passive_weapon) VALUES (12,7,79,'Elder''s Broadsword',8,0,2,0,25.6,'MAIN',1100,68344,45,'physical',1.0,76,100,4,5,6,4);
INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,Quality,item_value,weight,Slot,Item_Power,durability,damage,dmg_type,attack_speed,skill_ID,skill_lvl,ability_Q,ability_W,ability_E,Passive_weapon) VALUES (12,7,80,'Elder''s Broadsword',8,0,3,0,25.6,'MAIN',1100,68344,45,'physical',1.0,76,100,4,5,6,4);
INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,Quality,item_value,weight,Slot,Item_Power,durability,damage,dmg_type,attack_speed,skill_ID,skill_lvl,ability_Q,ability_W,ability_E,Passive_weapon) VALUES (12,7,81,'Elder''s Broadsword',8,0,4,0,25.6,'MAIN',1100,68344,45,'physical',1.0,76,100,4,5,6,4);
INSERT INTO _TAG_Recipes VALUES (_TAG_SEQ_Recipes.NEXTVAL,'Warrior''s Forge',76,100);
   INSERT INTO _TAG_Ingredients VALUES (_TAG_SEQ_Recipes.currval,67,16);
   INSERT INTO _TAG_Ingredients VALUES (_TAG_SEQ_Recipes.currval,76,8);
   INSERT INTO _TAG_Possible_outcomes VALUES (_TAG_SEQ_Recipes.currval,77,68.8,1);
   INSERT INTO _TAG_Possible_outcomes VALUES (_TAG_SEQ_Recipes.currval,78,25,1);
   INSERT INTO _TAG_Possible_outcomes VALUES (_TAG_SEQ_Recipes.currval,79,5,1);
   INSERT INTO _TAG_Possible_outcomes VALUES (_TAG_SEQ_Recipes.currval,80,1.1,1);
   INSERT INTO _TAG_Possible_outcomes VALUES (_TAG_SEQ_Recipes.currval,81,0.1,1);

INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,11,82,'Pine Logs',4,0,0,0.5);
INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,11,83,'Uncommon Pine Logs',4,1,0,0.5);
INSERT INTO _TAG_Recipes VALUES (_TAG_SEQ_Recipes.NEXTVAL,'Lumbermill',NULL,NULL);
   INSERT INTO _TAG_Ingredients VALUES (_TAG_SEQ_Recipes.currval,82,1);
   INSERT INTO _TAG_Possible_outcomes VALUES (_TAG_SEQ_Recipes.currval,83,100,1);

INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,11,84,'Rare Pine Logs',4,2,0,0.5);
INSERT INTO _TAG_Recipes VALUES (_TAG_SEQ_Recipes.NEXTVAL,'Lumbermill',NULL,NULL);
   INSERT INTO _TAG_Ingredients VALUES (_TAG_SEQ_Recipes.currval,83,1);
   INSERT INTO _TAG_Possible_outcomes VALUES (_TAG_SEQ_Recipes.currval,84,100,1);

INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,11,85,'Exceptional Pine Logs',4,3,0,0.5);
INSERT INTO _TAG_Recipes VALUES (_TAG_SEQ_Recipes.NEXTVAL,'Lumbermill',NULL,NULL);
   INSERT INTO _TAG_Ingredients VALUES (_TAG_SEQ_Recipes.currval,84,1);
   INSERT INTO _TAG_Possible_outcomes VALUES (_TAG_SEQ_Recipes.currval,85,100,1);

INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,11,86,'Exceptional Cedar Logs',5,3,0,0.8);
INSERT INTO _TAG_Recipes VALUES (_TAG_SEQ_Recipes.NEXTVAL,'Lumbermill',NULL,NULL);
   INSERT INTO _TAG_Ingredients VALUES (_TAG_SEQ_Recipes.currval,85,1);
   INSERT INTO _TAG_Possible_outcomes VALUES (_TAG_SEQ_Recipes.currval,86,100,1);

INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,11,87,'Chestnut Logs',3,0,0,0.3);
INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,11,88,'Birch Logs',2,0,0,0.2);
INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,8,89,'Birch Planks',2,0,0,0.2);
INSERT INTO _TAG_Recipes VALUES (_TAG_SEQ_Recipes.NEXTVAL,'Lumbermill',NULL,NULL);
   INSERT INTO _TAG_Ingredients VALUES (_TAG_SEQ_Recipes.currval,88,1);
   INSERT INTO _TAG_Possible_outcomes VALUES (_TAG_SEQ_Recipes.currval,89,100,1);

INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,8,90,'Chestnut Planks',3,0,0,0.3);
INSERT INTO _TAG_Recipes VALUES (_TAG_SEQ_Recipes.NEXTVAL,'Lumbermill',8,1);
   INSERT INTO _TAG_Ingredients VALUES (_TAG_SEQ_Recipes.currval,87,2);
   INSERT INTO _TAG_Ingredients VALUES (_TAG_SEQ_Recipes.currval,89,1);
   INSERT INTO _TAG_Possible_outcomes VALUES (_TAG_SEQ_Recipes.currval,90,100,1);

INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,8,91,'Exceptional Pine Planks',4,3,0,0.5);
INSERT INTO _TAG_Recipes VALUES (_TAG_SEQ_Recipes.NEXTVAL,'Lumbermill',19,1);
   INSERT INTO _TAG_Ingredients VALUES (_TAG_SEQ_Recipes.currval,85,2);
   INSERT INTO _TAG_Ingredients VALUES (_TAG_SEQ_Recipes.currval,90,1);
   INSERT INTO _TAG_Possible_outcomes VALUES (_TAG_SEQ_Recipes.currval,91,100,1);

INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,8,92,'Exceptional Cedar Planks',5,3,0,0.8);
INSERT INTO _TAG_Recipes VALUES (_TAG_SEQ_Recipes.NEXTVAL,'Lumbermill',20,1);
   INSERT INTO _TAG_Ingredients VALUES (_TAG_SEQ_Recipes.currval,86,3);
   INSERT INTO _TAG_Ingredients VALUES (_TAG_SEQ_Recipes.currval,91,1);
   INSERT INTO _TAG_Possible_outcomes VALUES (_TAG_SEQ_Recipes.currval,92,100,1);

INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,6,93,'Exceptional Titanium Ore',5,3,0,0.8);
INSERT INTO _TAG_Recipes VALUES (_TAG_SEQ_Recipes.NEXTVAL,'Smelter',NULL,NULL);
   INSERT INTO _TAG_Ingredients VALUES (_TAG_SEQ_Recipes.currval,26,1);
   INSERT INTO _TAG_Possible_outcomes VALUES (_TAG_SEQ_Recipes.currval,93,100,1);

INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,5,94,'Exceptional Titanium Steel Bar',5,3,0,0.8);
INSERT INTO _TAG_Recipes VALUES (_TAG_SEQ_Recipes.NEXTVAL,'Smelter',30,1);
   INSERT INTO _TAG_Ingredients VALUES (_TAG_SEQ_Recipes.currval,93,3);
   INSERT INTO _TAG_Ingredients VALUES (_TAG_SEQ_Recipes.currval,27,1);
   INSERT INTO _TAG_Possible_outcomes VALUES (_TAG_SEQ_Recipes.currval,94,100,1);

INSERT INTO _TAG_Abilities VALUES (29,'Fire Bolt',0,'Descriere',4,NULL,NULL);
INSERT INTO _TAG_Abilities VALUES (30,'Burning Field',4,'Descriere',6,NULL,NULL);
INSERT INTO _TAG_Ability_slots VALUES (7);
  INSERT INTO _TAG_List_Actives VALUES (7,29);
  INSERT INTO _TAG_List_Actives VALUES (7,30);
INSERT INTO _TAG_Abilities VALUES (31,'Ignite',10,'Descriere',13,NULL,NULL);
INSERT INTO _TAG_Abilities VALUES (32,'Wall of Flames',15,'Descriere',15,NULL,NULL);
INSERT INTO _TAG_Abilities VALUES (33,'Fire Wave',15,'Descriere',12,NULL,NULL);
INSERT INTO _TAG_Abilities VALUES (34,'Fire Ball',10,'Descriere',9,NULL,NULL);
INSERT INTO _TAG_Ability_slots VALUES (8);
  INSERT INTO _TAG_List_Actives VALUES (8,31);
  INSERT INTO _TAG_List_Actives VALUES (8,32);
  INSERT INTO _TAG_List_Actives VALUES (8,33);
  INSERT INTO _TAG_List_Actives VALUES (8,34);
INSERT INTO _TAG_Abilities VALUES (35,'Pyroblast',15,'Descriere',15,NULL,NULL);
INSERT INTO _TAG_Ability_slots VALUES (9);
  INSERT INTO _TAG_List_Actives VALUES (9,35);
INSERT INTO _TAG_Abilities VALUES (36,'Burn',0,'Descriere',0,NULL,NULL);
INSERT INTO _TAG_Abilities VALUES (37,'Energetic',0,'Descriere',0,NULL,NULL);
INSERT INTO _TAG_Abilities VALUES (38,'Aggressive Caster',0,'Descriere',0,NULL,NULL);
INSERT INTO _TAG_Passive_slots VALUES (5);
INSERT INTO _TAG_List_Passives VALUES (5,36);
INSERT INTO _TAG_List_Passives VALUES (5,37);
INSERT INTO _TAG_List_Passives VALUES (5,38);
INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,Quality,item_value,weight,Slot,Item_Power,durability,damage,dmg_type,attack_speed,skill_ID,skill_lvl,ability_Q,ability_W,ability_E,Passive_weapon) VALUES (10,3,95,'Expert''s Fire Staff',5,0,0,0,7.6,'MAIN',800,20250,23,'magical',1.3,164,10,7,8,9,5);
INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,Quality,item_value,weight,Slot,Item_Power,durability,damage,dmg_type,attack_speed,skill_ID,skill_lvl,ability_Q,ability_W,ability_E,Passive_weapon) VALUES (10,3,96,'Expert''s Fire Staff',5,0,1,0,7.6,'MAIN',800,20250,23,'magical',1.3,164,10,7,8,9,5);
INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,Quality,item_value,weight,Slot,Item_Power,durability,damage,dmg_type,attack_speed,skill_ID,skill_lvl,ability_Q,ability_W,ability_E,Passive_weapon) VALUES (10,3,97,'Expert''s Fire Staff',5,0,2,0,7.6,'MAIN',800,20250,23,'magical',1.3,164,10,7,8,9,5);
INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,Quality,item_value,weight,Slot,Item_Power,durability,damage,dmg_type,attack_speed,skill_ID,skill_lvl,ability_Q,ability_W,ability_E,Passive_weapon) VALUES (10,3,98,'Expert''s Fire Staff',5,0,3,0,7.6,'MAIN',800,20250,23,'magical',1.3,164,10,7,8,9,5);
INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,Quality,item_value,weight,Slot,Item_Power,durability,damage,dmg_type,attack_speed,skill_ID,skill_lvl,ability_Q,ability_W,ability_E,Passive_weapon) VALUES (10,3,99,'Expert''s Fire Staff',5,0,4,0,7.6,'MAIN',800,20250,23,'magical',1.3,164,10,7,8,9,5);
INSERT INTO _TAG_Recipes VALUES (_TAG_SEQ_Recipes.NEXTVAL,'Mage''s Tower',164,10);
   INSERT INTO _TAG_Ingredients VALUES (_TAG_SEQ_Recipes.currval,92,16);
   INSERT INTO _TAG_Ingredients VALUES (_TAG_SEQ_Recipes.currval,94,8);
   INSERT INTO _TAG_Possible_outcomes VALUES (_TAG_SEQ_Recipes.currval,95,68.8,1);
   INSERT INTO _TAG_Possible_outcomes VALUES (_TAG_SEQ_Recipes.currval,96,25,1);
   INSERT INTO _TAG_Possible_outcomes VALUES (_TAG_SEQ_Recipes.currval,97,5,1);
   INSERT INTO _TAG_Possible_outcomes VALUES (_TAG_SEQ_Recipes.currval,98,1.1,1);
   INSERT INTO _TAG_Possible_outcomes VALUES (_TAG_SEQ_Recipes.currval,99,0.1,1);

INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (16,1,100,'Master''s Ox',6,0,0,15);
INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,11,101,'Cedar Logs',5,0,0,0.8);
INSERT INTO _TAG_Recipes VALUES (_TAG_SEQ_Recipes.NEXTVAL,'Lumbermill',NULL,NULL);
   INSERT INTO _TAG_Ingredients VALUES (_TAG_SEQ_Recipes.currval,82,1);
   INSERT INTO _TAG_Possible_outcomes VALUES (_TAG_SEQ_Recipes.currval,101,100,1);

INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,11,102,'Bloodoak Logs',6,0,0,1.1);
INSERT INTO _TAG_Recipes VALUES (_TAG_SEQ_Recipes.NEXTVAL,'Lumbermill',NULL,NULL);
   INSERT INTO _TAG_Ingredients VALUES (_TAG_SEQ_Recipes.currval,101,1);
   INSERT INTO _TAG_Possible_outcomes VALUES (_TAG_SEQ_Recipes.currval,102,100,1);

INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,8,103,'Pine Planks',4,0,0,0.5);
INSERT INTO _TAG_Recipes VALUES (_TAG_SEQ_Recipes.NEXTVAL,'Lumbermill',19,1);
   INSERT INTO _TAG_Ingredients VALUES (_TAG_SEQ_Recipes.currval,82,2);
   INSERT INTO _TAG_Ingredients VALUES (_TAG_SEQ_Recipes.currval,90,1);
   INSERT INTO _TAG_Possible_outcomes VALUES (_TAG_SEQ_Recipes.currval,103,100,1);

INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,8,104,'Cedar Planks',5,0,0,0.8);
INSERT INTO _TAG_Recipes VALUES (_TAG_SEQ_Recipes.NEXTVAL,'Lumbermill',20,1);
   INSERT INTO _TAG_Ingredients VALUES (_TAG_SEQ_Recipes.currval,101,3);
   INSERT INTO _TAG_Ingredients VALUES (_TAG_SEQ_Recipes.currval,103,1);
   INSERT INTO _TAG_Possible_outcomes VALUES (_TAG_SEQ_Recipes.currval,104,100,1);

INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,8,105,'Bloodoak Planks',6,0,0,1.1);
INSERT INTO _TAG_Recipes VALUES (_TAG_SEQ_Recipes.NEXTVAL,'Lumbermill',21,1);
   INSERT INTO _TAG_Ingredients VALUES (_TAG_SEQ_Recipes.currval,102,4);
   INSERT INTO _TAG_Ingredients VALUES (_TAG_SEQ_Recipes.currval,104,1);
   INSERT INTO _TAG_Possible_outcomes VALUES (_TAG_SEQ_Recipes.currval,105,100,1);

INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,Quality,item_value,weight,Slot,Item_Power,durability,HP,normal_speed,galop_speed,Additional_weight,skill_ID,skill_lvl) VALUES (13,2,106,'Master''s Transport Ox',6,0,0,0,53.2,'MOUNT',900,9999,9999,0,0,99999,235,30);
INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,Quality,item_value,weight,Slot,Item_Power,durability,HP,normal_speed,galop_speed,Additional_weight,skill_ID,skill_lvl) VALUES (13,2,107,'Master''s Transport Ox',6,0,1,0,53.2,'MOUNT',900,9999,9999,0,0,99999,235,30);
INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,Quality,item_value,weight,Slot,Item_Power,durability,HP,normal_speed,galop_speed,Additional_weight,skill_ID,skill_lvl) VALUES (13,2,108,'Master''s Transport Ox',6,0,2,0,53.2,'MOUNT',900,9999,9999,0,0,99999,235,30);
INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,Quality,item_value,weight,Slot,Item_Power,durability,HP,normal_speed,galop_speed,Additional_weight,skill_ID,skill_lvl) VALUES (13,2,109,'Master''s Transport Ox',6,0,3,0,53.2,'MOUNT',900,9999,9999,0,0,99999,235,30);
INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,Quality,item_value,weight,Slot,Item_Power,durability,HP,normal_speed,galop_speed,Additional_weight,skill_ID,skill_lvl) VALUES (13,2,110,'Master''s Transport Ox',6,0,4,0,53.2,'MOUNT',900,9999,9999,0,0,99999,235,30);
INSERT INTO _TAG_Recipes VALUES (_TAG_SEQ_Recipes.NEXTVAL,'Saddler',235,30);
   INSERT INTO _TAG_Ingredients VALUES (_TAG_SEQ_Recipes.currval,100,1);
   INSERT INTO _TAG_Ingredients VALUES (_TAG_SEQ_Recipes.currval,105,30);
   INSERT INTO _TAG_Possible_outcomes VALUES (_TAG_SEQ_Recipes.currval,106,68.8,1);
   INSERT INTO _TAG_Possible_outcomes VALUES (_TAG_SEQ_Recipes.currval,107,25,1);
   INSERT INTO _TAG_Possible_outcomes VALUES (_TAG_SEQ_Recipes.currval,108,5,1);
   INSERT INTO _TAG_Possible_outcomes VALUES (_TAG_SEQ_Recipes.currval,109,1.1,1);
   INSERT INTO _TAG_Possible_outcomes VALUES (_TAG_SEQ_Recipes.currval,110,0.1,1);

INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,Quality,item_value,weight,Slot,Item_Power,durability,Additional_weight,skill_ID,skill_lvl) VALUES (1,1,111,'Grandmaster''s Bag',7,0,0,0,11.4,'BAG',1000,9999,999,49,60);
INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,Quality,item_value,weight,Slot,Item_Power,durability,Additional_weight,skill_ID,skill_lvl) VALUES (1,1,112,'Grandmaster''s Bag',7,0,1,0,11.4,'BAG',1000,9999,999,49,60);
INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,Quality,item_value,weight,Slot,Item_Power,durability,Additional_weight,skill_ID,skill_lvl) VALUES (1,1,113,'Grandmaster''s Bag',7,0,2,0,11.4,'BAG',1000,9999,999,49,60);
INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,Quality,item_value,weight,Slot,Item_Power,durability,Additional_weight,skill_ID,skill_lvl) VALUES (1,1,114,'Grandmaster''s Bag',7,0,3,0,11.4,'BAG',1000,9999,999,49,60);
INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,Quality,item_value,weight,Slot,Item_Power,durability,Additional_weight,skill_ID,skill_lvl) VALUES (1,1,115,'Grandmaster''s Bag',7,0,4,0,11.4,'BAG',1000,9999,999,49,60);
INSERT INTO _TAG_Recipes VALUES (_TAG_SEQ_Recipes.NEXTVAL,'Toolmaker',49,60);
   INSERT INTO _TAG_Ingredients VALUES (_TAG_SEQ_Recipes.currval,45,8);
   INSERT INTO _TAG_Ingredients VALUES (_TAG_SEQ_Recipes.currval,58,8);
   INSERT INTO _TAG_Possible_outcomes VALUES (_TAG_SEQ_Recipes.currval,111,68.8,1);
   INSERT INTO _TAG_Possible_outcomes VALUES (_TAG_SEQ_Recipes.currval,112,25,1);
   INSERT INTO _TAG_Possible_outcomes VALUES (_TAG_SEQ_Recipes.currval,113,5,1);
   INSERT INTO _TAG_Possible_outcomes VALUES (_TAG_SEQ_Recipes.currval,114,1.1,1);
   INSERT INTO _TAG_Possible_outcomes VALUES (_TAG_SEQ_Recipes.currval,115,0.1,1);

INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,1,116,'Fine Cloth',4,0,0,0.5);
INSERT INTO _TAG_Recipes VALUES (_TAG_SEQ_Recipes.NEXTVAL,'Weaver',24,1);
   INSERT INTO _TAG_Ingredients VALUES (_TAG_SEQ_Recipes.currval,33,2);
   INSERT INTO _TAG_Ingredients VALUES (_TAG_SEQ_Recipes.currval,41,1);
   INSERT INTO _TAG_Possible_outcomes VALUES (_TAG_SEQ_Recipes.currval,116,100,1);

INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,Quality,item_value,weight,Slot,Item_Power,durability,bonus_energy,energy_regen,skill_ID,skill_lvl,Passive_cape) VALUES (1,2,117,'Adept''s Cape',4,0,0,0,1.7,'CAPE',700,999,0,0,35,1,NULL);
INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,Quality,item_value,weight,Slot,Item_Power,durability,bonus_energy,energy_regen,skill_ID,skill_lvl,Passive_cape) VALUES (1,2,118,'Adept''s Cape',4,0,1,0,1.7,'CAPE',700,999,0,0,35,1,NULL);
INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,Quality,item_value,weight,Slot,Item_Power,durability,bonus_energy,energy_regen,skill_ID,skill_lvl,Passive_cape) VALUES (1,2,119,'Adept''s Cape',4,0,2,0,1.7,'CAPE',700,999,0,0,35,1,NULL);
INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,Quality,item_value,weight,Slot,Item_Power,durability,bonus_energy,energy_regen,skill_ID,skill_lvl,Passive_cape) VALUES (1,2,120,'Adept''s Cape',4,0,3,0,1.7,'CAPE',700,999,0,0,35,1,NULL);
INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,Quality,item_value,weight,Slot,Item_Power,durability,bonus_energy,energy_regen,skill_ID,skill_lvl,Passive_cape) VALUES (1,2,121,'Adept''s Cape',4,0,4,0,1.7,'CAPE',700,999,0,0,35,1,NULL);
INSERT INTO _TAG_Recipes VALUES (_TAG_SEQ_Recipes.NEXTVAL,'Toolmaker',35,1);
   INSERT INTO _TAG_Ingredients VALUES (_TAG_SEQ_Recipes.currval,116,4);
   INSERT INTO _TAG_Ingredients VALUES (_TAG_SEQ_Recipes.currval,72,4);
   INSERT INTO _TAG_Possible_outcomes VALUES (_TAG_SEQ_Recipes.currval,117,68.8,1);
   INSERT INTO _TAG_Possible_outcomes VALUES (_TAG_SEQ_Recipes.currval,118,25,1);
   INSERT INTO _TAG_Possible_outcomes VALUES (_TAG_SEQ_Recipes.currval,119,5,1);
   INSERT INTO _TAG_Possible_outcomes VALUES (_TAG_SEQ_Recipes.currval,120,1.1,1);
   INSERT INTO _TAG_Possible_outcomes VALUES (_TAG_SEQ_Recipes.currval,121,0.1,1);

INSERT INTO _TAG_Abilities VALUES (39,'Sandstorm',0,'Descriere',0,NULL,NULL);
INSERT INTO _TAG_Passive_slots VALUES (6);
INSERT INTO _TAG_List_Passives VALUES (6,39);
INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,Quality,item_value,weight,Slot,Item_Power,durability,bonus_energy,energy_regen,skill_ID,skill_lvl,Passive_cape) VALUES (1,2,122,'Adept''s Bridgewatch Cape',4,0,0,0,0.5,'CAPE',700,999,0,0,35,1,6);
INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,Quality,item_value,weight,Slot,Item_Power,durability,bonus_energy,energy_regen,skill_ID,skill_lvl,Passive_cape) VALUES (1,2,123,'Adept''s Bridgewatch Cape',4,0,1,0,0.5,'CAPE',700,999,0,0,35,1,6);
INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,Quality,item_value,weight,Slot,Item_Power,durability,bonus_energy,energy_regen,skill_ID,skill_lvl,Passive_cape) VALUES (1,2,124,'Adept''s Bridgewatch Cape',4,0,2,0,0.5,'CAPE',700,999,0,0,35,1,6);
INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,Quality,item_value,weight,Slot,Item_Power,durability,bonus_energy,energy_regen,skill_ID,skill_lvl,Passive_cape) VALUES (1,2,125,'Adept''s Bridgewatch Cape',4,0,3,0,0.5,'CAPE',700,999,0,0,35,1,6);
INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,Quality,item_value,weight,Slot,Item_Power,durability,bonus_energy,energy_regen,skill_ID,skill_lvl,Passive_cape) VALUES (1,2,126,'Adept''s Bridgewatch Cape',4,0,4,0,0.5,'CAPE',700,999,0,0,35,1,6);
INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (16,3,127,'Potatoes',6,0,0,0.6);
INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (16,3,128,'Sheaf of Wheat',3,0,0,0.6);
INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (16,2,129,'Flour',3,0,0,0.6);
INSERT INTO _TAG_Recipes VALUES (_TAG_SEQ_Recipes.NEXTVAL,'Cook',208,0);
   INSERT INTO _TAG_Ingredients VALUES (_TAG_SEQ_Recipes.currval,128,1);
   INSERT INTO _TAG_Possible_outcomes VALUES (_TAG_SEQ_Recipes.currval,129,100,1);

INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (16,2,130,'Bread',4,0,0,0.6);
INSERT INTO _TAG_Recipes VALUES (_TAG_SEQ_Recipes.NEXTVAL,'Cook',208,1);
   INSERT INTO _TAG_Ingredients VALUES (_TAG_SEQ_Recipes.currval,129,1);
   INSERT INTO _TAG_Possible_outcomes VALUES (_TAG_SEQ_Recipes.currval,130,100,1);

INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (16,1,131,'Sheep',6,0,0,15);
INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (16,3,132,'Raw Mutton',6,0,0,0.6);
INSERT INTO _TAG_Recipes VALUES (_TAG_SEQ_Recipes.NEXTVAL,'Butcher',208,30);
   INSERT INTO _TAG_Ingredients VALUES (_TAG_SEQ_Recipes.currval,131,1);
   INSERT INTO _TAG_Possible_outcomes VALUES (_TAG_SEQ_Recipes.currval,132,100,20);

INSERT INTO _TAG_Abilities VALUES (40,'Mutton Stew',0,'Descriere',0,NULL,NULL);
INSERT INTO _TAG_Ability_slots VALUES (10);
  INSERT INTO _TAG_List_Actives VALUES (10,40);
INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight,nutrition,ability_food) VALUES (5,1,133,'Mutton Stew',6,0,0,3.97,999,10);
INSERT INTO _TAG_Recipes VALUES (_TAG_SEQ_Recipes.NEXTVAL,'Cook',208,30);
   INSERT INTO _TAG_Ingredients VALUES (_TAG_SEQ_Recipes.currval,127,12);
   INSERT INTO _TAG_Ingredients VALUES (_TAG_SEQ_Recipes.currval,130,12);
   INSERT INTO _TAG_Ingredients VALUES (_TAG_SEQ_Recipes.currval,132,24);
   INSERT INTO _TAG_Possible_outcomes VALUES (_TAG_SEQ_Recipes.currval,133,100,10);

INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (16,3,134,'Crenellated Burdock',4,0,0,0.6);
INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (16,3,135,'Brightleaf Comfrey',3,0,0,0.6);
INSERT INTO _TAG_Abilities VALUES (41,'Minor Poison Potion',60,'Descriere',0,NULL,NULL);
INSERT INTO _TAG_Ability_slots VALUES (11);
  INSERT INTO _TAG_List_Actives VALUES (11,41);
INSERT INTO _TAG_Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight,ability_potion) VALUES (5,6,136,'Minor Poison Potion',4,0,0,0.17,11);
INSERT INTO _TAG_Recipes VALUES (_TAG_SEQ_Recipes.NEXTVAL,'Alchemist''s Lab',199,1);
   INSERT INTO _TAG_Ingredients VALUES (_TAG_SEQ_Recipes.currval,134,8);
   INSERT INTO _TAG_Ingredients VALUES (_TAG_SEQ_Recipes.currval,135,4);
   INSERT INTO _TAG_Possible_outcomes VALUES (_TAG_SEQ_Recipes.currval,136,100,5);

