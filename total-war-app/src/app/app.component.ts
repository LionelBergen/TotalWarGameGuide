import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Hero } from './components/hero/hero';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent implements OnInit {
  title = 'total-war-guide';
  allPlayableHeroes;
  
  constructor(private http: HttpClient) { }
  
  ngOnInit() {
    this.http.get<Hero[]>('http://localhost:3000/heroes').subscribe(data => {
      this.allPlayableHeroes = data;
    });
  }
}
