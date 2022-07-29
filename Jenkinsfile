pipeline {
  agent any
  stages {
    stage('echo') {
      environment {
		    PHASSPHRASE = credentials('passphrase')
      }
      steps {
        echo 'hello from the trigger'
        echo "$params.skiptags"
        echo "$params.tag"
        sh '''
           set
           env
           echo "$params.vaultpass"
           echo "PHASSPHRASE=$PHASSPHRASE"
           ${WORKSPACE}/start_ssh_agent.sh ${PHASSPHRASE}
           echo "Build script completed"
        '''
      }
    }

  }
}
