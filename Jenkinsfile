pipeline {   
  agent any 
  stages {
    stage('Junit Build') {
      steps {
        sh "mvn compile"
      }
    }   
    
    stage('Junit Test') {
      steps {
        sh "mvn test"
      }
     post {
      always {
        junit '**/TEST*.xml'
      }
     }
  }
    
   stage('Generate Test Report') {
        steps {
           script {
               try { 
                 sh 'mvn org.jacoco:jacoco-maven-plugin:report'
                   } finally { 
               junit 'target/surefire-reports/*.xml'
                   } 
                }
             }
          }
    stage('Code Coverage Report') { 
         steps { 
           step(
                 [
                   $class: 'JacocoPublisher',
                   execPattern: 'target/*.exec', 
                   classPattern: 'target/classes', 
                   sourcePattern: 'src/main/java', 
                   exclusionPattern: 'src/test*' 
                 ]
               ) 
          } 
    }
    stage('newman') {
            steps {
                sh 'newman run RestfulBooker.postman_collection.json --environment RestfulBooker.postman_environment.json --reporters junit'
            }
            post {
                always {
                        junit '**/*xml'
                    }
                }
        }
    
   stage('Robot Framework System tests with Selenium') {
            steps {
                sh 'robot --variable BROWSER:headlesschrome -d Results  Tests'
            }
            post {
                always {
                    script {
                          step(
                                [
                                  $class              : 'RobotPublisher',
                                  outputPath          : 'Results',
                                  outputFileName      : '**/output.xml',
                                  reportFileName      : '**/report.html',
                                  logFileName         : '**/log.html',
                                  disableArchiveOutput: false,
                                  passThreshold       : 50,
                                  unstableThreshold   : 40,
                                  otherFiles          : "**/*.png,**/*.jpg",
                                ]
                          )
                    }
                }
            }
        } 
        
 }
}
