import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent implements OnInit {
  title = 'total-war-guide';
  
  constructor(private http: HttpClient) { }
  
  ngOnInit() {
    this.http.get<any>('http://localhost:3000/heroes').subscribe(data => {
      console.log(data);
    });
  }
}
