# System Architecture

This repository holds the template and structural foundations for the Antigravity AI CTO development system.

## Core Loop
1. **Idea Ingestion**: The User triggers "Antigravity: [idea]".
2. **Context Establishment**: Agent loads the OS and rules.
3. **Execution**: The agent generates PRDs and sequentially processes tasks, storing output across the repository.

### Infrastructure Strategy
All communication strictly uses the `task_schema.json` for inter-agent context portability. This repo acts as the "Memory" layer module.
