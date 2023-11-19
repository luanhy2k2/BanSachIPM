import { Component } from '@angular/core';
import { Router, RouterLink } from '@angular/router';

@Component({
  selector: 'app-search',
  templateUrl: './search.component.html',
  styleUrls: ['./search.component.scss']
})
export class SearchComponent {
  constructor(private router: Router){}
  name: string = "";
  soluong: number = 0;
  search(){
    this.router.navigate(['/productSearch',this.name]);
  }
}
