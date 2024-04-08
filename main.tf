provider "aws" {
    region = "eu-west-1"
    access_key = secrets.AWS_ACCESS_KEY
    secret_key = secrets.AWS_SECRET_KEY
}
resource "aws_instance" "ec2" {
	count = 2
    ami = "ami-0c1c30571d2dae5c9"
    instance_type = "t2.micro"
    key_name = "k8s_test"
    security_groups = ["kubernetes_hybrid"]
    tags = {
        Name = "Kubernetes-${count.index}"
    }

    provisioner "local-exec" {
        command = "TIMEOUT /T 120 /NOBREAK ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook --private-key $HOME/Desktop/project/k8s_test.pem -i ${aws_instance.ec2.public_ip}, playbook.yaml"
    }
}
