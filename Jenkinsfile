#!groovy
node ('nps-server-14') {
   stage 'Checkout' 
          checkout scm
   stage 'Build' 
          sh 'make all  
  post {
    always {
    }
    success {
    }
    failure {
      mail to:"shimona@mellanox.com", subject:"FAILURE: ${currentBuild.fullDisplayName}", body: "Boo, we failed."
    }
    changed {
      mail to:"shimona@mellanox.com", subject:"CHANGED: ${currentBuild.fullDisplayName}", body: "Wow, our status changed!"
    }
  }
}
