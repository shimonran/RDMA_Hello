#!groovy
node ('nps-server-14') {
  stage 'Checkout'
          checkout scm
  try {
    stage 'Build'
          sh 'make all'
  } catch (e) {
    echo "Build failed"
    mail to:"shimona@mellanox.com", subject:"FAILURE: ${currentBuild.fullDisplayName}", body: "Boo, we failed."
  } finally {
    echo "Build success"
    echo currentBuild.getPreviousBuild().getResult()
    if ( currentBuild.getPreviousBuild().getResult().equals("FAILURE") ) {
       echo "Build success after fail"
       mail to:"shimona@mellanox.com", subject:"SUCCESS: ${currentBuild.fullDisplayName}", body: "Yay, we returned to success."
    }
  }
  echo "Finished"
}
