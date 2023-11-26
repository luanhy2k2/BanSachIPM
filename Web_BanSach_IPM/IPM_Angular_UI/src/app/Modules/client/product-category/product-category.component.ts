import { Component } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { loaisp } from 'src/app/Models/loaisp.entity';
import { product } from 'src/app/Models/product.entity';
import { HomeGetDataService } from 'src/app/Service/Client/HomePage/Home-getData';

@Component({
  selector: 'app-product-category',
  templateUrl: './product-category.component.html',
  styleUrls: ['./product-category.component.scss']
})
export class ProductCategoryComponent {
  constructor(private HomeService:HomeGetDataService, private route: ActivatedRoute){}
  products:product[] = [];
  loaisp!: loaisp[];
  ngOnInit() {
    // Sử dụng ActivatedRoute để theo dõi thay đổi params
    this.route.params.subscribe(params => {
      const paramValue = params['id']; // Thay 'yourParamName' bằng tên param bạn đang sử dụng
      this.loadData(paramValue);
    });
    this.HomeService.getCategories().subscribe(res=>{
      this.loaisp = res;
    })
  }
  loadData(paramValue: string) {
    // Sử dụng DataService hoặc HttpClient để gọi API và lấy dữ liệu
    this.HomeService.getProductByLoaiId(paramValue).subscribe(data => {
      this.products = data;
    });
  }
}
