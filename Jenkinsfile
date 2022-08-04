pipeline{
  agent any 

  environment {
		SALT_KEY = credentials('saltkey')
  }
  
  parameters {
    string(
      defaultValue: '', 
      name: 'sprint', 
      trim: true,
      description: 'Which sprint to deploy? Help: Usually it is a three digit number.'
    )
  
    string(
      defaultValue: '', 
      name: 'version', 
      trim: true,
      description: 'Which build# to deploy? Help: Usually it is a six digit number, starts with the sprint series.'
    )
                            
    password(
      defaultValue: '', 
      name: 'vault_password', 
      description: 'Vault password to use in ansible command'
    )

    string(
      defaultValue: '', 
      name: 'skip_tags', 
      trim: true,
      description: 'Skip tags to use in ansible playbook. Optional argument.'
    )

    string(
      defaultValue: '', 
      name: 'extra_vars', 
      trim: true,
      description: 'Extra vars to use in ansible playbook. Optional argument.'
    )

    choice(
      choices: ['none', 'subbutsu', 'staging'], 
      name: 'domain',
      description: 'Stack or Domain env to deploy'
    )
  }

  stages{
    stage ("Echo inputs") {
      steps {
        sh '''
           echo "INFO: sprint is $sprint"
           echo "INFO: version is $version"
           echo "INFO: domain is $domain"
           echo "INFO: skip_tags is $skip_tags"
           echo "INFO: extra_vars is $extra_vars"      
        '''
       }
    }
    stage('Input Confirmation') {
      options {
        timeout(time: 30, unit: 'SECONDS') 
      }
      input {
        message "Review the Inputs and confirm to Deploy"
        ok "Confirm"
      }
      steps {
        echo "INFO: Continuing with ansible script creation"
      }
    }
    stage ("Ansible script creation") {
      steps {
        sh '''
          /var/lib/jenkins/create_ansi_script.sh
          echo "INFO: Build script created"
        '''
      }
    }
    stage('Deploy Confirmation') {
      options {
        timeout(time: 30, unit: 'SECONDS') 
      }
      input {
        message "Should we continue?"
        ok "Deploy"
      }
      steps {
        echo "INFO: Continuing with deployment"
      }
    }
    stage ("Ansible script execution") {
      steps {
        sh '''
          /var/lib/jenkins/start_ssh_agent.sh ${SALT_KEY}
          echo "INFO: Build script completed"
        '''
      }
    }
  }
} 
