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
        parameters {
          choice(name: 'Sprint', choices: "$params.sprint\n")
          choice(name: 'Version', choices: "$params.version\n")
          choice(name: 'Domain', choices: "$params.domain\n")
          choice(name: 'Skip Tags', choices: "$params.skip_tags\n")
          choice(name: 'Extra Vars', choices: "$params.extra_vars\n")
        }
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
        timeout(time: 60, unit: 'SECONDS') 
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
          /var/lib/jenkins/start_ssh_agent.sh ${PHASSPHRASE}
          echo "INFO: Build script completed"
        '''
      }
    }
  }
} 
