pipeline{
  agent any 

  parameters {
    gitParameter(
      branch: '',
      branchFilter: ".*",
      defaultValue: "",
      description: '',
      listSize: '10',
      name: 'Version',
      quickFilterEnabled: false,
      selectedValue: 'NONE',
      sortMode: 'ASCENDING_SMART',
      tagFilter: "*",
      type: 'PT_BRANCH_TAG',
      useRepository: 'https://github.com/osubbu-uptycs/some_code.git')
   }
   stages{
      stage ("echo Git Tag") {
        steps {
          echo "${params.Version}"
        }
     }
  } 
}