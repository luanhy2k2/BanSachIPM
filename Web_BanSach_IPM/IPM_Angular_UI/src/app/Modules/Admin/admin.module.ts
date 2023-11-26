import { NgModule } from "@angular/core";
import { BranchComponent } from './branch/branch.component';
import { FormsModule } from "@angular/forms";
import { CommonModule } from "@angular/common";
import { AdminRoutingModule } from "./admin-routing.module";


@NgModule({
    declarations:[
    BranchComponent
  ],
    imports:[
        FormsModule,
        CommonModule,
        AdminRoutingModule
    ]
})
export class AdminModule{}