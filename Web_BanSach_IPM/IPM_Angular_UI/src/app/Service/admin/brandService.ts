import { HttpClient } from "@angular/common/http";
import { Injectable } from "@angular/core";
import { Observable } from "rxjs";
import { branch } from "src/app/Models/branch.entity";
const url = 'https://localhost:7262';
@Injectable({
    providedIn: "root"
})

export class branchService{
    constructor(private http:HttpClient){}
    getBranch(pageIndex: any):Observable<branch[]>{
        return this.http.get<branch[]>(`${url}/api/categories/getAll/${pageIndex}/5`);
    }
    countBranch(){
        return this.http.get(`${url}/api/categories/count`);
    }
    getBrandbyName(name: string): Observable<branch[]>{
        return this.http.get<branch[]>(`${url}/api/categories/search/${name}/0/8`)
    }
    addBranch(branch: any) {
        return this.http.post<any>(`${url}/api/categories/create`, branch);
    }
    deleteBranch(id: any) {
        return this.http.delete<any>(`${url}/api/categories/delete/${id}`);
    }
}