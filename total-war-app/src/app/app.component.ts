import { Component } from '@angular/core';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent {
  title = 'total-war-guide';

  changeBodyClass(matTab) {
  	if (matTab.tab.textLabel === 'Artifacts') {
  		document.body.className = 'arena2';
  	} else {
  		document.body.className = '';
  	}
  }
}
