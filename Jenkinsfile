node{
     
    stage('SCM Checkout'){
        git url: 'https://github.com/abhishek8288/java-web-app-docker.git',branch: 'master'
    }
    
   stage(" Maven Clean Package"){
      def mavenHome=  tool name: "Maven", type: "maven"
      def mavenCMD = "${mavenHome}/bin/mvn"
sh "${mavenCMD} clean package"
    } 
     
stage("Build Docker Image") {
sh "docker build -t abhishek8288/java-web-app:${6} ."
    }

    stage('Push Docker Image'){
           withCredentials([string(credentialsId: 'Docker_hub_password', variable: 'Dockerpassword')]) {
          sh "docker login -u abhishek8288 -p ${Dockerpassword}"
        }
        sh 'docker push abhishek8288/java-web-app:6'
     }
     
      stage('Run Docker Image In Dev Server'){
        
        def dockerRun = ' docker run  -d -p 8080:8080 --name java-web-app abhishek8288/java-web-app'
         
         sshagent(['DOCKER_SERVER']) {
          sh 'ssh -o StrictHostKeyChecking=no ubuntu@13.210.204.140 docker stop java-web-app || true'
          sh 'ssh  ubuntu@13.210.204.140 docker rm java-web-app || true'
          sh 'ssh  ubuntu@13.210.204.140 docker rmi -f  $(docker images -q) || true'
          sh "ssh  ubuntu@13.210.204.140 ${dockerRun}"
       }  
    }
}
