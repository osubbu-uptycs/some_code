pipeline{
  agent any 

  environment {
		PHASSPHRASE = credentials('passphrase')
  }
  
  parameters {
    gitParameter(
      branch: '',
      branchFilter: "",
      defaultValue: "",
      description: 'Version number to deploy',
      listSize: '10',
      name: 'version',
      quickFilterEnabled: false,
      selectedValue: 'NONE',
      sortMode: 'DESCENDING_SMART',
      tagFilter: "*",
      type: 'PT_TAG',
      useRepository: 'https://github.com/osubbu-uptycs/some_code.git'
    )
                            
    password(
      defaultValue: '', 
      name: 'vault_password', 
      description: 'Vault password'
    )

    string(
      defaultValue: '', 
      name: 'skip_tags', 
      trim: true,
      description: 'Skip tags'
    )

    string(
      defaultValue: '', 
      name: 'tags', 
      trim: true,
      description: 'tags to run'
    )

   }

   stages{
      stage ("echo Git Tag") {
        steps {
          echo "${params.version}"
        sh '''
           set
           env
           echo "version is $version"
           echo "vault_password, is $vault_password"
           echo "skip_tags is $skip_tags"
           echo "tags is $tags"
           echo "PHASSPHRASE=$PHASSPHRASE"
           ${WORKSPACE}/start_ssh_agent.sh ${PHASSPHRASE}
           echo "Build script completed"
        '''
       }
      }
  }
} 
