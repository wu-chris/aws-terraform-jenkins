[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)

# aws-terraform-jenkins
This project creates a HTTPS Jenkins service on AWS using terraform, the reason a ELB (elastic load balancer) is used here is because it allows us to use the SSL cert issued by AWS so it is easier to manage in long run.

# Setup python virtual environment
```
python3 -m venv myenv
source myenv/bin/activate
```

# Install pre-commit to automatically format your code
```
pip3 install pre-commit
pre-commit install
```

# Install Terraform
Terraform is a tool for building, changing, and versioning our AWS infrastructure safely and efficiently

```bash
brew install terraform
```   

# Configure AWS Credential
Generate an access key on AWS console, configure environment variables as followed
```bash
export AWS_ACCESS_KEY_ID="access-key-id"
export AWS_SECRET_ACCESS_KEY="access-key-secret"
```

# Prerequisites 
This project assumes some base resources created manually:
- S3 bucket as terraform backend 
   - a `jenkins` folder in a s3 bucket called `tf-state-backend`
- A managed DNS hosted zone
   - `xorzor.net.`
- A validated certificate
   - `*.xorzor.net`

_Make sure create your own version of above resources and replace the respective names in the tf scripts_


# Build Infrastructure 
```
# sync s3 backend state
terraform init

# preview and type 'yes' to proceed
terraform apply
```
