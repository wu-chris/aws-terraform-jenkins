[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)

# Overview
This project creates a HTTPS Jenkins service on AWS using terraform.  

We use Elastic Load Balancer (**ELB**) because it allow us to use AWS managed SSL certificate which is easier to manage in long run.

# Setup

1. `Python`
```
python3 -m venv myenv
source myenv/bin/activate
```

2. `pre-commit`
```
pip3 install pre-commit
pre-commit install
```

## Install terraform

```bash
brew install terraform
```   

# AWS Access Key
Generate an access key on AWS console, add the following environment variables on your work machine:
```bash
export AWS_ACCESS_KEY_ID="access-key-id"
export AWS_SECRET_ACCESS_KEY="access-key-secret"
```

# Prerequisites 
Some base resources need to be created manually:

- S3 bucket as terraform backend 
   - a `jenkins` folder in a s3 bucket called `tf-state-backend`
- A managed DNS hosted zone
   - `xorzor.net.`
- A validated certificate
   - `*.xorzor.net`

> :warning: create your own version of above resources and replace the respective names in the terraform scripts 


# Build 
```
# sync s3 backend state
terraform init

# preview and type 'yes' to proceed
terraform apply
```

Once completed, you would be able to access the Jenkins via URL `jenkins.xorzor.net`
