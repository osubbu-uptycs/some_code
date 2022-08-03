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
      description: 'Build tag',
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
      choices: ['none', 'subbutsu', 'staging'], 
      name: 'domain',
      description: 'Stack to deploy'
    )

    string(
      defaultValue: '', 
      name: 'sprint', 
      trim: true,
      description: 'optional: sprint number [ default will be first three digits of build tag# ]'
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
