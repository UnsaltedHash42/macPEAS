# **MacPEAS \- macOS Enumeration Tool**

MacPEAS is a native macOS application for security enumeration and privilege escalation checking. It is designed to be a fast, comprehensive tool for security professionals and system administrators to audit the security posture of a macOS system.

This project is an Objective-C rewrite of the macOS-specific checks found in the highly-regarded linpeas.sh script.

## **Features**

* **System Information:** Gathers details about the OS, kernel, and active security mechanisms like SIP and Gatekeeper.  
* **User & Group Enumeration:** Lists all users, groups, and analyzes password policies and login history.  
* **Network Analysis:** Scans for open ports, running services, and network configurations.  
* **Software Inventory:** Identifies installed applications, third-party kernel extensions, and Homebrew packages.  
* **Permission Auditing:** Scans for SUID/SGID binaries and world-writable files that could be vectors for privilege escalation.  
* **Startup Item Enumeration:** Lists all LaunchAgents and LaunchDaemons to identify persistence mechanisms.

## **Getting Started**

### **Prerequisites**

* Xcode 13 or later  
* macOS Monterey (12.0) or later

### **Building the Project**

1. Clone the repository.  
2. Open the MacPEAS.xcodeproj file in Xcode.  
3. Select the MacPEAS scheme and a build target (e.g., "My Mac").  
4. Press **Cmd+B** to build the project or **Cmd+R** to build and run.

## **Roadmap**

* \[ \] **Feature Parity:** Ensure all relevant macOS checks from linpeas.sh are implemented.  
* \[ \] **Data Export:** Add functionality to export enumeration results to JSON or plain text.  
* \[ \] **Mythic Agent Integration:** Develop a module to allow the MacPEAS enumeration capabilities to be triggered from a Mythic C2 agent.

## **Acknowledgements**

This project is heavily inspired by and based on the work of **Carlos Polop** and the entire **PEASS-ng** project. A huge thank you for creating such an invaluable tool for the security community.

* **PEASS-ng Project:** [https://github.com/carlospolop/PEASS-ng](https://github.com/carlospolop/PEASS-ng)