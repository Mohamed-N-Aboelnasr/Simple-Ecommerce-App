import { HttpClient } from '@angular/common/http';
import { Component } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { User } from 'src/app/common/user';
import { AuthService } from 'src/app/services/auth.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent {
  baseUrl: string = 'http://localhost:8081/api';
  isRegisterMode = false; // Tracks whether the register form is active
  loginForm: FormGroup;
  registerForm: FormGroup;
  errorMessage: string;

  constructor(private fb: FormBuilder, private authService: AuthService, private router: Router, private http: HttpClient) {
    this.loginForm = this.fb.group({
      username: ['', [Validators.required, Validators.minLength(3)]],
      password: ['', [Validators.required, Validators.minLength(6)]]
    });

    this.registerForm = this.fb.group({
      fullName: ['', Validators.required],
      email: ['', [Validators.required, Validators.email]],
      password: ['', [Validators.required, Validators.minLength(6)]]
    });
  }

  onSubmitLogin() {
    if (this.loginForm.valid) {
      let loginUser: User = new User();
      loginUser.userName = this.loginForm.value.username;
      loginUser.userPassword = this.loginForm.value.password;
      this.authService.login(loginUser).subscribe({
        next: (jwtResponse) => {
          this.authService.setSession(jwtResponse);
          this.errorMessage = null;
          this.router.navigate(['/products']);
        },
        error: () => {
          this.errorMessage = 'Invalid username or password. Please try again.';
        },
      });
    }
  }

  onSubmitRegister() {
    if (this.registerForm.valid) {
      console.log('Registration successful:', this.registerForm.value);
      let newUser: User = new User();
      const [firstName, ...lastNameParts] = this.registerForm.value.fullName.split(' ');
      const lastName = lastNameParts.join(' ');
      newUser.userFirstName = firstName;
      newUser.userLastName = lastName;
      newUser.userName = this.registerForm.value.email;
      newUser.userPassword = this.registerForm.value.password;
      this.http.post(this.baseUrl+'/registerNewUser', newUser).subscribe(
        {
          next: (response) => {
            this.errorMessage = null;
            alert(`Your Registration has been done successfully`);
            this.registerForm.reset();
            this.isRegisterMode = false; // Switch to login mode
          },
          error: (err) => {
            this.errorMessage = 'Failed to register user. Please try again.';
            console.error(err);
          },
        }
      );
      
    }
  }

  toggleMode() {
    this.errorMessage = null;
    this.loginForm.reset();
    this.isRegisterMode = !this.isRegisterMode;
  }
}
