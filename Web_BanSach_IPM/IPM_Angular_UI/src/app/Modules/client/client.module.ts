import { NgModule } from "@angular/core";
import { HomeComponent } from './home/home.component';
import { RouterModule } from "@angular/router";
import { CommonModule } from "@angular/common";
import { ClientRoutingModule } from "./client-routing.module";

@NgModule({
    declarations:[
    HomeComponent
  ],
    imports:[
      ClientRoutingModule,
      CommonModule,
    ]
})
export class ClientModule{}