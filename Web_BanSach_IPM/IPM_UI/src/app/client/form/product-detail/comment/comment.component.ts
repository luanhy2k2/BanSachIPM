import { Component } from '@angular/core';
import { commentProduct } from 'src/app/Models/commentProduct.entity';
import { ProductDetailService } from 'src/app/Service/Client/form/ProductDetail-getData';

@Component({
  selector: 'app-comment',
  templateUrl: './comment.component.html',
  styleUrls: ['./comment.component.scss']
})
export class CommentComponent {
  constructor(private productDetaiService:ProductDetailService){}
  comment: commentProduct[] = []
  getComment(id:any){
    this.productDetaiService.getCommentProduct(id).subscribe(res =>{
      this.comment = res;
    })
      
  
  }
}
