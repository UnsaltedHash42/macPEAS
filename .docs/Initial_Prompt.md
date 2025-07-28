# **Initial Prompt: Start Coding MacPEAS**

## **Project Goal**

The primary goal is to create a native macOS application in Objective-C that replicates the functionality of the macOS-specific checks found in the linpeas.sh script.

## **Your Role**

You are an expert Objective-C developer specializing in macOS applications. Your task is to build the MacPEAS application based on the provided development plan and adhere strictly to the coding conventions and project structure rules.

## **Core Task: Create the TaskRunner Helper Class**

Your first task is to begin coding. **Do not generate any new design or task list documents.** Instead, start by implementing the first task from the existing Task\_List.md:

1. **Task ID 1.1:** Create the TaskRunner utility class.  
2. Create the header file TaskRunner.h in the src/macPEAS/macPEAS/ directory.  
3. Create the implementation file TaskRunner.m in the src/macPEAS/macPEAS/ directory.  
4. Implement the class method \+ (NSString \*)runCommand:(NSString \*)command withArguments:(NSArray\<NSString \*\> \*)arguments; as specified in the development plan.  
5. Ensure the implementation is robust, handles potential errors gracefully (e.g., command not found), and properly captures stdout.

## **Context and Rules to Follow**

You **must** use the following documents as context for this and all subsequent tasks. Adherence to these guides is critical.

* **Main Development Plan:** @.docs/Design.md  
* **Task List:** @.docs/Task\_List.md  
* **Objective-C Style Guide:** @.docs/conventions/objective-c.md  
* **All Project Rules:** @.cursor/rules/  
* **Original Script for Reference:** linpeas (1).sh
