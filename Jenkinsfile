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
      name: 'extra_vars', 
      trim: true,
      description: 'extra vars'
    )

    choice(
      choices: ['subbutsu', 'staging'], 
      name: 'domain',
      description: 'Stack to deploy'
    )

   }

   stages{
      stage ("Ansible script creation") {
        steps {
        sh '''
           /var/lib/jenkins/start_ssh_agent.sh ${PHASSPHRASE}
           echo "Build script completed"
        '''
       }
      }
  }
} 
