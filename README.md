
# RFSWARM-DOCKER

[![Docker Pulls](https://img.shields.io/docker/pulls/estheniacollaboration/rfswarm-agent-base?style=flat)](https://hub.docker.com/r/estheniacollaboration/rfswarm-agent-base)
[![GitHub Repo Stars](https://img.shields.io/github/stars/Esthenia-collaboration/rfswarm-docker?style=flat)](https://github.com/Esthenia-collaboration/rfswarm-docker/stargazers)
[![Contributions Welcome](https://img.shields.io/badge/contributions-welcome-brightgreen.svg?style=flat)](https://github.com/Esthenia-collaboration/rfswarm-docker/issues)
[![Open Source](https://img.shields.io/badge/license-open--source-brightgreen)](https://github.com/Esthenia-collaboration/rfswarm-docker/blob/main/LICENSE)


---

## 1. 🚀 Why?  

Performance testing is essential for evaluating software scalability, resilience, and detecting bottlenecks.  
However, performance testing is often excluded from test strategies due to:
- Complex environments
- Required technical skills
- Specialized tools
- Difficulty interpreting metrics

**rfswarm-docker** was created to address these blockers by offering a reproducible, Docker-based environment
to execute distributed Robot Framework performance tests.

---

## 2. 🧰 What is RFSWARM?

[Rfswarm](https://github.com/damies13/rfswarm) is an open-source performance testing tool built on **Robot Framework**.  
Its purpose is to **reuse existing Robot Framework test suites** and execute them in parallel as distributed virtual users.

### Key Features
- Full reuse of Robot Framework test suites (no duplication)
- Manager/Agent architecture optimized for load testing
- Horizontal scalability via multiple Agents
- Optional reporter for visualization
- Python-based and extensible

### Components

#### 🔹 Manager
Coordinates the performance test, assigns virtual users (robots), and synchronizes execution.

#### 🔹 Agent
Executes Robot Framework test cases.  
You can run one or hundreds of Agents across machines or containers.

#### 🔹 Reporter (optional)
Aggregates and visualizes performance metrics.  
By transforming functional tests into load-generating scenarios, rfswarm significantly reduces the effort needed to build performance tests.

---

## 3. 🐳 What is rfswarm-docker?

**rfswarm-docker** provides Docker images for the rfswarm Manager and Agents, enabling:
- Quick deployment
- Easy scaling
- Consistent execution environments
- CI/CD integration for performance pipelines

This repository includes several specialized Agent images and a Manager image.

---

## 4. ⚡ Quick Start

#### Using Pre-built Images
Pull and run a rfswarm Agent image
```bash
docker pull estheniacollaboration/rfswarm-agent-base:latest
docker run --rm --name agent estheniacollaboration/rfswarm-agent-base:latest
```

#### Using the GitHub Project
Clone the project
```bash
git clone https://github.com/Esthenia-collaboration/rfswarm-docker.git
cd rfswarm-docker
```

Copy `.env.example` to `.env` file to store your variables
```bash
cp .env.example .env
```

Start the Manager and the default (base) Agent or another agent if you change `AGENT_FOLDER` variable in `.env`
```bash
# Before running compose file, don't forget to update the env variable: {AGENT_FOLDER} in the .env file with the agent image you want to run. Ex: AGENT_FOLDER= seleniumlibrary-firefox
# then, to run base image or seleniumlibrary-firefox agent:
docker compose up -d --build
# or
# for ssh agent:
docker compose --profile sshlibrary up -d --build
```

#### Run the Manager and the Agent on separate machines
Set the variable `MANAGER` in the `.env` file and replace <MANAGER_IP_ADDRESS>  
with the IP address of the machine where the rfswarm manager is running
````text
MANAGER=http://<MANAGER_IP_ADDRESS>:${MANAGER_PORT:-8138}
````
Build and start the Agent
```bash
docker compose up -d --build agent
```
Build and start the Manager
```bash
docker compose up -d --build manager
```

---

## 5. Environment Variables

#### Manager variables
- `AGENTS`: number of agents to use (rfswarm `--agents` parameter)
- `CONFIG_FILE`: manager.ini configuration file (rfswarm `--ini` parameter)
- `DISPLAY_GUI`: enable GUI display (true/false) (DISPLAY_GUI=False equivalent of the rfswarm `--nogui` parameter)
- `IPADDRESS`: optional, Manager IP address (rfswarm `--ipaddress` parameter)
- `LOG_LEVEL`: log level (1-5) (rfswarm `--debug` parameter)
- `PORT`: manager port (rfswarm `--port` parameter, default `8138`)
- `RESULTS_DIR`: directory for storing results (rfswarm `--dir` parameter)
- `RUN_AUTOMATICALLY`: start scenario automatically (rfswarm `--run` parameter)
- `SCENARIO_FILE`: mandatory scenario configuration file (rfswarm `--scenario` parameter)
- `STARTTIME`: optional, scheduled start time for a scenario (rfswarm `--starttime` parameter)

#### Agent variables
- `AGENTNAME`:  agent name you want to use (Agent name available in the current release: base, seleniumlibrary-firefox, sshlibrary)
- `AGENTDIR`: directory the agent should use for files and run tests (rfswarm `--agentdir` parameter)
- `CONFIG_FILE`: path to alternate ini file (rfswarm `--ini` parameter for agent)
- `DISPLAY`: mandatory for GUI mode (use for the seleniumlibrary-firefox and seleniumlibrary-chrome images)
- `LOG_LEVEL`: log level (1-5) (rfswarm `--debug` parameter)
- `MANAGER`: URL to contact the manager (rfswarm `--manager` parameter, default: `http://manager:8138`)
- `PROPERTY<N>`: can add custom properties as your need to make filter easier (rfswarm `--property` parameter, example: PROPERTY1=docker)
- `ROBOT`: The robot framework executable if needed to specify (rfswarm `--robot` parameter)

---

## 6. 📊 Metrics & Reporting

- **Metrics collected:** response time, success/failure rates, throughput
- **Results storage:** results are stored in the `/reports` volume by default
- **Export options:** results can be exported to CSV or HTML
- **Optional integration:** metrics can be visualized using Grafana dashboards

---

## 7. Prerequisites

- Minimum required versions: Docker
- Required if you run manager locally: Python, Robot Framework
- Supported OS: Linux, macOS, Windows with WSL2
- Permissions are required for X11 if GUI mode is used

---

## 8. Quick Test Example

- Provide a minimal Robot Framework scenario to run with an Agent
- Example of executing a simple performance test with metric capture

---

## 9. Configuration Examples

- Examples of `manager.yml` or `scenario.yml` files
- Typical settings for `AGENTS`, `LOG_LEVEL`, `DISPLAY_GUI`
- How to schedule a test using `STARTTIME`

---

## 10. TODO: 
**Scaling and Parallel Execution**

- Explain how to add multiple Agents to simulate more virtual users
- Example configuration for 10, 50, or 100 Agents 

## 📦 Available Agent Images

| Image Name                                                      | Status    | Description                                                                                           |
|-----------------------------------------------------------------|-----------|-------------------------------------------------------------------------------------------------------|
| **estheniacollaboration/rfswarm-agent-base**                    | ✅ Available | Debian + Python 3.x + rfswarm Agent + Robot Framework + RequestsLibrary + DataDriver  +  FakerLibrary |
| **estheniacollaboration/rfswarm-agent-sshlibrary**              | ✅ Available | base + SSHLibrary                                                                                     |
| **estheniacollaboration/rfswarm-agent-seleniumlibrary-chrome**  | 🕒 In progress | base + SeleniumLibrary + Chrome browser                                                               |
| **estheniacollaboration/rfswarm-agent-seleniumlibrary-firefox** | ✅ Available  | base + SeleniumLibrary + Firefox browser                                                              |
| **estheniacollaboration/rfswarm-manager**                       | 📅 Upcoming | Debian + Python 3.x + rfswarm Manager + Robot Framework                                               |

## 📦 Agent Images packages versions

**rfswarm-agent-base**

  | Package                   | Version    |
  |---------------------------|------------|
  | certifi                   | 2025.11.12 |
  | charset-normalizer        | 3.4.4      |
  | configparser              | 7.2.0      |
  | docutils                  | 0.22.3     |
  | Faker                     | 38.2.0     |
  | idna                      | 3.11       |
  | psutil                    | 7.1.3      |
  | Pygments                  | 2.19.2     |
  | PyYAML                    | 6.0.3      |
  | requests                  | 2.32.5     |
  | rfswarm-agent             | 1.5.3      |
  | robotframework            | 7.3.2      |
  | robotframework-datadriver | 1.11.2     |
  | robotframework-faker      | 6.0.0      |
  | robotframework-requests   | 0.9.7      |
  | tzdata                    | 2025.2     |
  | urllib3                   | 2.5.0      |
  | wrapt                     | 2.0.1      |

**rfswarm-agent-sshlibrary**

| Package                   | Version    |
  |---------------------------|------------|
  | bcrypt                    | 5.0.0      |
  | cffi                      | 2.0.0      |
  | configparser              | 7.2.0      |
  | cryptography              | 46.0.3     |
  | invoke                    | 2.2.1      |
  | paramiko                  | 4.0.0      |
  | pycparser                 | 2.23       |
  | PyNaCl                    | 1.6.1      |
  | robotframework-sshlibrary | 3.8.0      |
  | scp                       | 0.15.0     |

**rfswarm-agent-seleniumlibrary-firefox**
  | Package                        | Version     |
  |--------------------------------|-------------|
  | attrs                          | 25.4.0      |
  | click                          | 8.3.1       |
  | h11                            | 0.16.0      |
  | outcome                        | 1.3.0.post0 |
  | PySocks                        | 1.7.1       |
  | robotframework-pythonlibcore   | 4.4.1       |
  | robotframework-seleniumlibrary | 6.8.0       |
  | selenium                       | 4.38.0      |
  | sniffio                        | 1.3.1       |
  | sortedcontainers               | 2.4.0       |
  | trio                           | 0.32.0      |
  | trio-websocket                 | 0.12.2      |
  | typing_extensions              | 4.15.0      |
  | websocket-client               | 1.9.0       |
  | wsproto                        | 1.3.2       |

## 🔗 Useful Links

- **Rfswarm (original project)**  
  https://github.com/damies13/rfswarm

- **Rfswarm Documentation**  
  https://github.com/damies13/rfswarm/blob/master/Doc/README.md

- **Robot Framework**  
  https://robotframework.org/

- **rfswarm-docker Issues**  
  https://github.com/Esthenia-collaboration/rfswarm-docker/issues