[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)

# Overview
This project uses Terraform to spin up a HTTPS Jenkins service on the AWS

# Setup

## Install poetry

```
pip3 install poetry
```

## Install pre-commit

```
poetry run pre-commit install -t pre-commit
```

## Install terraform

```
brew install terraform
```  

# Prerequisites
Some base resources need to be created manually:

- A S3 bucket as terraform backend
- A managed DNS hosted zone for your jenkins website
   - `yourdomain.net.`
- A validated certificate for your jenkins website
   - `*.yourdomain.net`


# Build
Setup AWS profile on your machine and run the following commands.

You will be prompted for the following information when you run the commands:
- `tf_state_bucket`: the name of the s3 bucket that stores your state file
- `tf_state_key`: the key to the state file in the s3 bucket
- `domain`: the domain name of the jenkins website, e.g. `yourdomain.net`

```
# sync s3 backend state
terraform init

# preview and type 'yes' to proceed
terraform apply
```

Once completed, you would be able to access the Jenkins via URL `jenkins.yourdomain.net`
