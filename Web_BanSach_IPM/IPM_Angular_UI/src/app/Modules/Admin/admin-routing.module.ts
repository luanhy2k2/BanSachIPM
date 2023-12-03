import { RouterModule, Routes } from "@angular/router";
import { BranchComponent } from "./branch/branch.component";
import { NgModule } from "@angular/core";
import { ProductComponent } from "./product/product.component";

const routes: Routes = [
    {
        path: 'branch',
        component:BranchComponent
        
    },
    {
        path: 'product',
        component:ProductComponent
        
    }
]
@NgModule({
    imports: [RouterModule.forChild(routes)],
    exports: [RouterModule]
  })
export class AdminRoutingModule { }