import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { LabTests, labTests } from './labTests';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent {
  constructor(public router: Router) { }
  name!: string;
  labTests: { active: boolean; tests: LabTests[] }[] = [];
  selected?: LabTests;

  ngOnInit(): void {
    for (let i = 0; i < labTests.length; i++) {
      if (i % 4 === 0) {
        this.labTests.push({ active: !i, tests: [] });
      }
      this.labTests[this.labTests.length - 1].tests.push(labTests[i]);
    }
  }
  onSearch(name: string) {
    if (name != undefined) {
      console.log('navigating to search url');
      let url = "/user/search/product/" + name;
      this.router.navigateByUrl(url);
    } else {
      console.log('please enter a name');
    }
  }

  onClick(selected: LabTests): void {
    this.selected = selected;
  }

}
