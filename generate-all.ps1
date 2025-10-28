# ========================================
# Angular Project Generator Script
# Passwordless Login System Implementation
# ========================================

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  Angular CLI Code Generator" -ForegroundColor Cyan
Write-Host "  Passwordless Login System" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Initialize counters
$successCount = 0
$failureCount = 0
$skippedCount = 0
$totalCommands = 0
$failedCommands = @()

# Function to execute ng command with error handling
function Invoke-NgCommand {
    param(
        [string]$Command,
        [string]$Description,
        [string]$Category
    )
    
    $script:totalCommands++
    Write-Host "[$script:totalCommands] $Category - $Description" -ForegroundColor Yellow
    Write-Host "    Command: $Command" -ForegroundColor Gray
    
    try {
        # Execute the command
        Invoke-Expression $Command 2>&1 | Out-Null
        
        if ($LASTEXITCODE -eq 0 -or $null -eq $LASTEXITCODE) {
            Write-Host "    ✓ Success" -ForegroundColor Green
            $script:successCount++
        }
        else {
            Write-Host "    ✗ Failed (Exit Code: $LASTEXITCODE)" -ForegroundColor Red
            $script:failureCount++
            $script:failedCommands += @{
                Command     = $Command
                Description = $Description
                Category    = $Category
            }
        }
    }
    catch {
        Write-Host "    ✗ Error: $_" -ForegroundColor Red
        $script:failureCount++
        $script:failedCommands += @{
            Command     = $Command
            Description = $Description
            Category    = $Category
            Error       = $_.Exception.Message
        }
    }
    
    Write-Host ""
    Start-Sleep -Milliseconds 500
}

# ========================================
# START GENERATION PROCESS
# ========================================

Write-Host "Starting code generation process..." -ForegroundColor Cyan
Write-Host ""
Start-Sleep -Seconds 1

# ========================================
# 1. CORE SERVICES
# ========================================

Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Magenta
Write-Host "  GENERATING CORE SERVICES" -ForegroundColor Magenta
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Magenta
Write-Host ""

Invoke-NgCommand `
    -Command "ng g s core/services/auth" `
    -Description "Authentication Service" `
    -Category "Service"

Invoke-NgCommand `
    -Command "ng g s core/services/api" `
    -Description "API Service" `
    -Category "Service"

Invoke-NgCommand `
    -Command "ng g s core/services/storage" `
    -Description "Storage Service" `
    -Category "Service"

Invoke-NgCommand `
    -Command "ng g s core/services/chatvik" `
    -Description "Chatvik WhatsApp Service" `
    -Category "Service"

# ========================================
# 2. COMPONENTS
# ========================================

Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Magenta
Write-Host "  GENERATING COMPONENTS" -ForegroundColor Magenta
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Magenta
Write-Host ""

Invoke-NgCommand `
    -Command "ng g c features/auth/signup --standalone" `
    -Description "Signup Component" `
    -Category "Component"

Invoke-NgCommand `
    -Command "ng g c features/auth/otp-verification --standalone" `
    -Description "OTP Verification Component" `
    -Category "Component"

Invoke-NgCommand `
    -Command "ng g c features/auth/magic-link --standalone" `
    -Description "Magic Link Component" `
    -Category "Component"

Invoke-NgCommand `
    -Command "ng g c features/dashboard/dashboard --standalone" `
    -Description "Dashboard Component" `
    -Category "Component"

Invoke-NgCommand `
    -Command "ng g c shared/components/header --standalone" `
    -Description "Header Component" `
    -Category "Component"

Invoke-NgCommand `
    -Command "ng g c shared/components/footer --standalone" `
    -Description "Footer Component" `
    -Category "Component"

Invoke-NgCommand `
    -Command "ng g c shared/components/loading-spinner --standalone" `
    -Description "Loading Spinner Component" `
    -Category "Component"

# ========================================
# 3. GUARDS
# ========================================

Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Magenta
Write-Host "  GENERATING GUARDS" -ForegroundColor Magenta
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Magenta
Write-Host ""

Invoke-NgCommand `
    -Command "ng g guard core/guards/auth" `
    -Description "Auth Guard (Route Protection)" `
    -Category "Guard"

Invoke-NgCommand `
    -Command "ng g guard core/guards/guest" `
    -Description "Guest Guard (Redirect Logged-in Users)" `
    -Category "Guard"

# ========================================
# 4. INTERCEPTORS
# ========================================

Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Magenta
Write-Host "  GENERATING INTERCEPTORS" -ForegroundColor Magenta
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Magenta
Write-Host ""

Invoke-NgCommand `
    -Command "ng g interceptor core/interceptors/auth" `
    -Description "Auth Interceptor (Add Token to Requests)" `
    -Category "Interceptor"

Invoke-NgCommand `
    -Command "ng g interceptor core/interceptors/error" `
    -Description "Error Interceptor (Handle HTTP Errors)" `
    -Category "Interceptor"

# ========================================
# 5. MODELS/INTERFACES
# ========================================

Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Magenta
Write-Host "  GENERATING MODELS/INTERFACES" -ForegroundColor Magenta
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Magenta
Write-Host ""

Invoke-NgCommand `
    -Command "ng g interface core/models/user --type=model" `
    -Description "User Model Interface" `
    -Category "Interface"

