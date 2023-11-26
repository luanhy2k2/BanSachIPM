import { Component } from '@angular/core';
import { Router, RouterLink } from '@angular/router';

@Component({
  selector: 'app-search-client',
  templateUrl: './search-client.component.html',
  styleUrls: ['./search-client.component.scss']
})
export class SearchClientComponent {
  constructor(private router: Router){}
  name: string = "";
  soluong: number = 0;
  search(){
    this.router.navigate(['/client/search',this.name]);
  }
}
