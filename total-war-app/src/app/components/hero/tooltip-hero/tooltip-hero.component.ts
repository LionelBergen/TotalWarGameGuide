import { Component, OnInit, Input, ViewEncapsulation } from '@angular/core';
import { Spec } from '../../../models/spec';
import { getSpecInfo } from '../../../service/spec-service';

@Component({
  selector: 'tooltip-hero',
  templateUrl: './tooltip-hero.component.html',
  styleUrls: ['./tooltip-hero.component.scss'],
  encapsulation: ViewEncapsulation.None
})
export class TooltipHeroComponent implements OnInit {
  @Input() spec : Spec;
  constructor() { }

  ngOnInit(): void {
  }

  getSpecInfo(spec) {
  	return getSpecInfo(spec);
  }

}
