import { Component } from '@angular/core';
import { productCart } from 'src/app/Models/productCart.entity';
import { CartService } from 'src/app/Service/Client/form/CartService';

@Component({
  selector: 'app-cart',
  templateUrl: './cart.component.html',
  styleUrls: ['./cart.component.scss']
})
export class CartComponent {
  constructor(private service: CartService){}
  products! :any[]
  ngOnInit(){
    this.loadCart()
  }
  loadCart(){
    const cartData = this.service.getCart()
    if (cartData !== null) {
      this.products = JSON.parse(cartData);
    }
  }
  removeProduct(id:any) {
   
    this.service.removeItem(id);
    this.loadCart()

  }
}
