// import { NgModule } from '@angular/core';
// import { RouterModule, Routes } from '@angular/router';
// import { ClientTemplateComponent } from './client-template/client-template.component';


// const routes: Routes = [
//   {
//     path: '',
//     data: {
//       title: 'Trang',
//     },
//     children: [
//       {
//         path: '',
//         component: ClientTemplateComponent,
//         data: {
//           title: 'Client',
//         },
//         children: [
//           {
//             path: 'client',
//             loadChildren: () =>
//               import('../../Modules/client/client.module').then(
//                 (x) => x.ClientModule
//               ),
//           },
//         ],
//       },
//     //   {
//     //     path: 'admin',
//     //     component: AdminAdmintemplateComponent,
//     //     data: {
//     //       title: 'Admin',
//     //     },
//     //     children: [
//     //       {
//     //         path: '',
//     //         loadChildren: () =>
//     //           import('../../modules/admin/admin.module').then(
//     //             (x) => x.AdminModule
//     //           ),
//     //       },
//     //     ],
//     //   },
//     ],
//   },
  
// ];

// @NgModule({
//   imports: [RouterModule.forChild(routes)],
//   exports: [RouterModule],
// })
// export class TemplateRoutingModule {}

import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { ClientTemplateComponent } from './client-template/client-template.component';


const routes: Routes = [
  {
    path: '',
    data: {
      title: 'Trang',
    },
    component: ClientTemplateComponent,
    children: [
      {
        path: 'client',
        loadChildren: () =>
          import('../../Modules/client/client.module').then(
            (x) => x.ClientModule
          ),
      },
    ],
  },
  
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
})
export class TemplateRoutingModule {}
