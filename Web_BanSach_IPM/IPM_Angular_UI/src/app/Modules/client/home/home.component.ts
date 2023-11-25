import { Component } from '@angular/core';
import { product } from 'src/app/Models/product.entity';
import { HomeGetDataService } from 'src/app/Service/Client/HomePage/Home-getData';
const url = 'https://localhost:44301/api/Home/banChay/10';
@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.scss']
})
export class HomeComponent {
  constructor(private homeService: HomeGetDataService){}
  products: product[] = [];
  quantityProduct:number = 0;
  
  ngOnInit() {
    this.loadProductData('banChay');
  }

  sanPhamMoi() {
    this.loadProductData('sanPhamMoi');
  }

  sanPhamBanChay() {
    this.loadProductData('banChay');
  }
  sanPhamHuyenAo() {
    this.loadProductByCategory(3);
  }
  sanPhamTinhCam() {
    this.loadProductByCategory(2);
  }
  showMoreProduct() {
    this.quantityProduct++;
    this.loadProductData();
     // Load data based on the current active criteria
  }
  private loadProductData(criteria?: string) {
    // Default to 'banChay' if no criteria is provided
    criteria = criteria || 'banChay';
    this.homeService.getProductData(criteria, this.quantityProduct).subscribe(res => {
      this.products = res;
    });
  }

  private loadProductByCategory(categoryId: number) {
    this.homeService.getProductsCategory(categoryId, this.quantityProduct).subscribe(res => {
      this.products = res;
    });
  }
}
