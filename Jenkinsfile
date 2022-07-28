pipeline {
  agent any
  stages {
    stage('echo') {
      steps {
        echo 'hello from the trigger'
        params.each {param ->
          println "${param.key} -> ${param.value} "
        }
        echo "$params.skiptags"
        echo "$params.tag"
        sh '''
           set
           env
        '''
      }
    }

  }
}
