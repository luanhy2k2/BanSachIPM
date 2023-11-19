import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { HomeComponent } from './client/home/home.component';
import { HeaderComponent } from './client/header/header.component';
import { SearchComponent } from './client/search/search.component';
import { CategoriesComponent } from './client/categories/categories.component';
import { SliderComponent } from './client/slider/slider.component';
import { ProductComponent } from './client/product/product.component';
import { PostComponent } from './client/post/post.component';
import { FooterComponent } from './client/footer/footer.component';
import { ProductDetailComponent } from './client/form/product-detail/product-detail.component';
import { ProductCategoriesComponent } from './client/form/product-categories/product-categories.component';
import { AdminComponent } from './admin/admin.component';

import { FormsModule, ReactiveFormsModule } from '@angular/forms';

import { HttpClient, HttpClientModule } from '@angular/common/http';
import { ProductSearchComponent } from './client/form/product-search/product-search.component';
import { FormCategoriesComponent } from './client/form/form-categories/form-categories.component';
import { AllProductComponent } from './client/form/all-product/all-product.component';
import { CartComponent } from './client/form/cart/cart.component';
import { PaymentComponent } from './client/form/payment/payment.component';
import { CommentComponent } from './client/form/product-detail/comment/comment.component';
import { LayoutComponent } from './admin/layout/layout.component';
import { CategoriesAdminComponent } from './admin/layout/categories-admin/categories-admin.component';
import { HeaderAdminComponent } from './admin/layout/header-admin/header-admin.component';
import { BranchComponent } from './admin/branch/branch.component';
import { AuthorComponent } from './admin/author/author.component';

@NgModule({
  declarations: [
    AppComponent,
    HomeComponent,
    HeaderComponent,
    SearchComponent,
    CategoriesComponent,
    SliderComponent,
    ProductComponent,
    PostComponent,
    FooterComponent,
    ProductDetailComponent,
    ProductCategoriesComponent,
    AdminComponent,
   
    ProductSearchComponent,
    FormCategoriesComponent,
    AllProductComponent,
    CartComponent,
    PaymentComponent,
    CommentComponent,
    LayoutComponent,
    CategoriesAdminComponent,
    HeaderAdminComponent,
    BranchComponent,
    AuthorComponent,
   
  ],
  imports: [
    HttpClientModule,
    ReactiveFormsModule,
    BrowserModule,
    AppRoutingModule,
    FormsModule,
    
   
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
