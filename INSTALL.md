# INSTALL

    export CLUSTER=aussie
    az configure --defaults group=Aussie

## Get aks credentials

    az aks get-credentials -n $CLUSTER
    

## Init Helm

    helm init --history-max 200
    
Error: no available release name found
How to fix: https://github.com/helm/helm/issues/3055#issuecomment-356347732

    kubectl create serviceaccount --namespace kube-system tiller
    kubectl create clusterrolebinding tiller-cluster-rule --clusterrole=cluster-admin --serviceaccount=kube-system:tiller
    kubectl patch deploy --namespace kube-system tiller-deploy -p '{"spec":{"template":{"spec":{"serviceAccount":"tiller"}}}}'
    
## Setting Up the Kubernetes Nginx Ingress Controller

    kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/master/deploy/mandatory.yaml
   
We use apply instead of create here so that in the future we can incrementally apply changes to the Ingress Controller objects instead of completely overwriting them.

Output
    
    namespace/ingress-nginx created
    configmap/nginx-configuration created
    configmap/tcp-services created
    configmap/udp-services created
    serviceaccount/nginx-ingress-serviceaccount created
    clusterrole.rbac.authorization.k8s.io/nginx-ingress-clusterrole created
    role.rbac.authorization.k8s.io/nginx-ingress-role created
    rolebinding.rbac.authorization.k8s.io/nginx-ingress-role-nisa-binding created
    clusterrolebinding.rbac.authorization.k8s.io/nginx-ingress-clusterrole-nisa-binding created
    deployment.extensions/nginx-ingress-controller created
    
Create Ingress Controller LoadBalancer Service

    kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/master/deploy/provider/cloud-generic.yaml

Output
    
    service/ingress-nginx created
    
Waiting for Azure Load balancer to be created.

    kubectl get svc --namespace=ingress-nginx
    
Output

    NAME            TYPE           CLUSTER-IP    EXTERNAL-IP   PORT(S)                      AGE
    ingress-nginx   LoadBalancer   10.0.54.181   13.67.45.72   80:31558/TCP,443:30657/TCP   1m
    
Scale deployment

    kubectl scale deployment.v1.apps/api --replicas=1
    
    
Deploy ingress

    kubectl apply -f ingress.yaml

Delete ingress

    kubectl delete ingress.extensions/api-ingress
    