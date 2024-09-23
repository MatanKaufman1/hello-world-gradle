# CI/CD in Github-actions to gradle-hello-world
## Java Hello World using the Gradle Wrapper and the Kotlin DSL
This is a Hello World project that contains the most important parts of the Gradle build scripts.
Using Github-actions pipeline, containerize with Docker and tag with auto-versioning.

## In this project:
- **Build with Gradle-Wrapper**: Build the Java source code using gradle-wrapper.
- **Auto-versioning SemVer**: Using _Git Automatic Semantic Versioning_ from Github-actions market.
- **Build and push**: Build and push into _Dockerhub_ with auto-versioning as tag.
- **Pull and run**: Pull and run from _Dockerhub_ for final run.

## My pipeline:
 **Versioning with 'actions'**.
   - use  _Git Automatic Semantic Versioning_ for auto-SemVer - supports the following Conventional commit messages type:\
   ```build, chore. ci, docs, fix, perf, refactor, revert, style, test ``` - will bump micro (patch) number\
   ```feat ``` - will bump minor version number\
   ```BREAKING CHANGE ``` - will bump major version number

 **Build - Compiles Hello World and creates JAR files**.
  - 2 jar files will be created:
  - gradle-hello-world-all.jar - this FAT JAR contains project classes and dependencies.
  - gradle-hello-world.jar - this is a regular JAR, contains only compiled source code(project class).

 **Push the Artifact with Docker**:
  - build and push image - Push the Docker image with the auto-generated version tag (semantic versioning).

 **Pull and run image**:
   - Pulls the Docker image from DockerHub and runs it locally for final testing.


## For local run:
 **Prerequisites**:
- **Operating System**: Ubuntu 24.04 (or similar Linux-based OS).\
    For extended stability.
- **Java**: OpenJDK 17.

 **Build**:
```
./gradlew build
- The jar files are located at gradle-hello-world/build/libs/
```

 **execute the jar file**:
```
- make the runnable jar executable:
chmod +x gradle-hello-world-all.jar
- execute jar file:
java -jar gradle-hello-world-all.jar
```