Invoke-NgCommand `
    -Command "ng g interface core/models/auth-response --type=model" `
    -Description "Auth Response Model Interface" `
    -Category "Interface"

Invoke-NgCommand `
    -Command "ng g interface core/models/magic-link-request --type=model" `
    -Description "Magic Link Request Model Interface" `
    -Category "Interface"

Invoke-NgCommand `
    -Command "ng g interface core/models/otp-verification --type=model" `
    -Description "OTP Verification Model Interface" `
    -Category "Interface"

# ========================================
# 6. PIPES
# ========================================

Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Magenta
Write-Host "  GENERATING PIPES" -ForegroundColor Magenta
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Magenta
Write-Host ""

Invoke-NgCommand `
    -Command "ng g pipe shared/pipes/phone-format --standalone" `
    -Description "Phone Format Pipe" `
    -Category "Pipe"

# ========================================
# 7. DIRECTIVES
# ========================================

Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Magenta
Write-Host "  GENERATING DIRECTIVES" -ForegroundColor Magenta
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Magenta
Write-Host ""

Invoke-NgCommand `
    -Command "ng g directive shared/directives/auto-focus --standalone" `
    -Description "Auto Focus Directive" `
    -Category "Directive"

Invoke-NgCommand `
    -Command "ng g directive shared/directives/phone-mask --standalone" `
    -Description "Phone Mask Directive" `
    -Category "Directive"

# ========================================
# GENERATION COMPLETE - SUMMARY
# ========================================

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  GENERATION SUMMARY" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

Write-Host "Total Commands Executed: $totalCommands" -ForegroundColor White
Write-Host "✓ Successful: $successCount" -ForegroundColor Green
Write-Host "✗ Failed: $failureCount" -ForegroundColor Red
Write-Host "⊘ Skipped: $skippedCount" -ForegroundColor Yellow
Write-Host ""

# Calculate success rate
$successRate = 0
if ($totalCommands -gt 0) {
    $successRate = [math]::Round(($successCount / $totalCommands) * 100, 2)
}

Write-Host "Success Rate: $successRate%" -ForegroundColor $(if ($successRate -ge 90) { "Green" } elseif ($successRate -ge 70) { "Yellow" } else { "Red" })
Write-Host ""

# Display failed commands if any
if ($failureCount -gt 0) {
    Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Red
    Write-Host "  FAILED COMMANDS" -ForegroundColor Red
    Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Red
    Write-Host ""
    
    $index = 1
    foreach ($failed in $failedCommands) {
        Write-Host "[$index] $($failed.Category) - $($failed.Description)" -ForegroundColor Red
        Write-Host "    Command: $($failed.Command)" -ForegroundColor Gray
        if ($failed.Error) {
            Write-Host "    Error: $($failed.Error)" -ForegroundColor DarkRed
        }
        Write-Host ""
        $index++
    }
}

# Display breakdown by category
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Cyan
Write-Host "  BREAKDOWN BY CATEGORY" -ForegroundColor Cyan
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Cyan
Write-Host ""
Write-Host "Services:     4 generated" -ForegroundColor White
Write-Host "Components:   7 generated" -ForegroundColor White
Write-Host "Guards:       2 generated" -ForegroundColor White
Write-Host "Interceptors: 2 generated" -ForegroundColor White
Write-Host "Interfaces:   4 generated" -ForegroundColor White
Write-Host "Pipes:        1 generated" -ForegroundColor White
Write-Host "Directives:   2 generated" -ForegroundColor White
Write-Host ""

# Next steps
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Cyan
Write-Host "  NEXT STEPS" -ForegroundColor Cyan
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Cyan
Write-Host ""
Write-Host "1. Configure routes in app.routes.ts" -ForegroundColor White
Write-Host "2. Implement service logic with API integration" -ForegroundColor White
Write-Host "3. Build component templates and forms" -ForegroundColor White
Write-Host "4. Add form validations using Reactive Forms" -ForegroundColor White
Write-Host "5. Configure interceptors in app.config.ts" -ForegroundColor White
Write-Host "6. Set up environment variables" -ForegroundColor White
Write-Host "7. Add styling (CSS/SCSS)" -ForegroundColor White
Write-Host "8. Implement error handling" -ForegroundColor White
Write-Host "9. Add loading states for better UX" -ForegroundColor White
Write-Host "10. Write and run unit tests" -ForegroundColor White
Write-Host ""

