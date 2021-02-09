DROP DATABASE IF EXISTS total_war_info;

CREATE DATABASE total_war_info;
\c total_war_info;

CREATE TABLE public."Hero" (
	"DAMAGE0" NUMERIC NOT NULL, 
	"DAMAGEA" NUMERIC NOT NULL, 
	"DAMAGEDELAY" NUMERIC NOT NULL, 
	"MAXHP0" NUMERIC NOT NULL, 
	"MAXHPA" NUMERIC NOT NULL, 
	"MAXSTEP" NUMERIC NOT NULL,
	"SPEC0" NUMERIC NOT NULL, 
	"SPECA" NUMERIC NOT NULL, 
	"SPECB" NUMERIC NULL,
	"SPECDELAY" NUMERIC NOT NULL,
	"SPEED0" NUMERIC NOT NULL, 
	"SPEEDA" NUMERIC NOT NULL,
	"actualSpeed" NUMERIC NOT NULL, 
	"animationAttack" TEXT NOT NULL, 
	"animationBlinking" TEXT NOT NULL, 
	"animationDamage" TEXT NOT NULL, 
	"animationDying" TEXT NOT NULL,
	"animationIdle" TEXT NOT NULL, 
	"animationSpec" TEXT NOT NULL, 
	"animationTaunt" TEXT NOT NULL, 
	"animationWalking" TEXT NOT NULL, 
	"attackType" TEXT NOT NULL, 
	"attackDamage" NUMERIC NOT NULL, 
	"attackDelay" NUMERIC NOT NULL,
	"maxHp" NUMERIC NOT NULL, 
	"maxLevel" NUMERIC NOT NULL, 
	"rarity" NUMERIC NOT NULL,  
	"specType" TEXT NOT NULL, 
	"specValue" NUMERIC NULL,
	"specialty" TEXT NOT NULL, 
	"speed" NUMERIC NOT NULL, 
	"type" TEXT NOT NULL
);

CREATE VIEW "PlayableHero" AS SELECT "type" AS Name, "rarity" AS Rarity, "specialty" AS Specialty, "maxHp" AS HP, "DAMAGE0" AS MeleeDamage, "MAXSTEP" AS MaxStep, "SPEC0" AS Spec0, "SPECA" AS SpecA, "SPECB" as SpecB,
	"SPECDELAY" AS SpecDelay, "specType" AS SpecType, "DAMAGEA" AS DamageA, "DAMAGEDELAY" AS MeleeDelay, "SPEED0" AS Speed, "MAXHPA" AS MaxHPA
	FROM "Hero" WHERE "maxLevel" <= 5;


/* 
const allUnits = document.getElementById('html-game-frame').contentWindow.allGameData.UnitFactory.getHeroTypes();

for(var i=0; i<allUnits.length; i++) { 
    let unit = document.getElementById('html-game-frame').contentWindow.allGameData.Player.instance.getUnit(allUnits[i]);
	if (unit.maxLevel <= 5) {
	  const SQL = `INSERT INTO public."Hero"(`
	     + `"DAMAGE0", "DAMAGEA", "DAMAGEDELAY", "MAXHP0", "MAXHPA", "MAXSTEP", "SPEC0", "SPECA", "SPECB", "SPEED0", "SPEEDA", `
		 + `"actualSpeed", "animationAttack", "animationBlinking", "animationDamage", "animationDying", "animationIdle", "animationSpec", "animationTaunt", `
		 + `"animationWalking", "attackType", "attackDamage", "attackDelay", "maxHp", "maxLevel", "rarity", "specDelay", `
		 + `"specType", "specValue", "specialty", "speed", "type"`
		 + `) `
		 + `VALUES(${unit.DAMAGE0}, ${unit.DAMAGEA}, ${unit.DAMAGEDELAY}, ${unit.MAXHP0}, ${unit.MAXHPA}, ${unit.MAXSTEP}, ${unit.SPEC0}, ${unit.SPECA}, ${isNaN(unit.SPECB) ? null : unit.SPECB}, ${unit.SPECDELAY}, ${unit.SPEED0}, ${unit.SPEEDA}, `
		 + `${unit.actualSpeed}, '${unit.animationAttack}', '${unit.animationBlinking}', '${unit.animationDamage}', '${unit.animationDying}', '${unit.animationIdle}', '${unit.animationSpec}', '${unit.animationTaunt}', `
		 + `'${unit.animationWalking}', '${unit.attack.type}', ${unit.attack.value}, ${unit.attack.delay}, ${unit.maxHP.value}, ${unit.maxLevel}, ${unit.rarity}, ${unit.spec.delay}, `
		 + `'${unit.spec.type}', ${unit.spec.value}, '${unit.specialty}', ${unit.speed.value}, '${unit.type}'`
		 + `);`;
	  console.log(SQL);
	}
}
*/

