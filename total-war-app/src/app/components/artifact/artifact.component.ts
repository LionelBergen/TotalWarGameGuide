import { Component, OnInit, isDevMode } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Artifact } from '../../models/artifact';

@Component({
  selector: 'artifacts',
  templateUrl: './artifact.component.html',
  styleUrls: ['./artifact.component.scss']
})
export class ArtifactComponent implements OnInit {
  allArtifacts;

  constructor(private http: HttpClient) {
  }

  ngOnInit(): void {
  	this.getAllArtifacts().then((artifacts : Artifact[]) => {
        // TODO: better way of doing this
        artifacts.forEach( artifact => {
        });
        
        this.allArtifacts = artifacts;
    });
  }

  getAllArtifacts() {
    return new Promise(resolve => {
      if (isDevMode()) {
        this.http.get<Artifact[]>('http://localhost:3000/artifacts').subscribe((data : Artifact[]) => {
          console.log('finished calling get request and writing to file');
          return resolve(data);
        });
      } else {
        console.log('reading from local file...');
        this.http.get<Artifact[]>('../../assets/json/artifacts.json').subscribe((data : Artifact[]) => {
          return resolve(data);
        });
      }
    });
  }

  getNumberOfArtifacts(unitType, artifactType) {
  	if (!this.allArtifacts) {
  		return -1;
  	}
  	let artifacts = this.allArtifacts.filter(artifact => artifact.specialties === 'all' || artifact.specialties.includes(unitType));
  	artifacts = artifacts.filter(artifact => artifact.type.includes(artifactType));

  	return artifacts.length;
  }

  getNumberOfArtifactsTotal(unitType) {
  	if (!this.allArtifacts) {
  		return -1;
  	}

  	return this.allArtifacts.filter(artifact => artifact.specialties === 'all' || artifact.specialties.includes(unitType)).length;
  }
}
