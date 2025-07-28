# **MacPEAS Design Document**

## **1\. Overview**

MacPEAS is a native macOS application designed for security enumeration. It gathers system, user, network, and file permission information to identify potential privilege escalation vectors, mirroring the macOS checks in linpeas.sh.

## **2\. Architecture**

The application will use the **Model-View-Controller (MVC)** design pattern.

* **Model:** A set of Objective-C data objects representing the collected information (e.g., SystemInfo, User, NetworkInterface). These objects will be plain data containers.  
* **View:** The user interface, constructed using a Storyboard with AppKit controls (NSOutlineView, NSTableView).  
* **Controller:**  
  * A main ViewController will manage the UI and data display.  
  * A series of Collector classes (e.g., SystemInfoCollector) will be responsible for gathering specific categories of data.  
  * A TaskRunner utility class will handle the execution of shell commands.

## **3\. Core Components**

### **3.1. TaskRunner Utility**

* **Purpose:** To provide a centralized, reusable way to execute shell commands.  
* **Class:** TaskRunner  
* **Method:** \+ (NSString \*)runCommand:(NSString \*)command withArguments:(NSArray\<NSString \*\> \*)arguments;  
* **Implementation:** Uses NSTask and NSPipe to execute commands and capture stdout. Includes basic error handling.

### **3.2. Data Models**

A series of plain Objective-C objects will be created in the src/MacPEAS/Models/ directory to store data. Examples:

* SystemInfo.h/.m  
* User.h/.m  
* NetworkInfo.h/.m  
* FileSystemItem.h/.m

### **3.3. Data Collectors**

Each category of enumeration will have its own collector class in src/MacPEAS/Collectors/.

* **SystemInfoCollector.h/.m**: Collects OS version, kernel, hostname, etc.  
* **UserGroupCollector.h/.m**: Collects user and group information.  
* **NetworkInfoCollector.h/.m**: Collects network interface and port data.  
* ...and so on for each module.

## **4\. Feature Modules & Commands**

| Module | Collector Class | Key Commands to Execute |
| :---- | :---- | :---- |
| **System Info** | SystemInfoCollector | uname \-a, uptime, sysctl, csrutil status, spctl \--status, system\_profiler SPInstallHistoryDataType |
| **Users & Groups** | UserGroupCollector | dscl . list /Users, dscl . read, last \-n 20, pwpolicy getaccountpolicies |
| **Network Info** | NetworkInfoCollector | ifconfig \-a, \`netstat \-an |
| **Software Info** | SoftwareInfoCollector | system\_profiler SPApplicationsDataType, kextstat, brew list |
| **Permissions** | PermissionCollector | find / \-perm \-4000, find / \-perm \-2000, find / \-perm \-o=w |
| **Startup Items** | LaunchItemCollector | ls on LaunchAgent/Daemon paths, defaults read for plist parsing |

## **5\. User Interface**

* **Main Window:** A single window with a sidebar (NSOutlineView) for categories and a main content area.  
* **Content Area:** An NSTableView to display a list of items for the selected category. An NSTextView below it will show details for the selected item in the table.