pipeline {
  agent any
  stages {
    stage('echo') {
      steps {
        echo 'hello from the trigger'
        echo "$params.skiptags"
        echo "$params.tag"
      }
    }

  }
}
