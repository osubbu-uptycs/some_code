pipeline{
  agent any 

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
      useRepository: 'https://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@github.com/osubbu-uptycs/some_code.git')
   }
   stages{
      stage ("echo Git Tag") {
        steps {
          echo "${params.version}"
        }
     }
  } 
}