<a name="readme-top"></a>

<!-- PROJECT SHIELDS -->

[![LinkedIn][linkedin-shield]][linkedin-url]

## About The Project

The provided tasks.json and copy-to-dev.bat files are part of a custom setup to streamline the process of deploying PHP application files or class files to a development server for testing. This setup is designed to work within the Visual Studio Code environment and leverages the editor's task running capabilities along with a batch script to automate the file copying process. Let's delve into the details of both components.

### Built With

Here's the current major frameworks/libraries I'm working with in the project so far. This may change.

- [![VSCode][VSCode]][VSCode-url]

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Explanation of tasks.json

tasks.json is a configuration file for Visual Studio Code that defines tasks to be executed within the editor. These tasks can be triggered manually or as part of other operations, such as building or debugging your project. The specific task defined in this tasks.json is designed to facilitate the deployment of PHP files to a development server.

### "label": "Copy_To_Dev"
This is the name of the task, which appears in the Visual Studio Code's tasks list. It's what you select when you want to execute this task.
### "type": "shell"
Indicates that the task will be executed in a shell (command line).
### "command": "C:\web\copy-to-dev.bat"
Specifies the command to run, in this case, it's pointing to the batch script copy-to-dev.bat. This script is responsible for the actual file copying.
### "args": []
A list of arguments passed to the batch script, including:
 - The directory and name of the file to copy (without extension),
 - The file's extension,
 - Paths and identifying strings for determining whether the file is an app file or a class file, and accordingly, where it should be copied on the dev server.

The "presentation" section controls how the task's output is displayed in Visual Studio Code, and the "group" section makes this task a default build task, meaning it can be quickly executed with a specific command (e.g., Ctrl+Shift+B in Windows).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Explanation of copy-to-dev.bat

copy-to-dev.bat is a batch script designed to copy the specified PHP file to the appropriate directory on the development server based on whether it's part of the application or a class file.

### Environment Variables Setup
Initially, it sets up variables with the paths and filenames passed as arguments from the tasks.json.
### Determination Logic
It then determines whether the file is an application file or a class file by checking if the source folder contains specific strings (appString, classString). Based on this check, it sets the target folder for copying.
### Copying Logic
If the file is a PHP file and matches the criteria for either an application file or a class file, it uses robocopy to copy the file to the determined target folder on the development server. The /is and /it flags ensure that the file is copied if it is newer than the destination file or if it is the same age.
### Error Handling
If the file does not meet the criteria (not a PHP file or does not match the app/class paths), it prints an error message and pauses execution.
This setup is efficient for developers working on PHP projects within Visual Studio Code, as it automates the process of deploying files to a development server for testing, saving time and reducing manual errors.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://www.linkedin.com/in/leo3/
[VSCode]: https://img.shields.io/badge/VS%20Code-0066B8?style=for-the-badge&logo=visualstudiocode&logoColor=white
[VSCode-url]: https://code.visualstudio.com
