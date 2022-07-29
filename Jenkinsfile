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