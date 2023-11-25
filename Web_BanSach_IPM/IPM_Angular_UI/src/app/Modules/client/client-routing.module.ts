import { RouterModule, Routes } from "@angular/router";
import { HomeComponent } from "./home/home.component";
import { NgModule } from "@angular/core";

const routes: Routes = [
    {
        path: 'Home',
        component:HomeComponent,
        title:'IPM'
    }
]
@NgModule({
    imports: [RouterModule.forChild(routes)],
    exports: [RouterModule]
  })
  export class ClientRoutingModule { }