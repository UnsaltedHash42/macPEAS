# **MacPEAS Development Task List**

| ID | Description | Dependencies | Status | Priority | Estimation | Notes |
| :---- | :---- | :---- | :---- | :---- | :---- | :---- |
| **Phase 1: Core Foundation** |  |  |  |  |  |  |
| 1.1 | Create TaskRunner utility class | None | Complete | High | 2h | Central class for running shell commands. |
| 1.2 | Create data models for all modules | None | Complete | High | 3h | SystemInfo, User, Group, NetworkInfo, etc. |
| T1.1 | Write unit tests for TaskRunner | 1.1 | Complete | High | 1h | Test command execution and output parsing. |
| C1 | Core Foundation Complete | 1.1, 1.2, T1.1 | In Progress |  |  | Base classes and utilities are ready. |
| **Phase 2: UI and Data Collection** |  |  |  |  |  |  |
| 2.1 | Build basic UI with sidebar and table view | C1 | Pending | High | 4h | Use NSOutlineView and NSTableView. |
| 2.2 | Implement SystemInfoCollector | C1 | Pending | High | 2h | Gather OS, kernel, and security info. |
| 2.3 | Connect SystemInfoCollector to UI | 2.1, 2.2 | Pending | High | 1h | Display system info in the table view. |
| T2.1 | Write unit tests for SystemInfoCollector | 2.2 | Pending | Medium | 1h | Mock TaskRunner to test parsing logic. |
| 2.4 | Implement UserGroupCollector | C1 | Pending | High | 3h | Gather all user and group data. |
| 2.5 | Connect UserGroupCollector to UI | 2.1, 2.4 | Pending | High | 1h | Display users and groups. |
| C2 | System & User Info Complete | 2.3, T2.1, 2.5 | Pending |  |  | First two modules are fully functional. |
| **Phase 3: Remaining Modules** |  |  |  |  |  |  |
| 3.1 | Implement NetworkInfoCollector and connect to UI | C2 | Pending | High | 4h |  |
| 3.2 | Implement SoftwareInfoCollector and connect to UI | C2 | Pending | High | 4h |  |
| 3.3 | Implement PermissionCollector and connect to UI | C2 | Pending | High | 4h | SUID, SGID, writable files. |
| 3.4 | Implement LaunchItemCollector and connect to UI | C2 | Pending | High | 4h | LaunchAgents & Daemons. |
| C3 | All Features Implemented | 3.1, 3.2, 3.3, 3.4 | Pending |  |  | Application is feature-complete. |

