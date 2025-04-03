# Using renv for Reproducible Environments in R

This guide explains how to set up and use `renv` to create an isolated and reproducible environment for this project.

## What is renv?

`renv` is an R package that provides project-specific package management for R. It creates isolated environments for each project, similar to Python's virtualenv or conda environments. This helps ensure that your project runs consistently across different systems.

## Important: Where to Run renv Commands

### ⚠️ Common Mistake: Running R Commands in PowerShell

If you see this error:
```
install.packages : The term 'install.packages' is not recognized as the name of a cmdlet, function...
```

This means you're trying to run R commands in PowerShell or Command Prompt. R commands like `install.packages()` must be run inside an R environment, not directly in your system terminal.

### Using the R Interactive Window in VS Code

If you're using VS Code's R Interactive Window:

1. **Open the R Interactive Window**:
   - Press Ctrl+Shift+P to open the command palette
   - Type "R: Create R Terminal" and select it
   - OR click the "R: Interactive" button in the top-right corner of an R script

2. **Run Commands in the R Interactive Window**:
   - Type commands directly in the interactive window where you see the `>` prompt
   - OR write commands in an R script and select them, then press Ctrl+Enter to send to the interactive window
   - The R Interactive window behaves like a regular R console

3. **Using R Interactive for renv**:
   - All renv commands should be run in this interactive window
   - You'll see the R prompt (`>`) where you can enter commands
   - Make sure to run the commands one at a time and wait for each to complete

### Alternative Ways to Run R Commands in VS Code

1. **R Terminal in VS Code**:
   - Open VS Code
   - Go to Terminal menu → New Terminal
   - In the terminal dropdown (where it might say "powershell" or "cmd"), click and select "R"
   - If "R" is not available, you may need to configure R in VS Code settings

2. **R Console Command Prompt**:
   - When in the R environment, you'll see a prompt like this: `>` 
   - Run commands after this prompt: `> install.packages("renv")`
   - This is different from the PowerShell prompt: `PS C:\>`

## Setting Up renv for This Project

### Step 1: Launch R Interactive in VS Code

1. Open VS Code
2. Open an R script file (or create a new one with .R extension)
3. Press Ctrl+Shift+P and run "R: Create R Terminal" 
4. You should see the R Interactive window with the `>` prompt

### Step 2: Install renv

In the R Interactive window, run:

```R
install.packages("renv")
```

### Step 3: Navigate to the Project Directory

Still in the R Interactive window, set your working directory to the project:

```R
setwd("c:/visual studio code/PROJECTS/github/gfpop-time-dependent-constraints/easy_test")  # Use forward slashes in R
```

### Step 4: Initialize the Project Environment

This creates a private library for your project:

```R
renv::init()
```

After initialization, you'll see:
- A `.Rprofile` file that activates renv when you open the project
- A `renv.lock` file that tracks package versions
- A `renv/` directory containing the project library

### Step 5: Install Required Packages

Install the project's dependencies in the isolated environment:

```R
renv::install(c("gfpop", "igraph"))
```

### Step 6: Save the Current State

After installing packages, save the state of your environment:

```R
renv::snapshot()
```

This updates the `renv.lock` file with exact versions of all installed packages.

## Alternative: Launching R Directly

If you prefer to use R outside of VS Code:

1. Open the R application (Start menu → R → R x64)
2. In the R console, run the commands starting from Step 2 above

## Using the Environment

### Activating the Environment

When opening the project, renv should activate automatically. If not, run:

```R
renv::activate()
```

### Deactivating the Environment

To temporarily revert to your global R library:

```R
renv::deactivate()
```

### Updating Packages

After adding or removing packages, update the lock file:

```R
renv::snapshot()
```

### Restoring the Environment from Lock File

To recreate the exact environment from the lock file (useful when sharing the project):

```R
renv::restore()
```

## Working with VS Code for R Projects

For the best experience:

1. Open the `easy_test` folder in VS Code
2. Create or modify VS Code settings for R in `.vscode/settings.json`:
   ```json
   {
     "r.rterm.windows": "C:/Program Files/R/R-4.x.x/bin/R.exe",  # Update with your R installation path
     "r.sessionWatcher": true,
     "r.bracketedPaste": true
   }
   ```
3. Use the R Interactive window for all R commands including package management
4. You can write scripts in .R files and send portions to the R Interactive window with Ctrl+Enter

## Troubleshooting

If you encounter issues:

- **Cannot find R Interactive in VS Code**: Make sure the R extension is installed (search for "R" in the extensions marketplace)
- **R Interactive not starting**: Check VS Code settings to ensure your R installation path is correct
- **Missing packages:** Run `renv::restore()` to reinstall all packages from the lock file
- **Package conflicts:** Run `renv::snapshot(type = "all")` to include all packages in the lock file
- **Need to start fresh:** Delete the `renv/` directory and `.Rprofile`, then run `renv::init()` again
