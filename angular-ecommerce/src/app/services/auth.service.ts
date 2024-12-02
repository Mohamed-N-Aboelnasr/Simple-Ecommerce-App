import { Injectable } from '@angular/core';
import { User } from '../common/user';
import { HttpClient } from '@angular/common/http';
import { JwtResponse } from '../common/jwtResponse';
import { Observable } from 'rxjs';
import { Router } from '@angular/router';

@Injectable({
  providedIn: 'root'
})
export class AuthService {
  private readonly authUrl = 'http://localhost:8081/api/authenticate';
  private readonly tokenKey = 'authToken';
  private readonly userKey = 'loggedUser';

  constructor(private http: HttpClient, private router: Router) {}

  login(user: User): Observable<JwtResponse>{
    return this.http.post<JwtResponse>(this.authUrl, user);
  }

  logout() {
    localStorage.removeItem(this.tokenKey);
    localStorage.removeItem(this.userKey);
    this.router.navigate(['/login']);
  }

  setSession(jwtResponse: JwtResponse): void {
    localStorage.setItem(this.tokenKey, jwtResponse.jwtToken);
    localStorage.setItem(this.userKey, JSON.stringify(jwtResponse.user));
  }

  getToken(): string | null {
    return localStorage.getItem(this.tokenKey);
  }

  getLoggedUser(): User | null {
    return JSON.parse(localStorage.getItem(this.userKey));
  }

  isAuthenticated(): boolean {
    return !!this.getToken();
  }
}
