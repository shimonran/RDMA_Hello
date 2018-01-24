#!groovy
pipeline {
  
  agent { label "nps-server-14" }
  stages {
    stage ("Checkout") {
          checkout scm
    }
    stage ("Build") { 
          sh 'make all'
    }
  }
  post {
    always {
    }
    success {
      mail to:"shimona@mellanox.com", subject:"SUCCESS: ${currentBuild.fullDisplayName}", body: "Yay, we passed."
    }
    failure {
      mail to:"shimona@mellanox.com", subject:"FAILURE: ${currentBuild.fullDisplayName}", body: "Boo, we failed."
    }
    changed {
      mail to:"shimona@mellanox.com", subject:"CHANGED: ${currentBuild.fullDisplayName}", body: "Wow, our status changed!"
    }
  }
}
