import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Hero } from '../../models/hero';
import { Spec } from '../../models/spec';

@Component({
	selector: 'heros',
    templateUrl: './heros.component.html',
    styleUrls: ['./heros.component.scss']
})
export class HerosComponent implements OnInit {
  allPlayableHeroes;
  heroToDisplaySpecInfo;

  constructor(private http: HttpClient) { }

  ngOnInit() {
    this.http.get<Hero[]>('http://localhost:3000/heroes').subscribe((data : Hero[]) => {
      // remove hero that isnt released yet
      data = data.filter(hero => hero.name !== 'Druid');

      // TODO: better way of doing this
      data.forEach( hero => {
        hero.maxstep = Number(hero.maxstep);
        hero.speca = Number(hero.speca);
        hero.specb = Number(hero.specb);
      });
      
      this.allPlayableHeroes = data;
    });
  }

  specInfoClick(heroName) {
    if (this.heroToDisplaySpecInfo == heroName) {
      this.heroToDisplaySpecInfo = '';
    } else {
      this.heroToDisplaySpecInfo = heroName;
    }
  }

  shouldDisplayTooltip(heroName) {
    return heroName == this.heroToDisplaySpecInfo;
  }

  getSpecByName(heroObject : Hero) {
    const spec: Spec = ({name: heroObject.spectype, spec0: heroObject.spec0, maxstep: heroObject.maxstep, speca: heroObject.speca, specb: heroObject.specb, delay: heroObject.specdelay, damagea: heroObject.damagea, maxhpa: heroObject.maxhpa});
    return spec;
  }
}