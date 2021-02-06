import { ComponentFixture, TestBed } from '@angular/core/testing';

import { TooltipHeroComponent } from './tooltip-hero.component';

describe('TooltipHeroComponent', () => {
  let component: TooltipHeroComponent;
  let fixture: ComponentFixture<TooltipHeroComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ TooltipHeroComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(TooltipHeroComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
