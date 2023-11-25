import { NgModule } from "@angular/core";
import { ClientTemplateComponent } from './client-template/client-template.component';
import { PartialsModule } from "../Partials/Partials.module";
import { CommonModule } from "@angular/common";
import { BrowserModule } from "@angular/platform-browser";
import { RouterModule } from "@angular/router";
import { ClientRoutingModule } from "src/app/Modules/client/client-routing.module";
import { ClientModule } from "src/app/Modules/client/client.module";

@NgModule({
    declarations:[
    ClientTemplateComponent
  ],
    imports:[
      PartialsModule,
      CommonModule,
      BrowserModule,
      RouterModule,
      ClientRoutingModule,
      ClientModule
    ],
   
})
export class TemplateModule{}