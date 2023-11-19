import { Component } from '@angular/core';
import { loaisp } from 'src/app/Models/loaisp.entity';
import { HomeGetDataService } from 'src/app/Service/Client/HomePage/Home-getData';

@Component({
  selector: 'app-form-categories',
  templateUrl: './form-categories.component.html',
  styleUrls: ['./form-categories.component.scss']
})
export class FormCategoriesComponent {
  constructor(private service:HomeGetDataService){}
  loaisp!: loaisp[]
  ngOnInit(){
    this.service.getCategories().subscribe(res=>{
      this.loaisp = res;
    })
  }
}
