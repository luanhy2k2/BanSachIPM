import { NgModule } from "@angular/core";
import { HeaderClientComponent } from "./client/header-client/header-client.component";
import { CommonModule } from "@angular/common";
import { RouterModule } from "@angular/router";
import { FooterClientComponent } from "./client/footer-client/footer-client.component";
import { SearchClientComponent } from './client/search-client/search-client.component';
import { HttpClient, HttpClientModule } from '@angular/common/http';
import { BrowserModule } from "@angular/platform-browser";
import { FormsModule } from '@angular/forms';
import { CategoryClientComponent } from './client/category-client/category-client.component';
import { HeaderAdminComponent } from './admin/header-admin/header-admin.component';
import { CategoryAdminComponent } from './admin/category-admin/category-admin.component';

@NgModule({
    declarations: [
        HeaderClientComponent,
        FooterClientComponent,
        SearchClientComponent,
        CategoryClientComponent,
        HeaderAdminComponent,
        CategoryAdminComponent
    ],
    imports: [
        CommonModule,
        RouterModule,
        BrowserModule,
        FormsModule,
        HttpClientModule,
        
    ],
    exports:[
        HeaderClientComponent,
        FooterClientComponent,
        SearchClientComponent,
        CategoryClientComponent,
        HeaderAdminComponent,
        CategoryAdminComponent
    ]
})
export class PartialsModule{ }