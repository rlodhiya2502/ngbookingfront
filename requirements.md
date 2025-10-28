# 🚘 Passwordless Login System Requirements (Angular Frontend)

## 1. Overview

The goal is to allow users to **sign up and log in without a password** using their **mobile number** and **WhatsApp-based OTP verification**.
The process uses **Chatvik API** to send WhatsApp messages containing the **magic link** and **OTP**.

---

### 2. Flow Summary

1. **User enters their Name and Mobile Number.**
2. The system generates a **Magic Link** and sends it to the user’s **WhatsApp** via Chatvik API.
3. When the user **opens the Magic Link**, the system generates a **One-Time Password (OTP)**.
4. The system sends the **OTP via WhatsApp** using Chatvik API.
5. The user enters the **OTP** in the app.
6. If OTP is valid, the user is **logged in** and redirected to the dashboard (or booking page).

---

### 3. Technical Requirements

#### 3.1 Frontend Framework

* **Angular 18+**
* Use **TypeScript**, **RxJS**, and **Angular Reactive Forms**
* Use **Angular Router** for navigation
* Use **HttpClientModule** for API communication

#### 3.2 UI Components

* **Signup/Login Component**

  * Form fields:

    * Full Name (string)
    * Mobile Number (10–15 digits)
  * Button: “Get Magic Link”
* **OTP Verification Component**

  * Form fields:

    * OTP (6 digits)
  * Button: “Verify OTP”

#### 3.3 State Management

* Use Angular **Service** for authentication state.
* Store user token (JWT or session token) in **localStorage**.
* Handle **auto-login** on app refresh if token is valid.

---

### 4. Backend Interaction (API Requirements)

> Note: Backend can be Node.js, NestJS, or any secure API service.
> The following describes the expected endpoints for integration.

#### 4.1 Endpoint: `/api/auth/request-magic-link`

**Method:** POST
**Request Body:**

```json
{
  "name": "Ravi Lodhiya",
  "mobile": "84933313xxx"
}
```

**Server Actions:**

1. Validate user input.
2. Generate a **magic link token** (JWT or UUID).
3. Store it temporarily (valid for 10 minutes).
4. Use **Chatvik API** to send a WhatsApp message:

   ```
   https://chatvik.com/api/send?number=84933313xxx&type=text
   &message=Hi+Ravi,+click+the+link+to+continue:+https://yourapp.com/magic-login/{token}
   &instance_id=609ACF283XXXX
   &access_token=689c27f95a8b3
   ```

5. Respond with `{ success: true, message: "Magic link sent via WhatsApp" }`.

---

#### 4.2 Endpoint: `/api/auth/magic-login/:token`

**Method:** GET
**Actions:**

1. Validate the magic link token.
2. Generate a **6-digit OTP** (e.g. 123456).
3. Send OTP using Chatvik API:

   ```
   https://chatvik.com/api/send?number=84933313xxx&type=text
   &message=Your+OTP+is+123456+for+Drive+Booking
   &instance_id=609ACF283XXXX
   &access_token=689c27f95a8b3
   ```

4. Store OTP temporarily (valid for 5 minutes).
5. Redirect user to `/#/verify-otp?mobile=84933313xxx`.

---

#### 4.3 Endpoint: `/api/auth/verify-otp`

**Method:** POST
**Request Body:**

```json
{
  "mobile": "84933313xxx",
  "otp": "123456"
}
```

**Server Actions:**

1. Validate OTP and expiry.
2. If valid:

   * Generate **JWT access token**.
   * Return user profile and token.
3. Response:

```json
{
  "success": true,
  "token": "eyJhbGciOiJIUzI1NiIs...",
  "user": {
    "name": "Ravi Lodhiya",
    "mobile": "84933313xxx"
  }
}
```

---

### 5. Angular Integration

#### 5.1 Services

Create a service: `auth.service.ts`

* `requestMagicLink(name, mobile)`
* `verifyOtp(mobile, otp)`
* `getCurrentUser()`
* `logout()`

#### 5.2 Routes

| Path          | Component                | Auth Required |
| ------------- | ------------------------ | ------------- |
| `/signup`     | SignupComponent          | No            |
| `/verify-otp` | OtpVerificationComponent | No            |
| `/dashboard`  | DashboardComponent       | Yes           |

#### 5.3 Guards

* `AuthGuard` to protect private routes (dashboard, bookings, etc.)

---

### 6. Chatvik WhatsApp API Details

**Base URL:**

```
https://chatvik.com/api/send
```

**Parameters:**

| Parameter      | Type   | Description                   |
| -------------- | ------ | ----------------------------- |
| `number`       | string | Recipient’s WhatsApp number   |
| `type`         | string | Message type (`text`)         |
| `message`      | string | Encoded text message          |
| `instance_id`  | string | Your Chatvik instance ID      |
| `access_token` | string | Your Chatvik API access token |

**Example:**

```
https://chatvik.com/api/send?number=84933313xxx&type=text&message=Your+OTP+is+123456&instance_id=609ACF283XXXX&access_token=689c27f95a8b3
```

---

### 7. Security Considerations

* All tokens (magic link and OTP) must **expire quickly** (5–10 minutes).
* Use **HTTPS** for all frontend and backend communications.
* Rate limit OTP requests per mobile number.
* Use **JWT** for secure session handling.
* Sanitize and validate all input fields.

---

### 8. Future Enhancements

* Add **QR code login** (scan via WhatsApp).
* Add **browser/device recognition** to reduce OTP requests.
* Enable **auto-fill OTP** from WhatsApp message (if supported).

---