# Display generated file tree
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Cyan
Write-Host "  GENERATED FILE STRUCTURE" -ForegroundColor Cyan
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Cyan
Write-Host ""
Write-Host "src/app/" -ForegroundColor Yellow
Write-Host "├── core/" -ForegroundColor Yellow
Write-Host "│   ├── guards/" -ForegroundColor Yellow
Write-Host "│   │   ├── auth.guard.ts" -ForegroundColor Gray
Write-Host "│   │   ├── auth.guard.spec.ts" -ForegroundColor DarkGray
Write-Host "│   │   ├── guest.guard.ts" -ForegroundColor Gray
Write-Host "│   │   └── guest.guard.spec.ts" -ForegroundColor DarkGray
Write-Host "│   ├── interceptors/" -ForegroundColor Yellow
Write-Host "│   │   ├── auth.interceptor.ts" -ForegroundColor Gray
Write-Host "│   │   ├── auth.interceptor.spec.ts" -ForegroundColor DarkGray
Write-Host "│   │   ├── error.interceptor.ts" -ForegroundColor Gray
Write-Host "│   │   └── error.interceptor.spec.ts" -ForegroundColor DarkGray
Write-Host "│   ├── models/" -ForegroundColor Yellow
Write-Host "│   │   ├── user.model.ts" -ForegroundColor Gray
Write-Host "│   │   ├── auth-response.model.ts" -ForegroundColor Gray
Write-Host "│   │   ├── magic-link-request.model.ts" -ForegroundColor Gray
Write-Host "│   │   └── otp-verification.model.ts" -ForegroundColor Gray
Write-Host "│   └── services/" -ForegroundColor Yellow
Write-Host "│       ├── auth.service.ts" -ForegroundColor Gray
Write-Host "│       ├── auth.service.spec.ts" -ForegroundColor DarkGray
Write-Host "│       ├── api.service.ts" -ForegroundColor Gray
Write-Host "│       ├── api.service.spec.ts" -ForegroundColor DarkGray
Write-Host "│       ├── storage.service.ts" -ForegroundColor Gray
Write-Host "│       ├── storage.service.spec.ts" -ForegroundColor DarkGray
Write-Host "│       ├── chatvik.service.ts" -ForegroundColor Gray
Write-Host "│       └── chatvik.service.spec.ts" -ForegroundColor DarkGray
Write-Host "├── features/" -ForegroundColor Yellow
Write-Host "│   ├── auth/" -ForegroundColor Yellow
Write-Host "│   │   ├── signup/" -ForegroundColor Yellow
Write-Host "│   │   │   ├── signup.component.ts" -ForegroundColor Gray
Write-Host "│   │   │   ├── signup.component.html" -ForegroundColor Gray
Write-Host "│   │   │   ├── signup.component.css" -ForegroundColor Gray
Write-Host "│   │   │   └── signup.component.spec.ts" -ForegroundColor DarkGray
Write-Host "│   │   ├── otp-verification/" -ForegroundColor Yellow
Write-Host "│   │   │   ├── otp-verification.component.ts" -ForegroundColor Gray
Write-Host "│   │   │   ├── otp-verification.component.html" -ForegroundColor Gray
Write-Host "│   │   │   ├── otp-verification.component.css" -ForegroundColor Gray
Write-Host "│   │   │   └── otp-verification.component.spec.ts" -ForegroundColor DarkGray
Write-Host "│   │   └── magic-link/" -ForegroundColor Yellow
Write-Host "│   │       ├── magic-link.component.ts" -ForegroundColor Gray
Write-Host "│   │       ├── magic-link.component.html" -ForegroundColor Gray
Write-Host "│   │       ├── magic-link.component.css" -ForegroundColor Gray
Write-Host "│   │       └── magic-link.component.spec.ts" -ForegroundColor DarkGray
Write-Host "│   └── dashboard/" -ForegroundColor Yellow
Write-Host "│       └── dashboard/" -ForegroundColor Yellow
Write-Host "│           ├── dashboard.component.ts" -ForegroundColor Gray
Write-Host "│           ├── dashboard.component.html" -ForegroundColor Gray
Write-Host "│           ├── dashboard.component.css" -ForegroundColor Gray
Write-Host "│           └── dashboard.component.spec.ts" -ForegroundColor DarkGray
Write-Host "└── shared/" -ForegroundColor Yellow
Write-Host "    ├── components/" -ForegroundColor Yellow
Write-Host "    │   ├── header/" -ForegroundColor Yellow
Write-Host "    │   ├── footer/" -ForegroundColor Yellow
Write-Host "    │   └── loading-spinner/" -ForegroundColor Yellow
Write-Host "    ├── directives/" -ForegroundColor Yellow
Write-Host "    │   ├── auto-focus.directive.ts" -ForegroundColor Gray
Write-Host "    │   ├── auto-focus.directive.spec.ts" -ForegroundColor DarkGray
Write-Host "    │   ├── phone-mask.directive.ts" -ForegroundColor Gray
Write-Host "    │   └── phone-mask.directive.spec.ts" -ForegroundColor DarkGray
Write-Host "    └── pipes/" -ForegroundColor Yellow
Write-Host "        ├── phone-format.pipe.ts" -ForegroundColor Gray
Write-Host "        └── phone-format.pipe.spec.ts" -ForegroundColor DarkGray
Write-Host ""

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  SCRIPT COMPLETED" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Pause at the end
Write-Host "Press any key to exit..." -ForegroundColor Yellow
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
