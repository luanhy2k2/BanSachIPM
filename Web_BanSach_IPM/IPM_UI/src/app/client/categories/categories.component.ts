import { Component } from '@angular/core';
import {HttpClient} from '@angular/common/http';
import { loaisp } from 'src/app/Models/loaisp.entity';
import { HomeGetDataService } from 'src/app/Service/Client/HomePage/Home-getData';

@Component({
  selector: 'app-categories',
  templateUrl: './categories.component.html',
  styleUrls: ['./categories.component.scss']
})
export class CategoriesComponent {
  
  constructor(private getData: HomeGetDataService){
    
  }
  loaisp: loaisp[] = []
  ngOnInit(){
    this.getData.getCategories().subscribe(res =>{this.loaisp = res})
  }
}
