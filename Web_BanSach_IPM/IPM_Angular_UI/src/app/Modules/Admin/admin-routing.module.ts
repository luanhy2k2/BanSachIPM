import { RouterModule, Routes } from "@angular/router";
import { BranchComponent } from "./branch/branch.component";
import { NgModule } from "@angular/core";
import { ProductComponent } from "./product/product.component";
import { EditComponent } from "./product/edit/edit.component";

const routes: Routes = [
    {
        path: 'branch',
        component:BranchComponent
        
    },
    {
        path: 'product',
        component:ProductComponent
        
    }
    ,
    {
        path: 'product/edit/:id',
        component:EditComponent
        
    }
]
@NgModule({
    imports: [RouterModule.forChild(routes)],
    exports: [RouterModule]
  })
export class AdminRoutingModule { }