pipeline {

  agent any

  stages {

    stage('Checkout Source') {
      steps {
        git url:'https://github.com/vikro2021/demo1.git', branch:'master'
      }
    }
    
      stage("Build image") {
            steps {
                script {
                    myapp = docker.build("vikro2021/demo1:${env.BUILD_ID}")
                }
            }
        }
    
      stage("Push image") {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'dockerhub_id') {
                            myapp.push("latest")
                            myapp.push("${env.BUILD_ID}")
                    }
                }
            }
        }

    

    stage('Deploy App') {
      steps {
        script {
          kubernetesDeploy(configs: "vikro-nginx-deployment.yaml", kubeconfigId: "cfd8d21c-40ee-4b17-af4e-a7bfa46be198")
        }
      }
    }

  }

}