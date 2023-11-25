import { HttpClient } from "@angular/common/http";
import { Injectable } from "@angular/core";
import { Observable } from "rxjs";
import { orderPay } from "src/app/Models/orderPay.entity";
@Injectable({
    providedIn: 'root'
})
export class PaymentService{
    constructor (private http: HttpClient){}
    payMent(orderPay:any){
        return this.http.post<any>("https://localhost:44301/api/donhang/createDonHang", orderPay);
    }
}