INSERT INTO public."Hero"("DAMAGE0", "DAMAGEA", "DAMAGEDELAY", "MAXHP0", "MAXHPA", "MAXSTEP", "SPEC0", "SPECA", "SPECB", "SPECDELAY", "SPEED0", "SPEEDA", "actualSpeed", "animationAttack", "animationBlinking", "animationDamage", "animationDying", "animationIdle", "animationSpec", "animationTaunt", "animationWalking", "attackType", "attackDamage", "attackDelay", "maxHp", "maxLevel", "rarity", "specType", "specValue", "specialty", "speed", "type") VALUES(12, 0.1, 2.6, 200, 0.1, 10, 12, 0.1, 0.82, 5, 2.3, 4.6, -1, 'Attacking', 'Idle Blink', 'Hurt', 'Dying', 'Idle', 'Attacking', 'Taunt', 'Walking', 'Kick', 12, 2.6, 200, 5, 1, 'Breaking', 12, 'Warrior', 2.3, 'IronHeart');
INSERT INTO public."Hero"("DAMAGE0", "DAMAGEA", "DAMAGEDELAY", "MAXHP0", "MAXHPA", "MAXSTEP", "SPEC0", "SPECA", "SPECB", "SPECDELAY", "SPEED0", "SPEEDA", "actualSpeed", "animationAttack", "animationBlinking", "animationDamage", "animationDying", "animationIdle", "animationSpec", "animationTaunt", "animationWalking", "attackType", "attackDamage", "attackDelay", "maxHp", "maxLevel", "rarity", "specType", "specValue", "specialty", "speed", "type") VALUES(18, 0.1, 2, 90, 0.1, 10, 14.5, 0.1, null, 4.2, 4, 8, -1, 'Attacking', 'Idle Blinking', 'Hurt', 'Dying', 'Idle', 'Attacking', 'Taunt', 'Walking', 'Kick', 18, 2, 90, 5, 1, 'DoubleHit', 14.5, 'Warrior', 4, 'Assassin');
INSERT INTO public."Hero"("DAMAGE0", "DAMAGEA", "DAMAGEDELAY", "MAXHP0", "MAXHPA", "MAXSTEP", "SPEC0", "SPECA", "SPECB", "SPECDELAY", "SPEED0", "SPEEDA", "actualSpeed", "animationAttack", "animationBlinking", "animationDamage", "animationDying", "animationIdle", "animationSpec", "animationTaunt", "animationWalking", "attackType", "attackDamage", "attackDelay", "maxHp", "maxLevel", "rarity", "specType", "specValue", "specialty", "speed", "type") VALUES(10, 0.1, 2, 90, 0.1, 10, 30, 1.5, 500, 3.5, 3, 6, -1, 'Taunt', 'Idle Blinking', 'Hurt', 'Dying', 'Idle', 'Shooting', 'Taunt', 'Walking', 'Kick', 10, 2, 90, 5, 1, 'FrostArrow', 30, 'Shooter', 3, 'Frost');
INSERT INTO public."Hero"("DAMAGE0", "DAMAGEA", "DAMAGEDELAY", "MAXHP0", "MAXHPA", "MAXSTEP", "SPEC0", "SPECA", "SPECB", "SPECDELAY", "SPEED0", "SPEEDA", "actualSpeed", "animationAttack", "animationBlinking", "animationDamage", "animationDying", "animationIdle", "animationSpec", "animationTaunt", "animationWalking", "attackType", "attackDamage", "attackDelay", "maxHp", "maxLevel", "rarity", "specType", "specValue", "specialty", "speed", "type") VALUES(22, 0.1, 2, 80, 0.1, 10, 46, 0.1, null, 4, 3, 6, -1, 'Attacking', 'Idle Blink', 'Hurt', 'Dying', 'Idle', 'Taunt', 'Taunt', 'Walking', 'Kick', 22, 2, 80, 5, 1, 'Heal', 46, 'Mage', 3, 'WitcherGreen');
INSERT INTO public."Hero"("DAMAGE0", "DAMAGEA", "DAMAGEDELAY", "MAXHP0", "MAXHPA", "MAXSTEP", "SPEC0", "SPECA", "SPECB", "SPECDELAY", "SPEED0", "SPEEDA", "actualSpeed", "animationAttack", "animationBlinking", "animationDamage", "animationDying", "animationIdle", "animationSpec", "animationTaunt", "animationWalking", "attackType", "attackDamage", "attackDelay", "maxHp", "maxLevel", "rarity", "specType", "specValue", "specialty", "speed", "type") VALUES(6, 0.1, 2, 80, 0.1, 10, 25, 8, 2, 4, 2.3, 4.6, -1, 'Casting Spells', 'Idle Blinking', 'Hurt', 'Dying', 'Idle', 'Taunt', 'Taunt', 'Walking', 'Kick', 6, 2, 80, 5, 1, 'Raise', 25, 'Mage', 2.3, 'Priest');
INSERT INTO public."Hero"("DAMAGE0", "DAMAGEA", "DAMAGEDELAY", "MAXHP0", "MAXHPA", "MAXSTEP", "SPEC0", "SPECA", "SPECB", "SPECDELAY", "SPEED0", "SPEEDA", "actualSpeed", "animationAttack", "animationBlinking", "animationDamage", "animationDying", "animationIdle", "animationSpec", "animationTaunt", "animationWalking", "attackType", "attackDamage", "attackDelay", "maxHp", "maxLevel", "rarity", "specType", "specValue", "specialty", "speed", "type") VALUES(10, 0.1, 2, 90, 0.1, 10, 32, 0.1, 532, 2.8, 3, 6, -1, 'Taunt', 'Idle Blinking', 'Hurt', 'Dying', 'Idle', 'Shooting', 'Taunt', 'Walking', 'Kick', 10, 2, 90, 5, 1, 'Shoot', 32, 'Shooter', 3, 'Elf');
INSERT INTO public."Hero"("DAMAGE0", "DAMAGEA", "DAMAGEDELAY", "MAXHP0", "MAXHPA", "MAXSTEP", "SPEC0", "SPECA", "SPECB", "SPECDELAY", "SPEED0", "SPEEDA", "actualSpeed", "animationAttack", "animationBlinking", "animationDamage", "animationDying", "animationIdle", "animationSpec", "animationTaunt", "animationWalking", "attackType", "attackDamage", "attackDelay", "maxHp", "maxLevel", "rarity", "specType", "specValue", "specialty", "speed", "type") VALUES(12, 0.1, 2, 95, 0.1, 10, 40, 0.1, 540, 3.7, 3, 6, -1, 'Taunt', 'Idle Blinking', 'Hurt', 'Dying', 'Idle', 'Shooting', 'Taunt', 'Walking', 'Kick', 12, 2, 95, 5, 1, 'Shoot', 40, 'Shooter', 3, 'Archer');
INSERT INTO public."Hero"("DAMAGE0", "DAMAGEA", "DAMAGEDELAY", "MAXHP0", "MAXHPA", "MAXSTEP", "SPEC0", "SPECA", "SPECB", "SPECDELAY", "SPEED0", "SPEEDA", "actualSpeed", "animationAttack", "animationBlinking", "animationDamage", "animationDying", "animationIdle", "animationSpec", "animationTaunt", "animationWalking", "attackType", "attackDamage", "attackDelay", "maxHp", "maxLevel", "rarity", "specType", "specValue", "specialty", "speed", "type") VALUES(16, 0.1, 2.5, 180, 0.1, 10, 20, 0.1, 0.6, 4.5, 2.3, 4.6, -1, 'Attacking', 'Idle Blink', 'Hurt', 'Dying', 'Idle', 'Attacking', 'Taunt', 'Walking', 'Kick', 16, 2.5, 180, 5, 1, 'Stun', 20, 'Warrior', 2.3, 'Knight');
INSERT INTO public."Hero"("DAMAGE0", "DAMAGEA", "DAMAGEDELAY", "MAXHP0", "MAXHPA", "MAXSTEP", "SPEC0", "SPECA", "SPECB", "SPECDELAY", "SPEED0", "SPEEDA", "actualSpeed", "animationAttack", "animationBlinking", "animationDamage", "animationDying", "animationIdle", "animationSpec", "animationTaunt", "animationWalking", "attackType", "attackDamage", "attackDelay", "maxHp", "maxLevel", "rarity", "specType", "specValue", "specialty", "speed", "type") VALUES(18, 0.1, 2, 80, 0.1, 10, 50, 0.09, 2, 4, 2.3, 4.6, -1, 'Casting Spells', 'Idle Blinking', 'Hurt', 'Dying', 'Idle', 'Taunt', 'Taunt', 'Walking', 'Kick', 18, 2, 80, 5, 1, 'Aura', 50, 'Mage', 2.3, 'Druid');
INSERT INTO public."Hero"("DAMAGE0", "DAMAGEA", "DAMAGEDELAY", "MAXHP0", "MAXHPA", "MAXSTEP", "SPEC0", "SPECA", "SPECB", "SPECDELAY", "SPEED0", "SPEEDA", "actualSpeed", "animationAttack", "animationBlinking", "animationDamage", "animationDying", "animationIdle", "animationSpec", "animationTaunt", "animationWalking", "attackType", "attackDamage", "attackDelay", "maxHp", "maxLevel", "rarity", "specType", "specValue", "specialty", "speed", "type") VALUES(8, 0.1, 2, 80, 0.1, 10, 36, 0.1, 510, 3.1, 3, 6, -1, 'Attacking', 'Idle Blink', 'Hurt', 'Dying', 'Idle', 'Taunt', 'Taunt', 'Walking', 'Kick', 8, 2, 80, 5, 2, 'Fireball', 36, 'Mage', 3, 'WitcherRed');
INSERT INTO public."Hero"("DAMAGE0", "DAMAGEA", "DAMAGEDELAY", "MAXHP0", "MAXHPA", "MAXSTEP", "SPEC0", "SPECA", "SPECB", "SPECDELAY", "SPEED0", "SPEEDA", "actualSpeed", "animationAttack", "animationBlinking", "animationDamage", "animationDying", "animationIdle", "animationSpec", "animationTaunt", "animationWalking", "attackType", "attackDamage", "attackDelay", "maxHp", "maxLevel", "rarity", "specType", "specValue", "specialty", "speed", "type") VALUES(12, 0.1, 2, 120, 0.1, 10, 12, 0.1, 1.9, 4.5, 3, 6, -1, 'Attacking', 'Idle Blinking', 'Hurt', 'Dying', 'Idle', 'Attacking', 'Taunt', 'Walking', 'Kick', 12, 2, 120, 5, 2, 'Freeze', 12, 'Warrior', 3, 'Subzero');
INSERT INTO public."Hero"("DAMAGE0", "DAMAGEA", "DAMAGEDELAY", "MAXHP0", "MAXHPA", "MAXSTEP", "SPEC0", "SPECA", "SPECB", "SPECDELAY", "SPEED0", "SPEEDA", "actualSpeed", "animationAttack", "animationBlinking", "animationDamage", "animationDying", "animationIdle", "animationSpec", "animationTaunt", "animationWalking", "attackType", "attackDamage", "attackDelay", "maxHp", "maxLevel", "rarity", "specType", "specValue", "specialty", "speed", "type") VALUES(20, 0.096, 2, 100, 0.1, 10, 32, 0.096, 100, 4, 3, 6, -1, 'Attacking', 'Idle Blinking', 'Hurt', 'Dying', 'Idle', 'Shooting', 'Taunt', 'Walking', 'Kick', 20, 2, 100, 5, 2, 'HailOfArrows', 32, 'Shooter', 3, 'Hunter');
INSERT INTO public."Hero"("DAMAGE0", "DAMAGEA", "DAMAGEDELAY", "MAXHP0", "MAXHPA", "MAXSTEP", "SPEC0", "SPECA", "SPECB", "SPECDELAY", "SPEED0", "SPEEDA", "actualSpeed", "animationAttack", "animationBlinking", "animationDamage", "animationDying", "animationIdle", "animationSpec", "animationTaunt", "animationWalking", "attackType", "attackDamage", "attackDelay", "maxHp", "maxLevel", "rarity", "specType", "specValue", "specialty", "speed", "type") VALUES(24, 0.1, 2, 75, 0.1, 10, 48, 0.1, null, 4, 3, 6, -1, 'Casting Spells', 'Idle Blinking', 'Hurt', 'Dying', 'Idle', 'Healing', 'Taunt', 'Moving Forward', 'Kick', 24.72, 2, 88.5, 5, 2, 'Heal', 48, 'Mage', 3, 'Fairy');
INSERT INTO public."Hero"("DAMAGE0", "DAMAGEA", "DAMAGEDELAY", "MAXHP0", "MAXHPA", "MAXSTEP", "SPEC0", "SPECA", "SPECB", "SPECDELAY", "SPEED0", "SPEEDA", "actualSpeed", "animationAttack", "animationBlinking", "animationDamage", "animationDying", "animationIdle", "animationSpec", "animationTaunt", "animationWalking", "attackType", "attackDamage", "attackDelay", "maxHp", "maxLevel", "rarity", "specType", "specValue", "specialty", "speed", "type") VALUES(22, 0.0983, 2, 120, 0.1, 10, 1.1, 2, null, 6, 3, 6, -1, 'Attacking', 'Idle Blinking', 'Hurt', 'Dying', 'Idle', 'Taunt', 'Taunt', 'Walking', 'Kick', 22, 2, 120, 5, 2, 'Invisibility', 1.1, 'Warrior', 3, 'Dwarf');
INSERT INTO public."Hero"("DAMAGE0", "DAMAGEA", "DAMAGEDELAY", "MAXHP0", "MAXHPA", "MAXSTEP", "SPEC0", "SPECA", "SPECB", "SPECDELAY", "SPEED0", "SPEEDA", "actualSpeed", "animationAttack", "animationBlinking", "animationDamage", "animationDying", "animationIdle", "animationSpec", "animationTaunt", "animationWalking", "attackType", "attackDamage", "attackDelay", "maxHp", "maxLevel", "rarity", "specType", "specValue", "specialty", "speed", "type") VALUES(24, 0.0983, 2, 120, 0.1, 10, 1.1, 1, null, 4, 4, 8, -1, 'Attacking', 'Idle Blinking', 'Hurt', 'Dying', 'Idle', 'Attacking', 'Taunt', 'Walking', 'Kick', 24, 2, 120, 5, 2, 'Revealing', 1.1, 'Warrior', 4, 'Stalker');
INSERT INTO public."Hero"("DAMAGE0", "DAMAGEA", "DAMAGEDELAY", "MAXHP0", "MAXHPA", "MAXSTEP", "SPEC0", "SPECA", "SPECB", "SPECDELAY", "SPEED0", "SPEEDA", "actualSpeed", "animationAttack", "animationBlinking", "animationDamage", "animationDying", "animationIdle", "animationSpec", "animationTaunt", "animationWalking", "attackType", "attackDamage", "attackDelay", "maxHp", "maxLevel", "rarity", "specType", "specValue", "specialty", "speed", "type") VALUES(14, 0.1, 2.2, 140, 0.1, 10, 15, 0.1, 0.8, 3.9, 3, 6, -1, 'Attacking', 'Idle Blink', 'Hurt', 'Dying', 'Idle', 'Attacking', 'Taunt', 'Walking', 'Kick', 14, 2.2, 140, 5, 2, 'Stun', 15, 'Warrior', 3, 'Viking');
INSERT INTO public."Hero"("DAMAGE0", "DAMAGEA", "DAMAGEDELAY", "MAXHP0", "MAXHPA", "MAXSTEP", "SPEC0", "SPECA", "SPECB", "SPECDELAY", "SPEED0", "SPEEDA", "actualSpeed", "animationAttack", "animationBlinking", "animationDamage", "animationDying", "animationIdle", "animationSpec", "animationTaunt", "animationWalking", "attackType", "attackDamage", "attackDelay", "maxHp", "maxLevel", "rarity", "specType", "specValue", "specialty", "speed", "type") VALUES(24, 0.1, 2, 75, 0.1, 10, 10, 0.1, null, 4.5, 3, 6, -1, 'Casting Spells', 'Idle Blinking', 'Hurt', 'Dying', 'Idle', 'Healing', 'Taunt', 'Moving Forward', 'Kick', 24, 2, 75, 5, 2, 'Swap', 10, 'Mage', 3, 'Princess');
INSERT INTO public."Hero"("DAMAGE0", "DAMAGEA", "DAMAGEDELAY", "MAXHP0", "MAXHPA", "MAXSTEP", "SPEC0", "SPECA", "SPECB", "SPECDELAY", "SPEED0", "SPEEDA", "actualSpeed", "animationAttack", "animationBlinking", "animationDamage", "animationDying", "animationIdle", "animationSpec", "animationTaunt", "animationWalking", "attackType", "attackDamage", "attackDelay", "maxHp", "maxLevel", "rarity", "specType", "specValue", "specialty", "speed", "type") VALUES(10, 0.1, 2, 90, 0.1, 10, 20, 0.1, 1000, 4, 3, 6, -1, 'Attacking', 'Idle Blinking', 'Hurt', 'Dying', 'Idle', 'Shooting', 'Taunt', 'Walking', 'Kick', 10, 2, 90, 5, 2, 'WildArrow', 20, 'Shooter', 3, 'GreenArrow');
INSERT INTO public."Hero"("DAMAGE0", "DAMAGEA", "DAMAGEDELAY", "MAXHP0", "MAXHPA", "MAXSTEP", "SPEC0", "SPECA", "SPECB", "SPECDELAY", "SPEED0", "SPEEDA", "actualSpeed", "animationAttack", "animationBlinking", "animationDamage", "animationDying", "animationIdle", "animationSpec", "animationTaunt", "animationWalking", "attackType", "attackDamage", "attackDelay", "maxHp", "maxLevel", "rarity", "specType", "specValue", "specialty", "speed", "type") VALUES(24, 0.096, 2, 120, 0.1, 10, 1.05, 1, null, 5.4, 3, 6, -1, 'Attacking', 'Idle Blink', 'Hurt', 'Dying', 'Idle', 'Taunt', 'Taunt', 'Walking', 'Kick', 24, 2, 120, 5, 3, 'BattleCry', 1.05, 'Warrior', 3, 'Konung');
INSERT INTO public."Hero"("DAMAGE0", "DAMAGEA", "DAMAGEDELAY", "MAXHP0", "MAXHPA", "MAXSTEP", "SPEC0", "SPECA", "SPECB", "SPECDELAY", "SPEED0", "SPEEDA", "actualSpeed", "animationAttack", "animationBlinking", "animationDamage", "animationDying", "animationIdle", "animationSpec", "animationTaunt", "animationWalking", "attackType", "attackDamage", "attackDelay", "maxHp", "maxLevel", "rarity", "specType", "specValue", "specialty", "speed", "type") VALUES(6, 0.0937, 2, 75, 0.0937, 10, 2, 4, null, 4.57, 3, 6, -1, 'Casting Spells', 'Idle Blinking', 'Hurt', 'Dying', 'Idle', 'Healing', 'Taunt', 'Moving Forward', 'Kick', 6, 2, 75, 5, 3, 'Hypno', null, 'Mage', 3, 'Charmer');
INSERT INTO public."Hero"("DAMAGE0", "DAMAGEA", "DAMAGEDELAY", "MAXHP0", "MAXHPA", "MAXSTEP", "SPEC0", "SPECA", "SPECB", "SPECDELAY", "SPEED0", "SPEEDA", "actualSpeed", "animationAttack", "animationBlinking", "animationDamage", "animationDying", "animationIdle", "animationSpec", "animationTaunt", "animationWalking", "attackType", "attackDamage", "attackDelay", "maxHp", "maxLevel", "rarity", "specType", "specValue", "specialty", "speed", "type") VALUES(8, 0.1, 2, 80, 0.1, 10, 36, 0.1, 510, 3.1, 3, 6, -1, 'Attacking', 'Idle Blink', 'Hurt', 'Dying', 'Idle', 'Taunt', 'Taunt', 'Walking', 'Kick', 8, 2, 80, 5, 3, 'Light', 36, 'Mage', 3, 'WitcherBlue');
INSERT INTO public."Hero"("DAMAGE0", "DAMAGEA", "DAMAGEDELAY", "MAXHP0", "MAXHPA", "MAXSTEP", "SPEC0", "SPECA", "SPECB", "SPECDELAY", "SPEED0", "SPEEDA", "actualSpeed", "animationAttack", "animationBlinking", "animationDamage", "animationDying", "animationIdle", "animationSpec", "animationTaunt", "animationWalking", "attackType", "attackDamage", "attackDelay", "maxHp", "maxLevel", "rarity", "specType", "specValue", "specialty", "speed", "type") VALUES(24, 0.099, 2, 141, 0.1, 10, 1.1, 1.3, null, 4, 3, 6, -1, 'Attacking', 'Idle Blink', 'Hurt', 'Dying', 'Idle', 'Taunt', 'Taunt', 'Walking', 'Kick', 24, 2, 141, 5, 3, 'Motivation', 1.1, 'Warrior', 3, 'Commander');
INSERT INTO public."Hero"("DAMAGE0", "DAMAGEA", "DAMAGEDELAY", "MAXHP0", "MAXHPA", "MAXSTEP", "SPEC0", "SPECA", "SPECB", "SPECDELAY", "SPEED0", "SPEEDA", "actualSpeed", "animationAttack", "animationBlinking", "animationDamage", "animationDying", "animationIdle", "animationSpec", "animationTaunt", "animationWalking", "attackType", "attackDamage", "attackDelay", "maxHp", "maxLevel", "rarity", "specType", "specValue", "specialty", "speed", "type") VALUES(24, 0.0962, 2, 116, 0.1, 10, 1.1, 1.52, null, 4, 3, 6, -1, 'Attacking', 'Idle Blink', 'Hurt', 'Dying', 'Idle', 'Taunt', 'Taunt', 'Walking', 'Kick', 24, 2, 116, 5, 3, 'MotivationAll', 1.1, 'Warrior', 3, 'King');
INSERT INTO public."Hero"("DAMAGE0", "DAMAGEA", "DAMAGEDELAY", "MAXHP0", "MAXHPA", "MAXSTEP", "SPEC0", "SPECA", "SPECB", "SPECDELAY", "SPEED0", "SPEEDA", "actualSpeed", "animationAttack", "animationBlinking", "animationDamage", "animationDying", "animationIdle", "animationSpec", "animationTaunt", "animationWalking", "attackType", "attackDamage", "attackDelay", "maxHp", "maxLevel", "rarity", "specType", "specValue", "specialty", "speed", "type") VALUES(24, 0.099, 2, 141, 0.1, 10, 1.1, 1.3, null, 4, 3, 6, -1, 'Attacking', 'Idle Blink', 'Hurt', 'Dying', 'Idle', 'Taunt', 'Taunt', 'Walking', 'Kick', 24, 2, 141, 5, 3, 'Rage', 1.1, 'Warrior', 3, 'Berserk');
INSERT INTO public."Hero"("DAMAGE0", "DAMAGEA", "DAMAGEDELAY", "MAXHP0", "MAXHPA", "MAXSTEP", "SPEC0", "SPECA", "SPECB", "SPECDELAY", "SPEED0", "SPEEDA", "actualSpeed", "animationAttack", "animationBlinking", "animationDamage", "animationDying", "animationIdle", "animationSpec", "animationTaunt", "animationWalking", "attackType", "attackDamage", "attackDelay", "maxHp", "maxLevel", "rarity", "specType", "specValue", "specialty", "speed", "type") VALUES(12, 0.1, 2.5, 140, 0.1, 10, 36, 0.1, 455, 4.5, 2.3, 4.6, -1, 'Taunt', 'Idle Blinking', 'Hurt', 'Dying', 'Idle', 'Shooting', 'Taunt', 'Walking', 'Kick', 12, 2.5, 140, 5, 3, 'Shoot', 36, 'Shooter', 2.3, 'Arbalist');
INSERT INTO public."Hero"("DAMAGE0", "DAMAGEA", "DAMAGEDELAY", "MAXHP0", "MAXHPA", "MAXSTEP", "SPEC0", "SPECA", "SPECB", "SPECDELAY", "SPEED0", "SPEEDA", "actualSpeed", "animationAttack", "animationBlinking", "animationDamage", "animationDying", "animationIdle", "animationSpec", "animationTaunt", "animationWalking", "attackType", "attackDamage", "attackDelay", "maxHp", "maxLevel", "rarity", "specType", "specValue", "specialty", "speed", "type") VALUES(12, 0.1, 2, 100, 0.1, 10, 12, 0.1, 0.65, 4, 4, 8, -1, 'Attacking', 'Idle Blinking', 'Hurt', 'Dying', 'Idle', 'Attacking', 'Taunt', 'Walking', 'Kick', 12, 2, 100, 5, 3, 'StunCircle', 12, 'Warrior', 4, 'Barbarian');
INSERT INTO public."Hero"("DAMAGE0", "DAMAGEA", "DAMAGEDELAY", "MAXHP0", "MAXHPA", "MAXSTEP", "SPEC0", "SPECA", "SPECB", "SPECDELAY", "SPEED0", "SPEEDA", "actualSpeed", "animationAttack", "animationBlinking", "animationDamage", "animationDying", "animationIdle", "animationSpec", "animationTaunt", "animationWalking", "attackType", "attackDamage", "attackDelay", "maxHp", "maxLevel", "rarity", "specType", "specValue", "specialty", "speed", "type") VALUES(12.5, 0.1, 2.5, 140, 0.1, 10, 12.5, 0.1, 0.75, 4.4, 3, 6, -1, 'Attacking', 'Idle Blink', 'Hurt', 'Dying', 'Idle', 'Attacking', 'Taunt', 'Walking', 'Kick', 12.5, 2.5, 140, 5, 3, 'StunCircle', 12.5, 'Warrior', 3, 'Warrior');
INSERT INTO public."Hero"("DAMAGE0", "DAMAGEA", "DAMAGEDELAY", "MAXHP0", "MAXHPA", "MAXSTEP", "SPEC0", "SPECA", "SPECB", "SPECDELAY", "SPEED0", "SPEEDA", "actualSpeed", "animationAttack", "animationBlinking", "animationDamage", "animationDying", "animationIdle", "animationSpec", "animationTaunt", "animationWalking", "attackType", "attackDamage", "attackDelay", "maxHp", "maxLevel", "rarity", "specType", "specValue", "specialty", "speed", "type") VALUES(18, 0.1, 2, 90, 0.1, 10, 12.5, 0.1, 70, 4, 4, 8, -1, 'Attacking', 'Idle Blinking', 'Hurt', 'Dying', 'Idle', 'Attacking', 'Taunt', 'Walking', 'Kick', 18, 2, 90, 5, 3, 'Toxic', 12.5, 'Warrior', 4, 'Poisoner');
INSERT INTO public."Hero"("DAMAGE0", "DAMAGEA", "DAMAGEDELAY", "MAXHP0", "MAXHPA", "MAXSTEP", "SPEC0", "SPECA", "SPECB", "SPECDELAY", "SPEED0", "SPEEDA", "actualSpeed", "animationAttack", "animationBlinking", "animationDamage", "animationDying", "animationIdle", "animationSpec", "animationTaunt", "animationWalking", "attackType", "attackDamage", "attackDelay", "maxHp", "maxLevel", "rarity", "specType", "specValue", "specialty", "speed", "type") VALUES(20, 0.1, 2, 75, 0.095, 10, 24, 1.5, 100, 4, 3, 6, -1, 'Attacking', 'Idle Blinking', 'Hurt', 'Dying', 'Idle', 'Attacking', 'Taunt', 'Walking', 'Kick', 20, 2, 75, 5, 3, 'Hailstorm', 24, 'Shooter', 3, 'Snowman');
INSERT INTO public."Hero"("DAMAGE0", "DAMAGEA", "DAMAGEDELAY", "MAXHP0", "MAXHPA", "MAXSTEP", "SPEC0", "SPECA", "SPECB", "SPECDELAY", "SPEED0", "SPEEDA", "actualSpeed", "animationAttack", "animationBlinking", "animationDamage", "animationDying", "animationIdle", "animationSpec", "animationTaunt", "animationWalking", "attackType", "attackDamage", "attackDelay", "maxHp", "maxLevel", "rarity", "specType", "specValue", "specialty", "speed", "type") VALUES(22, 0.0983, 2, 120, 0.1, 10, 1.1, 2, null, 6, 3, 6, -1, 'Attacking', 'Idle Blinking', 'Hurt', 'Dying', 'Idle', 'Taunt', 'Taunt', 'Walking', 'Kick', 22, 2, 120, 5, 2, 'Invisibility', 1.1, 'Warrior', 3, 'EvilDwarf');
INSERT INTO public."Hero"("DAMAGE0", "DAMAGEA", "DAMAGEDELAY", "MAXHP0", "MAXHPA", "MAXSTEP", "SPEC0", "SPECA", "SPECB", "SPECDELAY", "SPEED0", "SPEEDA", "actualSpeed", "animationAttack", "animationBlinking", "animationDamage", "animationDying", "animationIdle", "animationSpec", "animationTaunt", "animationWalking", "attackType", "attackDamage", "attackDelay", "maxHp", "maxLevel", "rarity", "specType", "specValue", "specialty", "speed", "type") VALUES(10, 0.1, 2, 90, 0.1, 10, 20, 0.1, 1000, 3.1, 3, 6, -1, 'Attacking', 'Idle Blinking', 'Hurt', 'Dying', 'Idle', 'Shooting', 'Taunt', 'Walking', 'Kick', 10, 2, 90, 5, 3, 'WildArrow', 20, 'Shooter', 3, 'Rogue');

