import { Injectable } from "@angular/core";
import { CanActivate, Router } from "@angular/router";
import { AuthService } from "../services/auth.service";
import { Observable } from "rxjs";

@Injectable()
export class AuthGuard implements CanActivate{

    constructor(private router: Router, private authService: AuthService){}

    canActivate() {
        if(this.authService.isAuthenticated()){
            return true;
        } else{
            this.router.navigate(['/login']);
            return false;
        }
    }
}