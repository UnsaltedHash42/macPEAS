# **Project Initialization: MacPEAS**

1\. Project Name:  
MacPEAS  
2\. Brief Description:  
The main goal is to create a native macOS application in Objective-C that replicates the functionality of the macOS-specific enumeration and privilege escalation checks found in the linpeas.sh script. It will provide a user-friendly interface to display security-relevant information about the local system.  
**3\. Key Features/Functionality:**

* System Information (OS, Kernel, Security Features)  
* User & Group Enumeration  
* Network Configuration and Open Ports  
* Installed Software and Kernel Extensions  
* SUID/SGID and World-Writable File Scanning  
* LaunchAgent and LaunchDaemon Enumeration

4\. Target Users/Audience:  
Security professionals, penetration testers, and system administrators conducting security audits on macOS systems.  
**5\. Constraints or Requirements:**

* **Language:** Must be written in Objective-C.  
* **Frameworks:** Must use native macOS frameworks (Foundation, AppKit). No cross-platform toolkits.  
* **Dependencies:** Avoid external dependencies where possible.  
* **Workflow:** Must adhere to all rules and conventions defined in the .cursor/rules/ directory.

6\. Success Criteria:  
The application successfully and accurately gathers the same macOS-specific information as the linpeas.sh script and presents it in a clear, organized UI. The project structure and code adhere to all provided conventions.  
7\. Anything Else?:  
Your first task is to generate a detailed Design.md and a Task\_List.md based on this information and place them in the .docs/ folder. After that, the first coding task will be to create a TaskRunner.m helper class for executing shell commands.