CREATE TABLE public."Artifact" (
	"aD" NUMERIC NOT NULL, 
	"aH" NUMERIC NOT NULL, 
	"aS" NUMERIC NOT NULL, 
	"id" TEXT NOT NULL, 
	"level" NUMERIC NOT NULL, 
	"mDPS" NUMERIC NOT NULL,
	"mHP" NUMERIC NOT NULL, 
	"mSPEC" NUMERIC NOT NULL, 
	"rarity" NUMERIC NULL,
	"slots" TEXT NOT NULL,
	"specialties" TEXT NOT NULL, 
	"type" TEXT NOT NULL
);

CREATE VIEW "WearableArtifact" AS SELECT "aD" AS meleeDamage, "aH" AS HP, "aS" AS spec, "id" AS name, "level" AS level, "rarity" AS rarity, "slots" AS slots, "specialties" AS specialties, 
		"type" as type
	FROM "Artifact";


/*
let specialties = ['Warrior', 'Mage', 'Shooter'];
let allBoosters = [];

for (var i=0; i<specialties.length; i++) {
	let boostersI = document.getElementById('html-game-frame').contentWindow.allGameData.Boosters.instance.getBoosterBySpecialty(specialties[i]);
	allBoosters = allBoosters.concat(boostersI);
}

allBoosters = allBoosters.filter((v, i, a) => a.indexOf(v) === i);

for (var i=0; i<allBoosters.length; i++) {
  let booster = allBoosters[i];
  console.log(`INSERT INTO public."Artifact"("aD", "aH", "aS", "id", "level", "mDPS", "mHP", "mSPEC", "rarity", "slots", "specialties", "type") VALUES('${booster.aD}', '${booster.aH}', '${booster.aS}', '${booster.id}', '${booster.level}', '${booster.mDPS}', '${booster.mHP}', '${booster.mSPEC}', '${booster.rarity}', '${booster.slots}', '${booster.specialties}', '${booster.type}');`);
}
*/

