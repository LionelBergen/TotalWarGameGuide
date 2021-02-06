import { Component, OnInit, isDevMode  } from '@angular/core';
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

  async ngOnInit() {
      this.getAllHereos().then((heros : Hero[]) => {
        // remove hero that isnt released yet
        heros = heros.filter(hero => hero.name !== 'Druid');

        // TODO: better way of doing this
        heros.forEach( hero => {
          hero.maxstep = Number(hero.maxstep);
          hero.speca = Number(hero.speca);
          hero.specb = Number(hero.specb);
        });
        
        this.allPlayableHeroes = heros;
    });
  }

  getAllHereos() {
    return new Promise(resolve => {
      if (isDevMode()) {
        this.http.get<Hero[]>('http://localhost:3000/heroes').subscribe((data : Hero[]) => {
          return resolve(data);
        });
      } else {
        this.http.get<Hero[]>('../../assets/json/heros.json').subscribe((data : Hero[]) => {
          return resolve(data);
        });
      }
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