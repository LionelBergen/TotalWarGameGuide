DROP DATABASE IF EXISTS total_war_info;

CREATE DATABASE total_war_info;
\c total_war_info;

CREATE TABLE public."PlayableHero" (
    "Name" TEXT NOT NULL,
	"Damage" NUMERIC NOT NULL,
	"DamageDelay" NUMERIC NOT NULL,
	"HP" NUMERIC NOT NULL,
	"Rarity" INTEGER NOT NULL,
	"Specialty" TEXT NOT NULL
);

INSERT INTO public."PlayableHero"("Name", "Damage", "DamageDelay", "HP", "Rarity", "Specialty")
	VALUES ('Frost', 10.01, 2, 90, 1, 'Shooter');


