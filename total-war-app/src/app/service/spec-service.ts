import { Spec } from '../models/spec';

interface textInfo {
    text: string,
    specNames: Array<string>
}

export function getSpecInfo(spec : Spec) {
  const specName = spec.name;
  const text = getTextOfSpec(spec);

  if (["Stun", "StunCircle", "Breaking"].includes(specName)) {
      const maxDamage = getShortNumber(getLevelExpCurve(60, 10, spec.maxstep, spec.spec0, spec.speca));

      return replaceInfoText(text, spec.spec0, maxDamage, spec.specb, spec.delay);
  } else if (['Shoot', 'Light', 'Fireball', 'Snowball', 'TrapLight', 'TrapFire'].includes(specName)) {
    const maxDamage = getShortNumber(getLevelExpCurve(60, 10, spec.maxstep, spec.spec0, spec.speca));

    return replaceInfoText(text, spec.spec0, maxDamage, spec.specb, getMaxShootR(spec), spec.delay);
  } else if (['WildArrow'].includes(specName)) {
    const maxDamage = getShortNumber(getLevelExpCurve(60, 10, spec.maxstep, spec.spec0, spec.speca));

    return replaceInfoText(text, spec.spec0, maxDamage, spec.delay);
  } else if (['FrostArrow'].includes(specName)) {
    const maxDamage = getShortNumber(getMaxFrostArrowDamage(spec));

    return replaceInfoText(text, spec.spec0, maxDamage, spec.specb, getMaxShootR(spec), spec.speca, spec.delay);
  } else if (['DoubleHit'].includes(specName)) {
    const maxDamage = getShortNumber(getMaxDoubleHitDamage(spec));

    return replaceInfoText(text, spec.spec0, maxDamage, spec.delay);
  } else if (['Hypno'].includes(specName)) {
    return replaceInfoText(text, spec.spec0, spec.speca, spec.delay);
  } else if (['Freeze'].includes(specName)) {
    const maxDamage = getShortNumber(getMaxFreezeDamage(spec));

    return replaceInfoText(text, spec.spec0, maxDamage, spec.specb, getMaxShootR(spec), spec.speca, spec.delay);
  } else if (['Toxic'].includes(specName)) {
    const maxDamage = getShortNumber(getMaxToxicDamage(spec));

    return replaceInfoText(text, spec.spec0, maxDamage, 3 * getToxicTime(spec), spec.specb, getMaxShootR(spec), spec.delay);
  } else if (['Heal', 'HealAll', 'Swap'].includes(specName)) {
    const maxDamage = getShortNumber(getMaxHealValue(spec));

    return replaceInfoText(text, spec.spec0, maxDamage, spec.delay);
  } else if (['Motivation', 'MotivationAll', 'Rage', 'BattleCry', 'Invisibility', 'Revealing'].includes(specName)) {
    const maxDamage = getShortNumber(getMaxMotivationMultiplier(spec));

    return replaceInfoText(text, spec.spec0, maxDamage, spec.speca, getMaxMotivationTime(spec), spec.delay);
  } else if (['Raise'].includes(specName)) {
    const maxDamage = getShortNumber(getMaxRaiseMaxHP(spec), 1);

    return replaceInfoText(text, spec.spec0, maxDamage, spec.speca, getShortNumber(getMaxRaiseDamage(spec), 1), spec.specb, spec.delay);
  } else if (['Aura'].includes(specName)) {
    const maxDamage = getShortNumber(getMaxHealValue(spec))

    return replaceInfoText(text, spec.spec0, maxDamage, 10, 100, spec.specb, spec.delay);
  } else if (['HailOfArrows'].includes(specName)) {
    const maxDamage = getShortNumber(getMaxShootDamage(spec))

    return replaceInfoText(text, spec.spec0, maxDamage, spec.specb, getShortNumber(getMaxHailOfArrowsR(spec)), spec.delay);
  } else if (['Hailstorm'].includes(specName)) {
    const maxDamage = getShortNumber(getMaxFrostArrowDamage(spec))

    return replaceInfoText(text, spec.spec0, maxDamage, spec.specb, getShortNumber(getMaxHailOfArrowsR(spec)), spec.speca, spec.delay);
  }

  throw 'unknown spec type: ' + specName;
}

