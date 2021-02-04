import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Hero } from '../../models/hero';

@Component({
	selector: 'heros',
    templateUrl: './heros.component.html',
    styleUrls: ['./heros.component.scss']
})
export class HerosComponent implements OnInit {
  allPlayableHeroes;

  constructor(private http: HttpClient) { }

  ngOnInit() {
    this.http.get<Hero[]>('http://localhost:3000/heroes').subscribe(data => {
      this.allPlayableHeroes = data;
    });
  }
}