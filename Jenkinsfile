node {

    checkout scm

    env.DOCKER_API_VERSION="1.23"
    
    sh "git rev-parse --short HEAD > commit-id"

    tag = readFile('commit-id').replace("\n", "").replace("\r", "")
    appName = "hello-nam"
    registryHost = "10.9.2.151:5000/"
    imageName = "${registryHost}${appName}:${tag}"
    env.BUILDIMG=imageName

    stage "Build"
    
        sh "docker build -t ${imageName} ."
    
    stage "Push"

        sh "docker push ${imageName}"

    stage "Deploy"
	kubernetesDeploy configs: "applications/${appName}/k8s/*.yaml", kubeconfigId: 'kube_config'
        sh "sed -i s/xxx/$tag}/g k8s/deployment.yaml"
	sh "kubectl apply -f k8s/deployment.yaml"
}
