import { Component } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { productService } from 'src/app/Service/admin/productService';

@Component({
  selector: 'app-edit',
  templateUrl: './edit.component.html',
  styleUrls: ['./edit.component.scss']
})
export class EditComponent {
   constructor(private productServie: productService,private route :ActivatedRoute){}
   
  product: any;
  requestData = {
    sanpId: 0,
    sanpName: "",
    size: "",
    tgId: 0,
    loaiId: 0,
    nsxId: 0,
    sotrang: 0,
    tomtat: "",
    namsx: "",
    image: ""
   
  }
  ngOnInit() {
    // Sử dụng ActivatedRoute để theo dõi thay đổi params
    this.route.params.subscribe(params => {
      const paramValue = params['id']; // Thay 'yourParamName' bằng tên param bạn đang sử dụng
      this.loadData(paramValue);
    });
   
  }
  loadData(paramValue: string) {
    // Sử dụng DataService hoặc HttpClient để gọi API và lấy dữ liệu
    this.productServie.getProductById(paramValue).subscribe(data => {
      this.product = data;
    });
  }
  editproduct() {
    this.productServie.editproduct(this.product).subscribe(response=>{
      alert("suceess");
      
    }
    
    );
  }
}
