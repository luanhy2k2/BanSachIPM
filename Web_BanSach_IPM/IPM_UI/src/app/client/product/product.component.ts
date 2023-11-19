import { Component } from '@angular/core';
import { product } from 'src/app/Models/product.entity';
import { HomeGetDataService } from 'src/app/Service/Client/HomePage/Home-getData';
const url = 'https://localhost:44301/api/Home/banChay/10';
@Component({
  selector: 'app-product',
  templateUrl: './product.component.html',
  styleUrls: ['./product.component.scss']
})
export class ProductComponent {
  constructor(private homeService: HomeGetDataService){}
  products: product[] = [];
  ngOnInit(){
    this.homeService.getProductSelling().subscribe(res =>{
      this.products = res;
    })
  }
  sanPhamMoi(){

    this.homeService.getProductNew().subscribe(res =>{
      this.products = res;
  })
  };
  sanPhamBanChay(){

    this.homeService.getProductSelling().subscribe(res =>{
      this.products = res;
  })
  };
  sanPhamHuyenAo(){
    this.homeService.getProductByCategories(3).subscribe(res =>{
      this.products = res;
    })
  };
  sanPhamTinhCam(){
    this.homeService.getProductByCategories(2).subscribe(res =>{
      this.products = res;
    })
  }

}
