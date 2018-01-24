#!groovy
node ('nps-server-14') {
  stage 'Checkout'
          checkout scm
  try {
    stage 'Build'
          sh 'make all'
  } catch (e) {
      mail to:"shimona@mellanox.com", subject:"FAILURE: ${currentBuild.fullDisplayName}", body: "Boo, we failed."
  } finally {
      mail to:"shimona@mellanox.com", subject:"SUCCESS: ${currentBuild.fullDisplayName}", body: "Yay, we passed."
  }
}
