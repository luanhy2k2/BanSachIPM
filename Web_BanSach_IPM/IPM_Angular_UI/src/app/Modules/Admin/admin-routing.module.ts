import { RouterModule, Routes } from "@angular/router";
import { BranchComponent } from "./branch/branch.component";
import { NgModule } from "@angular/core";

const routes: Routes = [
    {
        path: 'branch',
        component:BranchComponent
        
    }
]
@NgModule({
    imports: [RouterModule.forChild(routes)],
    exports: [RouterModule]
  })
export class AdminRoutingModule { }