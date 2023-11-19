import { HttpClient } from '@angular/common/http';
import { Component } from '@angular/core';
import { Observable } from 'rxjs';
import { product } from 'src/app/Models/product.entity';
import { HomeGetDataService } from 'src/app/Service/Client/HomePage/Home-getData';

@Component({
  selector: 'app-all-product',
  templateUrl: './all-product.component.html',
  styleUrls: ['./all-product.component.scss']
})
export class AllProductComponent {
  constructor(private service: HomeGetDataService, private http: HttpClient) { }
  pageInDex: number = 0
  totalPagesArray: number[] = [];
  products!: product[]
  total!: number
  ngOnInit(): void {
    this.loadData();
  }
  

  previousPage() {
    this.pageInDex--
    this.loadData()
  }
  nextPage() {
      this.pageInDex++;
      this.loadData()
  }
  setCurrentPage(page: number) {
    this.pageInDex = page-1;
    this.loadData()
  }
  loadData() {
    this.http.get("https://localhost:44301/api/Home/productCount").subscribe(res => {
      const productCount = Number(res);
      this.total = Math.ceil(productCount / 2)
      this.totalPagesArray = Array.from({ length: this.total }, (_, index) => index + 1);
    })
    
    this.service.getAllProduct(this.pageInDex).subscribe((data) => {
      this.products = data;

    });
  }
 

}
