#!groovy
node ('nps-server-14') {
  stage 'Checkout'
          checkout scm
  try {
    stage 'Build'
          sh 'make all'
  } catch (e) {
    echo "Build failed"
    currentBuild.result = "FAILED"
    mail to:"shimona@mellanox.com", 
         subject:"FAILURE: ${currentBuild.fullDisplayName}", 
         body:"FAILED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]': Check console output at ${env.BUILD_URL}"   
    throw e
  } finally {
    if ( currentBuild.getPreviousBuild().getResult().equals("FAILURE") ) {
       echo "Build success after fail"
       mail to:"shimona@mellanox.com", 
            subject:"SUCCESS: ${currentBuild.fullDisplayName}", 
            body: "Yay, we returned to success."
    }
  }
}
