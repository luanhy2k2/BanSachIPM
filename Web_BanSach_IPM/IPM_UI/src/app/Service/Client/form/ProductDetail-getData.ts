import { HttpClient } from "@angular/common/http";
import { Injectable } from "@angular/core";
import { Observable } from "rxjs";
import { commentProduct } from "src/app/Models/commentProduct.entity";
import { product } from "src/app/Models/product.entity";
import { productDetail } from "src/app/Models/productDetail.entity";

@Injectable({
    providedIn: "root"
})
export class ProductDetailService{
    constructor(private httpClient: HttpClient){}
    getProductById(id:any):Observable<productDetail>{
        return this.httpClient.get<productDetail>(`https://localhost:44301/api/productDetail/productDetail/${id}`)
    }
    getProductSameAuthor(id:any):Observable<product[]>{
        return this.httpClient.get<product[]>(`https://localhost:44301/api/productDetail/productSameAuthor/${id}`)
    }
    getCommentProduct(id:any):Observable<commentProduct[]>{
        return this.httpClient.get<commentProduct[]>(`https://localhost:44301/api/productDetail/getCommentBySanpId/${id}`)
    }
    addCommentProduct(comment:any){
        return this.httpClient.post(`https://localhost:44301/api/productDetail/addComment`, comment)
    }
    
}