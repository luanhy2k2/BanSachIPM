import { Component } from '@angular/core';
import {OnInit} from '@angular/core';
@Component({
  selector: 'app-admin',
  templateUrl: './admin.component.html',
  styleUrls: ['./admin.component.scss']
})
export class AdminComponent implements OnInit {
  ngOnInit(){
    document.write('xcss');
  }
  a1 = ''; b1=''; c1='';
  kq =''
  sukien(){
    if(this.a1 == '' || this.b1 == '' || this.c1 == ''){
      alert('nhap')
    }
    else{
      var a = parseFloat(this.a1);
      var b = parseFloat(this.b1);
      var c = parseFloat(this.c1);
      var delta = b*b -4*a*c;
      if(delta < 0){
        this.kq = 'vo nghiem';
      }
      else{
        var x1 = (-b-Math.sqrt(delta)/2/a);
        var x2 = (-b+Math.sqrt(delta)/2/a);
        if (x1 == x2){
          this.kq = 'phuong trinh co nghiem kep  <br> x1=x2' + x1 ;
        }
        else{
          this.kq = 'phuong trinh co 2 nghiem x1 = ' + x1 +'x2 =' +x2;
        }
      }
    }
  }
  a = '<p style = "color:red">  xin chao </p>';
  

 
}