INSERT INTO public."Artifact"("aD", "aH", "aS", "id", "level", "mDPS", "mHP", "mSPEC", "rarity", "slots", "specialties", "type") VALUES('0.12', '0.08', '0.1', 'Ring', '0', '1', '1', '1', '1', '', 'Warrior,Shooter,Mage', 'all');
INSERT INTO public."Artifact"("aD", "aH", "aS", "id", "level", "mDPS", "mHP", "mSPEC", "rarity", "slots", "specialties", "type") VALUES('0.06', '0.16', '0.01', 'Amulet', '0', '1', '1', '1', '1', '', 'Warrior,Shooter,Mage', 'all');
INSERT INTO public."Artifact"("aD", "aH", "aS", "id", "level", "mDPS", "mHP", "mSPEC", "rarity", "slots", "specialties", "type") VALUES('0.15', '0.11', '0.01', 'Potion', '0', '1', '1', '1', '1', '', 'Warrior,Shooter,Mage', 'all');
INSERT INTO public."Artifact"("aD", "aH", "aS", "id", "level", "mDPS", "mHP", "mSPEC", "rarity", "slots", "specialties", "type") VALUES('0.02', '0.19', '0', 'MagicAmulet', '0', '1', '1', '1', '1', '', 'Warrior,Shooter,Mage', 'all');
INSERT INTO public."Artifact"("aD", "aH", "aS", "id", "level", "mDPS", "mHP", "mSPEC", "rarity", "slots", "specialties", "type") VALUES('0.08', '0.11', '0.08', 'MagicPotion', '0', '1', '1', '1', '1', '', 'Warrior,Shooter,Mage', 'all');
INSERT INTO public."Artifact"("aD", "aH", "aS", "id", "level", "mDPS", "mHP", "mSPEC", "rarity", "slots", "specialties", "type") VALUES('0', '0.2', '0', 'MagicCloack', '0', '1', '1', '1', '1', 'Back', 'Warrior,Shooter,Mage', 'all');
INSERT INTO public."Artifact"("aD", "aH", "aS", "id", "level", "mDPS", "mHP", "mSPEC", "rarity", "slots", "specialties", "type") VALUES('0.12', '0', '0.28', 'WhetStone', '0', '1', '1', '1', '1', '', 'Warrior,Shooter', 'dps');
INSERT INTO public."Artifact"("aD", "aH", "aS", "id", "level", "mDPS", "mHP", "mSPEC", "rarity", "slots", "specialties", "type") VALUES('0.23', '0', '0.17', 'Sword', '0', '1', '1', '1', '1', 'Hand1', 'Warrior', 'dps');
INSERT INTO public."Artifact"("aD", "aH", "aS", "id", "level", "mDPS", "mHP", "mSPEC", "rarity", "slots", "specialties", "type") VALUES('0.16', '0', '0.24', 'CrystalAmulet', '0', '1', '1', '1', '1', '', 'Warrior,Shooter,Mage', 'dps');
INSERT INTO public."Artifact"("aD", "aH", "aS", "id", "level", "mDPS", "mHP", "mSPEC", "rarity", "slots", "specialties", "type") VALUES('0.33', '0', '0.07', 'CrystalRing', '0', '1', '1', '1', '1', '', 'Warrior,Shooter,Mage', 'dps');
INSERT INTO public."Artifact"("aD", "aH", "aS", "id", "level", "mDPS", "mHP", "mSPEC", "rarity", "slots", "specialties", "type") VALUES('0.12', '0', '0.28', 'MagicRing', '0', '1', '1', '1', '1', '', 'Warrior,Shooter,Mage', 'dps');
INSERT INTO public."Artifact"("aD", "aH", "aS", "id", "level", "mDPS", "mHP", "mSPEC", "rarity", "slots", "specialties", "type") VALUES('0', '0.2', '0', 'MagicBoots', '0', '1', '1', '1', '1', 'Feet', 'Warrior,Shooter,Mage', 'hp');
INSERT INTO public."Artifact"("aD", "aH", "aS", "id", "level", "mDPS", "mHP", "mSPEC", "rarity", "slots", "specialties", "type") VALUES('0', '0.2', '0', 'Helmet', '0', '1', '1', '1', '1', 'Head', 'Warrior,Shooter,Mage', 'hp');
INSERT INTO public."Artifact"("aD", "aH", "aS", "id", "level", "mDPS", "mHP", "mSPEC", "rarity", "slots", "specialties", "type") VALUES('0', '0.2', '0', 'Bracers', '0', '1', '1', '1', '1', 'Hands', 'Warrior,Shooter,Mage', 'hp');
INSERT INTO public."Artifact"("aD", "aH", "aS", "id", "level", "mDPS", "mHP", "mSPEC", "rarity", "slots", "specialties", "type") VALUES('0', '0.2', '0', 'HighBoots', '0', '1', '1', '1', '1', 'Feet', 'Warrior,Shooter,Mage', 'hp');
INSERT INTO public."Artifact"("aD", "aH", "aS", "id", "level", "mDPS", "mHP", "mSPEC", "rarity", "slots", "specialties", "type") VALUES('0', '0.2', '0', 'Armor', '0', '1', '1', '1', '1', 'Body', 'Warrior,Shooter,Mage', 'hp');
INSERT INTO public."Artifact"("aD", "aH", "aS", "id", "level", "mDPS", "mHP", "mSPEC", "rarity", "slots", "specialties", "type") VALUES('0', '0.2', '0', 'Shield', '0', '1', '1', '1', '1', 'Hand2', 'Warrior,Mage', 'hp');
INSERT INTO public."Artifact"("aD", "aH", "aS", "id", "level", "mDPS", "mHP", "mSPEC", "rarity", "slots", "specialties", "type") VALUES('0', '0.2', '0', 'HealPotion', '0', '1', '1', '1', '1', '', 'Warrior,Shooter,Mage', 'hp');
INSERT INTO public."Artifact"("aD", "aH", "aS", "id", "level", "mDPS", "mHP", "mSPEC", "rarity", "slots", "specialties", "type") VALUES('0.31', '0', '0.09', 'DragonPotion', '0', '1', '1', '1', '1', '', 'Warrior', 'dps');
INSERT INTO public."Artifact"("aD", "aH", "aS", "id", "level", "mDPS", "mHP", "mSPEC", "rarity", "slots", "specialties", "type") VALUES('0.18', '0.01', '0.2', 'Crystal', '0', '1', '1', '1', '1', '', 'Warrior,Shooter,Mage', 'all');
INSERT INTO public."Artifact"("aD", "aH", "aS", "id", "level", "mDPS", "mHP", "mSPEC", "rarity", "slots", "specialties", "type") VALUES('0.32', '0', '0.08', 'Poison', '0', '1', '1', '1', '1', '', 'Warrior,Shooter', 'dps');
INSERT INTO public."Artifact"("aD", "aH", "aS", "id", "level", "mDPS", "mHP", "mSPEC", "rarity", "slots", "specialties", "type") VALUES('0', '0.15', '0.09', 'MagicBall', '0', '1', '1', '1', '1', 'Hand1', 'Mage', 'all');
INSERT INTO public."Artifact"("aD", "aH", "aS", "id", "level", "mDPS", "mHP", "mSPEC", "rarity", "slots", "specialties", "type") VALUES('0.31', '0.01', '0.07', 'RuneBook', '0', '1', '1', '1', '1', '', 'Mage', 'all');
INSERT INTO public."Artifact"("aD", "aH", "aS", "id", "level", "mDPS", "mHP", "mSPEC", "rarity", "slots", "specialties", "type") VALUES('0.06', '0.16', '0.01', 'MagicBook', '0', '1', '1', '1', '1', '', 'Mage', 'all');
INSERT INTO public."Artifact"("aD", "aH", "aS", "id", "level", "mDPS", "mHP", "mSPEC", "rarity", "slots", "specialties", "type") VALUES('0.36', '0', '0.04', 'MagicStaff', '0', '1', '1', '1', '1', 'Hand1', 'Mage', 'dps');
INSERT INTO public."Artifact"("aD", "aH", "aS", "id", "level", "mDPS", "mHP", "mSPEC", "rarity", "slots", "specialties", "type") VALUES('0.29', '0', '0.11', 'ManaPotion', '0', '1', '1', '1', '1', '', 'Mage', 'dps');
INSERT INTO public."Artifact"("aD", "aH", "aS", "id", "level", "mDPS", "mHP", "mSPEC", "rarity", "slots", "specialties", "type") VALUES('0.27', '0', '0.13', 'Bow', '0', '1', '1', '1', '1', 'Hand1,Hand2', 'Shooter', 'dps');
INSERT INTO public."Artifact"("aD", "aH", "aS", "id", "level", "mDPS", "mHP", "mSPEC", "rarity", "slots", "specialties", "type") VALUES('0.18', '0', '0.22', 'Arrow', '0', '1', '1', '1', '1', '', 'Shooter', 'dps');
INSERT INTO public."Artifact"("aD", "aH", "aS", "id", "level", "mDPS", "mHP", "mSPEC", "rarity", "slots", "specialties", "type") VALUES('0.3', '0', '0.1', 'Quiver', '0', '1', '1', '1', '1', '', 'Shooter', 'dps');







