import { HttpClient } from "@angular/common/http";
import { Injectable } from "@angular/core";
import { Observable } from "rxjs";
import { loaisp } from "src/app/Models/loaisp.entity";
import { product } from "src/app/Models/product.entity";

@Injectable({
    providedIn: "root"
})
export class HomeGetDataService{
    constructor(private httpClient: HttpClient) {}
    getCategories():Observable<loaisp[]>{
        return this.httpClient.get<loaisp[]>("https://localhost:44301/api/Home/getLoaiSp");
    }
    getProductSelling():Observable<product[]>{
        return this.httpClient.get<product[]>("https://localhost:44301/api/Home/banChay/10")
    }
    getProductNew():Observable<product[]>{
        return this.httpClient.get<product[]>("https://localhost:44301/api/Home/sanPhamMoi/10")
    }
    getProductByCategories(id:any):Observable<product[]>{
        return this.httpClient.get<product[]>(`https://localhost:44301/api/Home/getSpByLoai/${id}/10`)
    }
    getProductByName(name:any):Observable<product[]>{
        return this.httpClient.get<product[]>(`https://localhost:44301/api/Home/GetSpByName/${name}`)
    }
    getProductByLoaiId(id:any):Observable<product[]>{
        return this.httpClient.get<product[]>(`https://localhost:44301/api/Home/getSpByLoai/${id}/10`)
    }
    getAllProduct(pageIndex:any):Observable<product[]>{
        
        return this.httpClient.get<product[]>(`https://localhost:44301/api/Home/getSanPham/${pageIndex}/2`)
    }
    
    
}