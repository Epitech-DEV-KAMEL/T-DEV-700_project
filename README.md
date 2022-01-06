# CashManager

#### Cash Manager application
![GitHub CI Action](https://github.com/Epitech-DEV-KAMEL/T-DEV-700_project/actions/workflows/flutter.yml/badge.svg)

## 💾 Install CashManager


#### 📡 Add deps
First you will need to install dependencies from node. Type `cd bank_server` & `mvn dependency:resolve`

### 🛠 Deploy CashManager

#### For all platform using docker 
All the applications can be deployed in Kubernetes or with Docker-compose. Our infrastructure use docker-compose. First, you will need to create network to running the container. Type `docker network create cashmanaer-net`. Finally, you just have to run `docker-compose up` you can add the -d option to run docker in background. Be careful to configure your own .env using the template in .env.default

#### For all platform using Kubernetes
To deploy in kubernetes our CashManager Pods, you'll need to configure your own .env and put all files from the folder Kubernetes in the root path of the project. After that you need to type `kubectl apply -f <output file>`. The API will be accessible at `https://FRONT_HOST/api`


#### Project realised by:
- **[@Even P.](https://github.com/Alphamplyer)**
- **[@Mohamed M.](https://github.com/datVaulting)**
