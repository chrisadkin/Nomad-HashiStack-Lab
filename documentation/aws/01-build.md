# AMI Image Build Instructions

1. Clone this repo:
```
git clone chrisadkin/Nomad-HashiStack-Lab
```

2. Change directory to the Nomad-HashiStack-Lab directory:
```
cd Nomad-HashiStack-Lab
```

3. Create the necessary environment variables for accessing your AWS account: 
```
export AWS_ACCESS_KEY_ID=<your access key id goes here>
export AWS_SECRET_ACCESS_KEY=<your access key secret goes here>   
```
   optionally if you are using session tokens, also specify:
```
export AWS_SESSION_TOKEN=<your session token goes here>
export AWS_SESSION_EXPIRATION=<your session token expiry goes here>
```

4. Open the ```variables.hcl``` file in the aws directory with the text editor of your choice and set the region on line two of the file to a 
   valid AWS region that you wish the cluster to be setup in.

5. Open the ```setup.sh``` file in the ```scripts``` directory and note the first thirty lines of the file
```
```   



==> Wait completed after 8 minutes 14 seconds

==> Builds finished. The artifacts of successful builds are:
--> amazon-ebs.hashistack: AMIs were created:
us-east-1: ami-0223da73fd3ccd229
