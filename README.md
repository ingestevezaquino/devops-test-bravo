# DevOps Test Bravo

- This repository contains all necesary code to meet requirements made for the devops test.
- Each folder contains its README.md with respective instructions.

At the end, you should be able to access this screen:

![image](https://github.com/ingestevezaquino/devops-test-bravo/assets/74105278/e4b855ac-e7dc-4033-87c5-2c858fb0a4e3)

---

Jenkinsfile:

**In order to use this pipeline, make sure you have installed the following tools on jenkins' executing agent:**

1. Docker.
2. Docker Compose.
3. Java 17.
4. Maven.
5. NodeJS.
6. Git.

**In order to configure this pipeline, do the following:**

1. Create a Jenkins pipeline and go to its configuration.
2. In **Definition** choose `Pipeline script from SCM`.
3. Then SCM `git`.
4. Finally put this repo url and the master branch.

![image](https://github.com/ingestevezaquino/devops-test-bravo/assets/74105278/e4b0c946-86e2-4027-8665-da163d948951)

**In order to run this pipeline for a specific target environment, please adjust this environmental variable on pipeline:**

![image](https://github.com/ingestevezaquino/devops-test-bravo/assets/74105278/64ac0629-93ac-4aba-8e56-89612e25ad87)

**Make sure to use one of these:** `'dev'`, `'stg'` or `'prod'`.
