pipeline{
  agent any 

  environment {
		PHASSPHRASE = credentials('passphrase')
  }
  
  parameters {
    string(
      defaultValue: '', 
      name: 'sprint', 
      trim: true,
      description: 'Which sprint to deploy? Help: Usually it is a three digit number and can not be empty.'
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
      description: 'Vault password'
    )

    string(
      defaultValue: '', 
      name: 'skip_tags', 
      trim: true,
      description: 'Skip tags to use in ansible playbook'
    )

    string(
      defaultValue: '', 
      name: 'extra_vars', 
      trim: true,
      description: 'Extra vars to use in ansible playbook'
    )

    choice(
      choices: ['none', 'subbutsu', 'staging'], 
      name: 'domain',
      description: 'Stack or Domain to deploy'
    )
  }

  stages{
    stage('Input Confirmation') {
      options {
        timeout(time: 60, unit: 'SECONDS') 
      }
      input {
        message "Sprint is $params.sprint"
        message "Version is $params.version"
        message "Domain is $params.domain"
        message "Skip tags is $params.skip_tags"
        message "Extra vars is $params.extra_vars"
        ok "Confirm"
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
        timeout(time: 60, unit: 'SECONDS') 
      }
      input {
        message "Review the ansible command and confirm to Deploy"
        ok "Deploy"
      }
    }
    stage ("Ansible script execution") {
      steps {
        sh '''
          /var/lib/jenkins/start_ssh_agent.sh ${PHASSPHRASE}
          echo "INFO: Build script completed"
        '''
      }
    }
  }
} 
