# Post HashiStack Deployment Health Checks

1. Check that you can access the Nomad console, to do this take the client ip address output from applying the terraform configuration and append ":4646" to the end of it.
   Past this into your browser address bar and you should see the following:
   
<img style="float: left; margin: 0px 15px 15px 0px;" src="https://github.com/chrisadkin/Nomad-HashiStack-Lab/blob/main/png_images/01-nomad-console-init.png?raw=true">

2. Lets create a simple Nomad job, we will need a job spec file first by issuing the following command, do this on the machine you run packer and terraform from:
```
$ nomad job init --short
```   
