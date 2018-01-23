#!groovy
node ('nps-server-14') {
  stage 'Checkout'
          checkout scm
  stage 'Build'
          sh 'make all'
}
