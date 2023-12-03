import { Component } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { product } from 'src/app/Models/product.entity';
import { productService } from 'src/app/Service/admin/productService';

@Component({
  selector: 'app-product',
  templateUrl: './product.component.html',
  styleUrls: ['./product.component.scss']
})
export class ProductComponent {
  constructor(private productService:productService, private route :ActivatedRoute){ }
  product: any[] = [];
  pageIndex: number = 0;
  totalPageArray: number[] = []
  name: string = "";
  requestData = {
    sanpham:{
      sanpId: 0,
      sanpName: '',
      size:'',
      tgId:'',
      loaiId:'',
      nsxId:'',
      sotrang:'',
      tomtat:'',
      namsx:'',
      image:''
    },
    
    gia:''
  };
  
  ngOnInit(){
    this.getproduct();
    
  }
  getproduct(){
    this.productService.countproduct().subscribe(res=>{
      var total = Number(res);
      var toatlPage = Math.ceil(total/5);
      this.totalPageArray = Array.from({ length: toatlPage }, (_, index) => index + 1);
      this.productService.getproduct(this.pageIndex).subscribe(res=>{
        this.product = res;
      })
    })
  }
  getproductByName(){
    this.productService.getBrandbyName(this.name).subscribe(data =>{
      this.product = data;
    });
  }
  nextPage(){
    this.pageIndex++;
    this.getproduct();
  }
  previousPage(){
    this.pageIndex--;
    this.getproduct();
  }
  setPage(pageInDex:any){
    this.pageIndex = pageInDex-1;
    this.getproduct();
  }
  addproduct() {
    this.productService.addproduct(this.requestData).subscribe(response=>{
      alert("suceess");
      this.getproduct();
    }
    
    );
  }
  deleteproduct(id: number) {
    this.productService.deleteproduct(id).subscribe(response=>{
      alert("suceess");
      this.getproduct();
    }
    
    );
    
  }
}


