pipeline {
  agent any
  stages {
    stage('Setup parameters') {
        steps {
            script { 
                properties([
                    parameters([
                        choice(
                            choices: ['ONE', 'TWO'], 
                            name: 'PARAMETER_01'
                        ),
                        booleanParam(
                            defaultValue: true, 
                            description: '', 
                            name: 'BOOLEAN'
                        ),
                        text(
                            defaultValue: '''
                            this is a multi-line 
                            string parameter example
                            ''', 
                              name: 'MULTI-LINE-STRING'
                        ),
                        string(
                            defaultValue: 'scriptcrunch', 
                            name: 'STRING-PARAMETER', 
                            trim: true
                        )
                    ])
                ])
            }
        }
    }
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
           echo "vault password is $vaultpass"
           echo "PHASSPHRASE=$PHASSPHRASE"
           ${WORKSPACE}/start_ssh_agent.sh ${PHASSPHRASE}
           echo "Build script completed"
        '''
      }
    }

  }
}
