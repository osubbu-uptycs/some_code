pipeline {
  agent any
  stages {
    stage('echo') {
      environment {
		    PHASSPHRASE = credentials('passphrase')
      }
      steps {
        echo 'hello from the trigger'
        echo "skip tags is $params.skiptags"
        echo "tag is $params.tag"
        sh '''
           set
           env
           echo "vault password is $vaultpass"
           echo "PHASSPHRASE=$PHASSPHRASE"
           ${WORKSPACE}/start_ssh_agent.sh ${PHASSPHRASE}
           echo "Build script completed"
        '''
      }
    }

  }
}
