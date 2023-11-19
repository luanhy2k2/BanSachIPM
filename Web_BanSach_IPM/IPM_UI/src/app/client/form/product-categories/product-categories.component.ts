import { Component } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { product } from 'src/app/Models/product.entity';
import { HomeGetDataService } from 'src/app/Service/Client/HomePage/Home-getData';

@Component({
  selector: 'app-product-categories',
  templateUrl: './product-categories.component.html',
  styleUrls: ['./product-categories.component.scss']
})
export class ProductCategoriesComponent {
  constructor(private HomeService:HomeGetDataService, private route: ActivatedRoute){}
  products:product[] = [];
  ngOnInit() {
    // Sử dụng ActivatedRoute để theo dõi thay đổi params
    this.route.params.subscribe(params => {
      const paramValue = params['id']; // Thay 'yourParamName' bằng tên param bạn đang sử dụng
      this.loadData(paramValue);
    });
  }

  loadData(paramValue: string) {
    // Sử dụng DataService hoặc HttpClient để gọi API và lấy dữ liệu
    this.HomeService.getProductByLoaiId(paramValue).subscribe(data => {
      this.products = data;
    });
  }
}
