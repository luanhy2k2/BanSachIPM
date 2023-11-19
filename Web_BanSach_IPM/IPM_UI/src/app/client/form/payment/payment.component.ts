import { Component } from '@angular/core';

import { orderPay } from 'src/app/Models/orderPay.entity';
import { CartService } from 'src/app/Service/Client/form/CartService';
import { PaymentService } from 'src/app/Service/Client/form/PaymentService';

@Component({
  selector: 'app-payment',
  templateUrl: './payment.component.html',
  styleUrls: ['./payment.component.scss']
})
export class PaymentComponent {
  constructor(private cartService: CartService, private PayService:PaymentService){}
  // payForm!: orderPay;
  payForm = {
    khach: {
      tenKhachHang:"",
      diaChi:"",
      email:"",
      sdt:""
  },
  ct:[
      {
          sanpId:"",
          quantity:"",
          gia:""
      }
  ],
  total:0
  }
  products! :any[]
  ngOnInit(){
    this.loadCart();
  }
  loadCart(){
    const cartData = this.cartService.getCart()
    if (cartData !== null) {
      this.products = JSON.parse(cartData);
    }
  }
  createDonHang(){
    const cartData = this.cartService.getCart()
    if (cartData !== null) {
      const cart = JSON.parse(cartData);
      this.payForm.ct = cart;
      var totalPrice: number = cart.reduce((acc: number, product: any) => {
        return acc + product.gia * product.quantity;
      }, 0);
      this.payForm.total = totalPrice;
      this.PayService.payMent(this.payForm).subscribe(response=>{
        alert("Đặt hàng thành công");
      }
      )
    }
    
  }
}
