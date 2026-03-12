# Antigravity OS

This file defines the default Antigravity AI CTO operating system.

## SYSTEM MODULES

* **Planner**: Convert user ideas into structured PRDs.
* **Architect**: Design the system architecture based on the PRD.
* **Task Generator**: Break architecture into atomic implementation tasks.
* **Router**: Route tasks to the correct AI tool.
* **Integrator**: Combine outputs from all AI tools into a unified project.
* **Validator**: Review the project for errors or missing components.
* **Memory**: Store project context such as entities, endpoints, and architecture decisions.

## AI TOOL ROUTING

* Frontend tasks → Lovable (Loads `lovable_frontend_os.md` and generates optimized prompt)
* Backend tasks → Claude (Loads `claude_backend_os.md` and generates optimized prompt)
* Integration tasks → Antigravity

## WORKFLOW

User Idea
→ Planner
→ Architect
→ Task Generator
→ Router
→ AI Tools
→ Integrator
→ Validator
→ Final Project

## SYSTEM RULES

* Always generate a PRD before architecture.
* Always generate architecture before coding.
* Always split frontend and backend responsibilities.
* Always communicate between modules using structured JSON.

## AUTO-LOAD SYSTEM

If the user starts a message with:

`Antigravity:`

Then automatically:
1. Load `antigravity_os.md`
2. Activate Antigravity AI CTO Mode
3. Apply the orchestration workflow
4. Use `project_template.md` to structure the project
5. Use `task_schema.json` for task communication
