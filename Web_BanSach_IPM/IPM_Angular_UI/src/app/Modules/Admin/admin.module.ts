import { NgModule } from "@angular/core";
import { BranchComponent } from './branch/branch.component';
import { FormsModule } from "@angular/forms";
import { CommonModule } from "@angular/common";
import { AdminRoutingModule } from "./admin-routing.module";
import { ProductComponent } from './product/product.component';
import { EditComponent } from './product/edit/edit.component';


@NgModule({
    declarations:[
    BranchComponent,
    ProductComponent,
    EditComponent
  ],
    imports:[
        FormsModule,
        CommonModule,
        AdminRoutingModule
    ]
})
export class AdminModule{}