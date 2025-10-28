# 🚀 Angular Implementation Guide - Step-by-Step CLI Commands

This guide provides all the CLI commands needed to implement the Passwordless Login System for the Drive Booking application.

---

## 📋 Table of Contents

1. [Prerequisites](#prerequisites)
2. [Project Setup](#project-setup)
3. [Generate Core Services](#generate-core-services)
4. [Generate Components](#generate-components)
5. [Generate Guards](#generate-guards)
6. [Generate Interceptors](#generate-interceptors)
7. [Generate Models/Interfaces](#generate-modelsinterfaces)
8. [Project Structure Overview](#project-structure-overview)
9. [Next Steps](#next-steps)

---

## ✅ Prerequisites

Ensure you have the following installed:

```powershell
# Check Node.js version (should be 18.x or higher)
node --version

# Check Angular CLI version
ng version

# If Angular CLI is not installed, install it globally
npm install -g @angular/cli@latest
```

---

## 🏗️ Project Setup

The project is already initialized. Verify the setup:

```powershell
# Navigate to project directory
cd c:\src\ngbookingfront

# Install dependencies
pnpm install

# Verify Angular version
ng version
```

---

## 🔧 Generate Core Services

### 1. Authentication Service

```powershell
# Generate auth service
ng generate service core/services/auth

# Or with shorthand
ng g s core/services/auth
```

**Purpose:** Handles authentication logic (request magic link, verify OTP, manage tokens)

### 2. HTTP Interceptor Service for Token Management

```powershell
# Generate HTTP service for API calls
ng generate service core/services/api

# Or
ng g s core/services/api
```

**Purpose:** Centralized HTTP service for API communication

### 3. Local Storage Service

```powershell
# Generate storage service
ng generate service core/services/storage

# Or
ng g s core/services/storage
```

**Purpose:** Manage localStorage operations (save/retrieve tokens and user data)

### 4. Chatvik WhatsApp Service

```powershell
# Generate chatvik service
ng generate service core/services/chatvik

# Or
ng g s core/services/chatvik
```

**Purpose:** Handle Chatvik API integration (optional - can be done from backend)

---

## 🎨 Generate Components

### 1. Signup/Login Component

```powershell
# Generate signup component
ng generate component features/auth/signup --standalone

# Or with shorthand
ng g c features/auth/signup --standalone
```

**Purpose:** User enters name and mobile number to request magic link

### 2. OTP Verification Component

```powershell
# Generate OTP verification component
ng generate component features/auth/otp-verification --standalone

# Or
ng g c features/auth/otp-verification --standalone
```

**Purpose:** User enters OTP to verify and login

### 3. Dashboard Component

```powershell
# Generate dashboard component
ng generate component features/dashboard/dashboard --standalone

# Or
ng g c features/dashboard/dashboard --standalone
```

**Purpose:** Main dashboard after successful login

### 4. Magic Link Handler Component

```powershell
# Generate magic link component
ng generate component features/auth/magic-link --standalone

# Or
ng g c features/auth/magic-link --standalone
```

**Purpose:** Handles the magic link redirect and triggers OTP generation

### 5. Layout Components

```powershell
# Generate header component
ng generate component shared/components/header --standalone

# Generate footer component
ng generate component shared/components/footer --standalone

# Generate loading spinner component
ng generate component shared/components/loading-spinner --standalone
```

**Purpose:** Reusable UI components

---

## 🛡️ Generate Guards

### 1. Auth Guard (Route Protection)

```powershell
# Generate auth guard
ng generate guard core/guards/auth

# Select: CanActivate
# Or
ng g guard core/guards/auth
```

**Purpose:** Protect routes that require authentication

### 2. Guest Guard (Redirect if already logged in)

```powershell
# Generate guest guard
ng generate guard core/guards/guest

# Select: CanActivate
# Or
ng g guard core/guards/guest
```

**Purpose:** Redirect authenticated users away from login/signup pages

---

## 🔌 Generate Interceptors

### 1. Auth Interceptor (Add token to requests)

```powershell
# Generate auth interceptor
ng generate interceptor core/interceptors/auth

# Or
ng g interceptor core/interceptors/auth
```

**Purpose:** Automatically add JWT token to HTTP request headers

### 2. Error Interceptor (Handle HTTP errors)

```powershell
# Generate error interceptor
ng generate interceptor core/interceptors/error

# Or
ng g interceptor core/interceptors/error
```

**Purpose:** Centralized error handling for HTTP requests

---

## 📦 Generate Models/Interfaces

### 1. User Model

```powershell
# Create models directory
New-Item -Path "src/app/core/models" -ItemType Directory -Force

# Generate user interface
ng generate interface core/models/user --type=model

# Or
ng g interface core/models/user --type=model
```

**Purpose:** Define User interface

### 2. Auth Response Model

```powershell
# Generate auth response interface
ng generate interface core/models/auth-response --type=model

# Or
ng g interface core/models/auth-response --type=model
```

**Purpose:** Define API response structures

### 3. Magic Link Request Model

```powershell
# Generate magic link request interface
ng generate interface core/models/magic-link-request --type=model

# Or
ng g interface core/models/magic-link-request --type=model
```

**Purpose:** Define request payload structures

### 4. OTP Verification Model

```powershell
# Generate OTP verification interface
ng generate interface core/models/otp-verification --type=model

# Or
ng g interface core/models/otp-verification --type=model
```

**Purpose:** Define OTP verification payload structures

---

## 🌐 Generate Environment Configuration

### 1. Environment Files (if not exists)

```powershell
# Create environment directory
New-Item -Path "src/environments" -ItemType Directory -Force

# Create environment files manually or use:
# src/environments/environment.ts
# src/environments/environment.development.ts
```

---

## 📁 Project Structure Overview

After running all commands, your structure should look like:

```
src/app/
├── core/
│   ├── guards/
│   │   ├── auth.guard.ts
│   │   └── guest.guard.ts
│   ├── interceptors/
│   │   ├── auth.interceptor.ts
│   │   └── error.interceptor.ts
│   ├── models/
│   │   ├── user.model.ts
│   │   ├── auth-response.model.ts
│   │   ├── magic-link-request.model.ts
│   │   └── otp-verification.model.ts
│   └── services/
│       ├── auth.service.ts
│       ├── api.service.ts
│       ├── storage.service.ts
│       └── chatvik.service.ts
├── features/
│   ├── auth/
│   │   ├── signup/
│   │   │   ├── signup.component.ts
│   │   │   ├── signup.component.html
│   │   │   ├── signup.component.css
│   │   │   └── signup.component.spec.ts
│   │   ├── otp-verification/
│   │   │   ├── otp-verification.component.ts
│   │   │   ├── otp-verification.component.html
│   │   │   ├── otp-verification.component.css
│   │   │   └── otp-verification.component.spec.ts
│   │   └── magic-link/
│   │       ├── magic-link.component.ts
│   │       ├── magic-link.component.html
│   │       ├── magic-link.component.css
│   │       └── magic-link.component.spec.ts
│   └── dashboard/
│       └── dashboard/
│           ├── dashboard.component.ts
│           ├── dashboard.component.html
│           ├── dashboard.component.css
│           └── dashboard.component.spec.ts
├── shared/
│   └── components/
│       ├── header/
│       ├── footer/
│       └── loading-spinner/
└── app.routes.ts
```

---

## 🔄 Additional Utility Commands

### Generate Pipes

```powershell
# Phone number formatter pipe
ng generate pipe shared/pipes/phone-format --standalone

# Date formatter pipe
ng generate pipe shared/pipes/custom-date --standalone
```

### Generate Directives

```powershell
# Auto-focus directive
ng generate directive shared/directives/auto-focus --standalone

# Phone input mask directive
ng generate directive shared/directives/phone-mask --standalone
```

---

## 🧪 Testing Commands

```powershell
# Run all unit tests
ng test

# Run tests with code coverage
ng test --code-coverage

# Run tests in headless mode
ng test --browsers=ChromeHeadless --watch=false
```

---

## 🏃 Development Server

```powershell
# Start development server
ng serve

# Start with specific port
ng serve --port 4200

# Start and open in browser
ng serve --open

# Start with SSL
ng serve --ssl
```

---

## 🔨 Build Commands

```powershell
# Build for development
ng build

# Build for production
ng build --configuration production

# Build with output path
ng build --output-path dist/my-app

# Build and analyze bundle size
ng build --stats-json
npx webpack-bundle-analyzer dist/ngbookingfront/stats.json
```

---

## 📝 Next Steps

After generating all components and services:

1. **Configure Routes** in `app.routes.ts`
2. **Implement Services** with actual API integration logic
3. **Implement Components** with forms and UI
4. **Add Form Validations** using Angular Reactive Forms
5. **Configure Interceptors** in `app.config.ts`
6. **Set up Environment Variables** for API URLs and Chatvik credentials
7. **Add Styling** using CSS or a UI library (Material, Bootstrap, etc.)
8. **Implement Error Handling** across all components
9. **Add Loading States** for better UX
10. **Write Unit Tests** for services and components

---

## 🎯 Quick Reference - All Commands at Once

If you want to generate everything at once, copy and paste this block:

```powershell
# Services
ng g s core/services/auth
ng g s core/services/api
ng g s core/services/storage
ng g s core/services/chatvik

# Components
ng g c features/auth/signup --standalone
ng g c features/auth/otp-verification --standalone
ng g c features/auth/magic-link --standalone
ng g c features/dashboard/dashboard --standalone
ng g c shared/components/header --standalone
ng g c shared/components/footer --standalone
ng g c shared/components/loading-spinner --standalone

# Guards
ng g guard core/guards/auth
ng g guard core/guards/guest

# Interceptors
ng g interceptor core/interceptors/auth
ng g interceptor core/interceptors/error

# Interfaces
ng g interface core/models/user --type=model
ng g interface core/models/auth-response --type=model
ng g interface core/models/magic-link-request --type=model
ng g interface core/models/otp-verification --type=model

# Pipes
ng g pipe shared/pipes/phone-format --standalone

# Directives
ng g directive shared/directives/auto-focus --standalone
ng g directive shared/directives/phone-mask --standalone
```

---

## 📚 Additional Resources

- [Angular CLI Documentation](https://angular.dev/cli)
- [Angular Reactive Forms](https://angular.dev/guide/forms/reactive-forms)
- [Angular Routing](https://angular.dev/guide/routing)
- [RxJS Operators](https://rxjs.dev/api)
- [Chatvik API Documentation](https://chatvik.com/api-docs)

---

## 💡 Tips

1. **Always use `--standalone` flag** for new components in Angular 18+ (standalone components are the default)
2. **Use meaningful names** for components and services
3. **Follow Angular style guide** for naming conventions
4. **Keep services in core folder** for app-wide services
5. **Keep feature-specific components** in features folder
6. **Use shared folder** for reusable components, pipes, and directives
7. **Run tests frequently** to catch issues early
8. **Use Angular DevTools** browser extension for debugging

---

**Happy Coding! 🎉**