function getMaxShootR(spec : Spec) {
  return getLevelLinear(60, 10, spec.maxstep, spec.specb, 2 * spec.specb);
}

 function replaceInfoText(...args: any[]) {
     let text = args[0];

     for (var i=1; i<args.length; i++) {
         text = text.replace("$VAR$", "<span class='number'>" + args[i] + "</span>");
     }

     return text;
 }

 function getLevelExpCurve(a :number, b :number, c :number, d :number, e :number, g:boolean = true) {
    a = d * Math.exp(e * getS(a, b, c));
    return g ? Math.round(a) : a;
 }

 function getS(a, b, c, d = 0.25) {
    return ((a - 1) * (c + 1) + b) * d;
 }

function getShortNumber(a, b = 0) {
    for (var c = 0; 1e3 <= a; ) ++c, (a /= 1e3);
    0 == b && 0 < c && (10 > a ? (b = 2) : 100 > a && (b = 1));
    a = null == a ? "null" : "" + a;
    var d = a.indexOf("."),
      e = a;
    -1 < d && ((e = a.substring(0, d)), 0 < b && (e += a.substring(d, d + 1 + b)));
    return e + " K M B T a b c d e f g h i j k l m n".split(" ")[c];
};

function getLevelLinear(a, b, c, d, e, g = true) {
  return getLinear(d, e, getS(a, b, c), getMaxS(), g);
};

function getLinear(a, b, c, d, e = true) {
  a += ((b - a) * c) / d;
  return e ? Math.round(a) : a;
};

function getMaxS(a = 0.25) {
  return getS(60, 10, 10, a);
};

function getMaxFrostArrowDamage(spec :Spec) {
  return getLevelExpCurve(60, 10, spec.maxstep, spec.spec0, spec.damagea);
};

function getMaxDoubleHitDamage(spec :Spec) {
  return getLevelExpCurve(60, 10, spec.maxstep, spec.spec0, spec.speca);
};

function getMaxFreezeDamage(spec :Spec) {
  return getLevelExpCurve(60, 10, spec.maxstep, spec.spec0, spec.speca);
};

function getMaxToxicDamage(spec :Spec) {
  return getLevelExpCurve(60, 10, spec.maxstep, spec.spec0, spec.speca);
};

function getMaxHealValue(spec :Spec) {
  return getLevelExpCurve(60, 10, spec.maxstep, spec.spec0, spec.speca);
}

function getMaxMotivationMultiplier(spec: Spec) {
  return 1 + getLevelLinear(60, 10, spec.maxstep, spec.spec0 - 1, 2 * (spec.spec0 - 1));
};

function getMaxMotivationTime(spec: Spec) {
  return getLevelLinear(60, 10, spec.maxstep, spec.speca, 2 * spec.speca);
};

function getMaxRaiseMaxHP(spec :Spec) {
  return getLevelExpCurve(60, 10, spec.maxstep, spec.spec0, spec.maxhpa);
};

function getMaxRaiseDamage(spec: Spec) {
  return getLevelExpCurve(60, 10, spec.maxstep, spec.speca, spec.damagea);
};

function getMaxShootDamage(spec: Spec) {
  return getLevelExpCurve(60, 10, spec.maxstep, spec.spec0, spec.speca);
};

function getMaxHailOfArrowsR(spec: Spec) {
  return getLevelLinear(60, 10, spec.maxstep, spec.specb, 3 * spec.specb);
};

function getToxicTime(spec :Spec) {
  return 1;
}

