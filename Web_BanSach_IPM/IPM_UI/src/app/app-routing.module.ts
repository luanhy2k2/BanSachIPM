import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { HomeComponent } from './client/home/home.component';
import { ProductDetailComponent } from './client/form/product-detail/product-detail.component';
import { ProductSearchComponent } from './client/form/product-search/product-search.component';
import { ProductCategoriesComponent } from './client/form/product-categories/product-categories.component';
import { AllProductComponent } from './client/form/all-product/all-product.component';
import { CartComponent } from './client/form/cart/cart.component';
import { PaymentComponent } from './client/form/payment/payment.component';
import { BranchComponent } from './admin/branch/branch.component';
import { AuthorComponent } from './admin/author/author.component';

const routes: Routes = [
  {
    path:'',
    component: HomeComponent
  },
  {
    path: 'detail/:id',
    component :ProductDetailComponent
  },
  {
    path: 'productSearch/:name',
    component :ProductSearchComponent
  },
  {
    path: 'productCategory/:id',
    component :ProductCategoriesComponent
  },
  {
    path: 'allProduct',
    component :AllProductComponent
  },
  {
    path: 'cart',
    component :CartComponent
  },
  {
    path: 'payment',
    component:PaymentComponent
  },
  {
    path: 'admin/branch',
    component:BranchComponent
  },
  {
    path: 'admin/author',
    component:AuthorComponent
  }
  

];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
