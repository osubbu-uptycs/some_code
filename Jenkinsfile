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
                              name: 'MULTI_LINE_STRING'
                        ),
                        string(
                            defaultValue: 'scriptcrunch', 
                            name: 'STRING_PARAMETER', 
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
        echo "skiptags is $params.skiptags"
        echo "tags is $params.tag"
        sh '''
           set
           env
           echo "PARAMETER_01 is $PARAMETER_01"
           echo "BOOLEAN is $BOOLEAN"
           echo "MULTI_LINE_STRING is $MULTI_LINE_STRING"
           echo "STRING_PARAMETER is $STRING_PARAMETER"
           echo "vault password is $vaultpass"
           echo "PHASSPHRASE=$PHASSPHRASE"
           ${WORKSPACE}/start_ssh_agent.sh ${PHASSPHRASE}
           echo "Build script completed"
        '''
      }
    }

  }
}
