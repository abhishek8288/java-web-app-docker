node {
    stage('SCM Checkout') {
        git url: 'https://github.com/abhishek8288/java-web-app-docker.git', branch: 'master'
    }
    node {
    stage('SCM Checkout') {
        git url: 'https://github.com/abhishek8288/java-web-app-docker.git', branch: 'master'
    }
    
    stage("Maven Clean Package") {
        def mavenHome = tool name: "Maven", type: "maven"
        def mavenCMD = "${mavenHome}/bin/mvn"
        sh "${mavenCMD} clean package"
    }

    stage("Build Docker Image") {
        sh "docker build -t abhishek8288/java-web-app:6 ."
    }

    stage('Push Docker Image') {
        withCredentials([string(credentialsId: 'Docker_hub_password', variable: 'Dockerpassword')]) {
            sh "docker login -u abhishek8288 -p ${Dockerpassword}"
        }
        sh 'docker push abhishek8288/java-web-app:6'
    }
     
    stage('Run Docker Image on Server') {
        // Stop and remove any existing container with the same name
        sh 'docker stop java-web-app || true'
        sh 'docker rm java-web-app || true'

        // Remove any old images (optional)
        sh 'docker rmi -f $(docker images -q) || true'

        // Define the docker run command
        def dockerRun = 'docker run -d -p 8081:8080 --name java-web-app abhishek8288/java-web-app:6'

        // Run the new Docker container
        sh "${dockerRun}"
    }
}

    stage("Maven Clean Package") {
        def mavenHome = tool name: "Maven", type: "maven"
        def mavenCMD = "${mavenHome}/bin/mvn"
        sh "${mavenCMD} clean package"
    }

    stage("Build Docker Image") {
        sh "docker build -t abhishek8288/java-web-app:6 ."
    }

    stage('Push Docker Image') {
        withCredentials([string(credentialsId: 'Docker_hub_password', variable: 'Dockerpassword')]) {
            sh "docker login -u abhishek8288 -p ${Dockerpassword}"
        }
        sh 'docker push abhishek8288/java-web-app:6'
    }
     
    stage('Run Docker Image on Server') {
        // Define the docker run command
        def dockerRun = 'docker run -d -p 8081:8080 --name java-web-app abhishek8288/java-web-app:6'

        // Stop and remove any existing container
        sh 'docker stop java-web-app || true'
        sh 'docker rm java-web-app || true'

        // Remove any old images (optional)
        sh 'docker rmi -f $(docker images -q) || true'

        // Run the new Docker container
        sh "${dockerRun}"
    }
}
