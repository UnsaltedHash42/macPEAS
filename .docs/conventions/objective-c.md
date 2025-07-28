Objective-C Style Guide
This guide outlines the coding conventions for the MacPEAS project to ensure code consistency, readability, and maintainability.

Naming Conventions
Clarity is Key: Names should be descriptive and unambiguous. Avoid abbreviations.

Good: SystemInfoCollector

Bad: SysInfoCol

Classes: Use UpperCamelCase (e.g., NetworkInfo). Prefix class names with a unique identifier (e.g., MPCSystemInfoCollector) to avoid namespace collisions. For this project, we'll use MPC (MacPEAS Collector).

Methods: Use lowerCamelCase (e.g., collectSystemInfo). Method names should read like sentences if possible.

Good: -(void)setColor:(NSColor *)color;

Bad: -(void)set_color:(NSColor *)color;

Variables: Use lowerCamelCase (e.g., userName).

Constants: Use k followed by UpperCamelCase (e.g., kDefaultTimeoutInterval). For enums, use the NS_ENUM macro.

Code Formatting
Indentation: Use 4 spaces for indentation, not tabs.

Spacing:

Use a single space after keywords like if, for, while.

Use spaces around binary operators (=, +, -, etc.).

Method declarations should have a space after the - or + scope sign.

Braces:

Opening braces for if, else, switch, for, while statements should be on the same line as the statement.

Opening braces for method implementations should be on a new line.

Line Length: Keep lines under 120 characters for better readability.

Best Practices
Properties:

Use @property for declaring instance variables.

Use nonatomic for properties unless thread safety is explicitly required.

Use strong for object ownership, weak for weak references (to avoid retain cycles, especially with delegates), and copy for value objects like NSString and NSArray.

Initialization: Use designated initializers. The standard init method should call the designated initializer with default values.

Error Handling: Use NSError for error reporting in methods that can fail.

Comments: Use comments to explain why code is written a certain way, not what it does. The code itself should be self-documenting.

Imports: Use @import for modules/frameworks when possible. For individual headers, use #import.