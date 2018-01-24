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
    mail to:"shimona@mellanox.com", subject:"FAILURE: ${currentBuild.fullDisplayName}", body: "Boo, we failed."
  } finally {
    echo "Build success"
    if ( currentBuild.getPreviousBuild().getResult().equals("FAILED") ) {
      echo "Build success after fail"
       mail to:"shimona@mellanox.com", subject:"SUCCESS: ${currentBuild.fullDisplayName}", body: "Yay, we returned to success."
    }
  }
  echo "Finished"
}
