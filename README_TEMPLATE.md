
# RFSWARM-DOCKER  

[![Docker Pulls](https://img.shields.io/docker/pulls/estheniacollaboration/rfswarm-agent-base?style=flat)](https://hub.docker.com/r/estheniacollaboration/rfswarm-agent-base)
[![GitHub Repo Stars](https://img.shields.io/github/stars/Esthenia-collaboration/rfswarm-docker?style=flat)](https://github.com/Esthenia-collaboration/rfswarm-docker/stargazers)
[![Contributions Welcome](https://img.shields.io/badge/contributions-welcome-brightgreen.svg?style=flat)](https://github.com/Esthenia-collaboration/rfswarm-docker/issues)
[![License](https://img.shields.io/github/license/Esthenia-collaboration/rfswarm-docker?style=flat)](https://github.com/Esthenia-collaboration/rfswarm-docker/blob/main/LICENSE)

---

## 1. 🚀 Why?  

Performance testing is essential for evaluating software scalability, resilience, and detecting bottlenecks.  
However, performance testing is often excluded from test strategies due to:  
- Complex environments  
- Required technical skills  
- Specialized tools  
- Difficulty interpreting metrics  

**rfswarm-docker** was created to address these blockers by offering a reproducible, Docker-based environment to execute distributed Robot Framework performance tests.

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

### Step 1 — Pull an Agent image  


```bash
docker pull estheniacollaboration/rfswarm-agent-base:latest

```

### Step 2 Pull the Base Agent

```bash
docker pull ghcr.io/esthenia-collaboration/rfswarm-agent-base:latest

```

##  Run an Agent

To run an rfswarm Agent, use one of the prebuilt Agent Docker images. For example:

```bash
docker run -d --name rfswarm-agent \
  -p 8081:8081 \
  -v $(pwd)/tests:/src/agent/tests \
  estheniacollaboration/rfswarm-agent-base:latest

  ```

 ## Notes

- Replace `8081` with your preferred port if needed.
- Mount your test suites into the container (`-v $(pwd)/tests:/src/agent/tests`) so the Agent can access them.
- You can run multiple Agents by giving each container a unique name and port.


### Step 3 — Run the Manager

1. **Clone the repository:**

```bash
git clone https://github.com/Esthenia-collaboration/rfswarm-docker.git
cd rfswarm-docker/manager
docker build -t local/rfswarm-manager-base:latest .
docker images

- You should see local/rfswarm-manager-base in the list of images.

- The Manager container can be started using the settings defined in `compose-manager.yml`.  
- In this case providing a scenario file while running the manager image is mandatory.
A minimal `docker run` equivalent is:

```bash
docker run -d --name manager \
  -p 8138:8138 \
  -e DISPLAY=$DISPLAY \
  -v $(pwd)/tests/agent:/src/manager/scenarios \
  -v $(pwd)/tests/suites:/src/manager/scripts \
  -v $(pwd)/configuration:/src/manager/configuration \
  -v $(pwd)/reports:/src/reports \
  -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
  estheniacollaboration/rfswarm-manager-base:latest

```
  ## Run the Manager with `compose-manager.yml`

You can start the Manager container using Docker Compose to simplify environment setup.

### Steps

1. **Clone the repository:**

```bash
git clone https://github.com/Esthenia-collaboration/rfswarm-docker.git
  
```
2. **Navigate to the Manager directory:**

```bash
cd rfswarm-docker/manager
```

3. **Start the Manager with Docker Compose:**

```bash
docker-compose -f compose-manager.yml up -d
```

4. **Verify the container is running:**
```bash
docker ps
```

- The Manager should now be accessible on port 8138 (or the port you defined in the .env file or compose-manager.yml).

  ## Environment Variables

- `DISPLAY`: mandatory for GUI mode  
- `PORT`: manager port, default 8138  
- `CONFIG_FILE`: path to manager configuration file  
- `LOG_LEVEL`: verbosity level (1-5)  
- `DISPLAY_GUI`: enable GUI display (true/false)  
- `RUN_AUTOMATICALLY`: start scenario automatically  
- `AGENTS`: number of agents to use  
- `RESULTS_DIR`: directory for storing results  
- `SCENARIO_FILE`: optional scenario configuration file  
- `IPADDRESS`: optional, Manager IP address  
- `STARTTIME`: optional, scheduled start time for scenario  


## Notes

- Ensure the Manager container is on the same `rfswarm` network as your Agents if using multiple containers.  
- The GUI requires X11 forwarding (`/tmp/.X11-unix` volume).  


## 5. 📊 Metrics & Reporting

- **Metrics collected:** response time, success/failure rates, throughput  
- **Results storage:** results are stored in the `/reports` volume by default  
- **Export options:** results can be exported to CSV or HTML  
- **Optional integration:** metrics can be visualized using Grafana dashboards

## 6. Prerequisites

- Minimum required versions: Docker, Docker Compose, Python, Robot Framework  
- Supported OS: Linux, macOS, Windows WSL2  
- Permissions required for X11 if GUI mode is used  

## 7. Quick Test Example

- Provide a minimal Robot Framework scenario to run with an Agent  
- Example of executing a simple performance test with metric capture  

## 8. Configuration Examples

- Examples of `manager.yml` or `scenario.yml` files  
- Typical settings for `AGENTS`, `LOG_LEVEL`, `DISPLAY_GUI`  
- How to schedule a test using `STARTTIME`  

## 9. Docker Networking

- How to configure multiple Agents and the Manager on the same network (`rfswarm`)  
- Example:

```bash
docker network create rfswarm
```

## 10. Scaling and Parallel Execution

- Explain how to add multiple Agents to simulate more virtual users
- Example configuration for 10, 50, or 100 Agents 


## 📦 Available Agent Images

| Image Name                                                   | Status    | Description                                                                                   |
|--------------------------------------------------------------|-----------|-----------------------------------------------------------------------------------------------|
| **estheniacollaboration/rfswarm-agent-base**                 | ✅ Available | Debian + Python 3.x + rfswarm Agent + Robot Framework + RequestsLibrary + DataDriver          |
| **estheniacollaboration/rfswarm-agent-sshlibrary**           | ✅ Available | Base image + SSHLibrary                                                                       |
| **estheniacollaboration/rfswarm-agent-seleniumlibrary-chrome** | 🕒 In progress | Base image + SeleniumLibrary + Chrome browser                                                 |
| **estheniacollaboration/rfswarm-agent-seleniumlibrary-firefox** | ✅ Available  | Base image + SeleniumLibrary + Firefox browser                                                |



## 🔗 Useful Links

- **Rfswarm (original project)**  
  https://github.com/damies13/rfswarm

- **Rfswarm Documentation**  
  https://github.com/damies13/rfswarm/blob/master/Doc/README.md

- **Robot Framework**  
  https://robotframework.org/

- **rfswarm-docker Issues**  
  https://github.com/Esthenia-collaboration/rfswarm-docker/issues