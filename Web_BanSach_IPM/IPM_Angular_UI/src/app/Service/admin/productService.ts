import { HttpClient } from "@angular/common/http";
import { Injectable } from "@angular/core";
import { Observable } from "rxjs";
import { product } from "src/app/Models/product.entity";

const url = 'https://localhost:7262';
@Injectable({
    providedIn: "root"
})

export class productService{
    constructor(private http:HttpClient){}
    getproduct(pageIndex: any):Observable<product[]>{
        return this.http.get<any[]>(`${url}/api/product/getAll/${pageIndex}/5`);
    }
    countproduct(){
        return this.http.get(`${url}/api/product/count`);
    }
    getBrandbyName(name: string): Observable<product[]>{
        return this.http.get<any[]>(`${url}/api/product/search/${name}/0/8`)
    }
    addproduct(product: any) {
        return this.http.post<any>(`${url}/api/product/create`, product);
    }
    editproduct(product: any) {
        return this.http.post<any>(`${url}/api/product/update`, product);
    }
    deleteproduct(id: any) {
        return this.http.delete<any>(`${url}/api/product/delete/${id}`);
    }
    getProductById(id:any):Observable<any[]>{
        return this.http.get<any[]>(`${url}/api/product/getById/${id}`)
    }
}