function getTextOfSpec(spec :Spec) {
  switch(spec.name) {
    case 'Stun':
      return "<p>Throws back and stuns an opponent<br><br>Base damage $VAR$</p><p>Max damage $VAR$ (without artifacts)</p><p>Duration of stunning $VAR$ sec</p><p>Cooldown $VAR$ sec</p>";
    case 'StunCircle':
      return "<p>Throws back and stuns everyone within a circle<br><br>Base damage $VAR$</p><p>Max damage $VAR$ (without artifacts)</p><p>Duration of stunning $VAR$ sec</p><p>Cooldown $VAR$ sec</p>";
    case 'Breaking':
      return "<p>Breaks the enemy's line within a swift pounce. Throws back and stuns everyone on a way<br><br>Base damage $VAR$</p><p>Max damage $VAR$ (without artifacts)</p><p>Duration of stunning $VAR$ sec</p><p>Cooldown $VAR$ sec</p>";
    case 'Shoot':
      return "<p>Base damage $VAR$</p><p>Max damage $VAR$ (without artifacts)</p><p>Base range $VAR$</p><p>Max range $VAR$</p><p>Cooldown $VAR$ sec</p>";
    case 'Light':
      return "<p>Affects everyone at the point of impact</p><p></p><p>Base damage $VAR$</p><p>Max damage $VAR$ (without artifacts)</p><p>Base range $VAR$</p><p>Max range $VAR$</p><p>Cooldown $VAR$ sec.</p>";
    case 'Fireball':
      return "<p>Base damage $VAR$</p><p>Max damage $VAR$ (without artifacts)</p><p>Base range $VAR$</p><p>Max range $VAR$</p><p>Cooldown $VAR$ sec.</p>";
    case 'Snowball':
      return "<p>Base damage $VAR$</p><p>Max damage $VAR$ (without artifacts)</p><p>Base range $VAR$</p><p>Max range $VAR$</p><p>Cooldown $VAR$ sec</p>";
    case 'TrapLight':
      return "<p>Affects everyone with lightning within a circle</p><p></p><p>Base damage $VAR$</p><p>Max damage $VAR$</p><p>Base range $VAR$</p><p>Max range $VAR$</p>";
    case 'TrapFire':
      return "<p>Affects everyone with fire within a circle</p><p></p><p>Base damage $VAR$</p><p>Max damage $VAR$</p><p>Base range $VAR$</p><p>Max range $VAR$</p>";
    case 'Motivation':
      return "<p>Increases outgoing damage and decreases incoming damage to an ally</p><p>Base multiplier $VAR$</p><p>Max multiplier $VAR$ (without artifacts)</p><p>Base duration $VAR$ sec</p><p>Max duration $VAR$ sec</p><p>Cooldown $VAR$ sec</p>";
    case 'MotivationAll':
      return "<p>Increases outgoing damage and decreases incoming damage to all allies</p><p>Base multiplier $VAR$</p><p>Max multiplier $VAR$ (without artifacts)</p><p>Base duration $VAR$ sec</p><p>Max duration $VAR$ sec</p><p>Cooldown $VAR$ sec</p>";
    case 'WildArrow':
      return "<p>Flies to the edge of the arena and pierces all enemies on its way</p><p></p><p>Base damage $VAR$</p><p>Max damage $VAR$ (without artifacts)</p><p>Cooldown $VAR$ sec</p>"
    case 'FrostArrow':
      return "<p>Freezes an opponent</p><p></p><p>Base damage $VAR$</p><p>Max damage $VAR$ (without artifacts)</p><p>Base range $VAR$</p><p>Max range $VAR$</p><p>Affects $VAR$ sec</p><p>Cooldown $VAR$ sec</p>"
    case 'DoubleHit':
      return "<p>Base damage per hit $VAR$</p><p>Max damage per hit $VAR$ (without artifacts)</p><p>Colldown $VAR$ sec</p>"
    case 'Hypno':
      return "<p>The opponent switches sides under hypnosis</p><p></p><p>Base duration $VAR$ sec</p><p>Max duration $VAR$ sec (without artifacts)</p><p>Cooldown $VAR$ sec</p>"
    case 'Freeze':
      return "<p>Freezes an opponent</p><p></p><p>Base damage $VAR$ sec</p><p>Max damage $VAR$ (without artifacts)</p><p>Affects $VAR$ sec</p><p>Cooldown $VAR$ sec</p>"
    case 'Toxic':
      return "<p>Infects an opponent</p><p></p><p>Base damage per sec $VAR$</p><p>Max damage per sec $VAR$ (without artifacts)</p><p>Duration $VAR$ sec</p><p>Base range $VAR$</p><p>Max range $VAR$</p><p>Cooldown $VAR$ sec</p>"
    case 'Heal':
      return "<p>Heals an ally</p><p></p><p>Basic value $VAR$</p><p>Max value $VAR$ (without artifacts)</p><p>Cooldown $VAR$ sec</p>"
    case 'HealAll':
      return "<p>Heals all allies</p><p></p><p>Basic value $VAR$</p><p>Max value $VAR$ (without artifacts)</p><p>Cooldown $VAR$ sec</p>"
    case 'Swap':
      return "<p>Transfers a portion of health from an opponent to an ally. If the opponent is the extreme right in the arena he and the random warrior ally will be swapped in places</p><p></p><p>Basic vampirism (transfered health) $VAR$</p><p>Max vampirism $VAR$ (without artifacts)</p><p>Cooldown $VAR$ sec</p>"
    case 'Rage':
      return "<p>Increases outgoing damage and decreases incoming damage</p><p></p><p>Base multiplier $VAR$</p><p>Max multiplier $VAR$ (without artifacts)</p><p>Base duration $VAR$ sec</p><p>Max duration $VAR$ sec</p><p>Cooldown $VAR$ sec</p>"
    case 'BattleCry':
      return "<p>Motivates all allies and demotivates all opponents. Opponents retreat during the duration of the demotivation.</p><p></p><p>Base multiplier of motivation and demotivation $VAR$</p><p>Max $VAR$ multiplier (without artifacts)</p><p>Duration $VAR$ sec</p><p>Max duration $VAR$ sec</p><p>Colldown $VAR$ sec</p>"
    case 'Invisibility':
      return "<p>Becomes invisible and runs to the nearest long-range opponent. Outgoing damage will increase for the affectance duration.</p><p></p><p>Base multiplier $VAR$</p><p>Max $VAR$ multiplier (without artifacts)</p><p>Base duration $VAR$ sec</p><p>Max duration $VAR$ sec</p><p>Cooldown $VAR$ sec</p>"
    case 'Revealing':
      return "<p>Reveales and demotivates the nearest invisible opponent. Opponents retreat during the duration of the demotivation.</p><p></p><p>Base multiplier of demotivation $VAR$</p><p>Max $VAR$ multiplier (without artifacts)</p><p>Duration $VAR$ sec</p><p>Max duration $VAR$ sec</p><p>Colldown $VAR$ sec</p>"
    case 'Raise':
      return "<p>Raises a skeleton in place of a fallen hero</p><p></p><p>Base HP of skeleton $VAR$</p><p>Max HP $VAR$ (without artifacts)</p><p>Base damage of skeleton $VAR$</p><p>Max damage $VAR$ (without artifacts)</p><p>Skeleton attack cooldown $VAR$ sec</p><p>Cooldown $VAR$ sec</p>"
    case 'Aura':
      return "<p>Heals an ally and reduces incoming damage</p><p></p><p>Basic healing $VAR$</p><p>Max healing $VAR$ (without artifacts)</p><p>Basic damage reduction $VAR$%</p><p>Max damage reduction $VAR$%</p><p>Duration $VAR$ sec</p><p>Cooldown $VAR$ sec</p>"
    case 'HailOfArrows':
      return "<p>Hits all enemies within a circle</p><p></p><p>Base damage $VAR$</p><p>Max damage $VAR$ (without artifacts)</p><p>Min circle radius $VAR$</p><p>Max circle radius $VAR$</p><p>Cooldown $VAR$ sec</p>"
    case 'Hailstorm':
      return "<p>Hits and freezes all enemies within a circle</p><p></p><p>Base damage $VAR$</p><p>Max damage $VAR$ (without artifacts)</p><p>Min circle radius $VAR$</p><p>Max circle radius $VAR$</p><p>Affects $VAR$ sec</p><p>Cooldown $VAR$ sec</p>"
    default:
      throw 'unknown spec name: ' + spec.name;
  }
}