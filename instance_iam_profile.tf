resource "aws_iam_instance_profile" "jenkins_iam_instance_profile" {
  name = "jenkins_iam_instance_profile"
  role = aws_iam_role.jenkins_instance_role.name
}

resource "aws_iam_role_policy_attachment" "jenkins-ssm-role-attach" {
  role       = aws_iam_role.jenkins_instance_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

resource "aws_iam_role_policy" "jenkins-backup-s3-policy" {
  name = "jenkins_backup_s3_policy"
  role = aws_iam_role.jenkins_instance_role.id

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "s3:ListBucket",
            "Resource": "arn:aws:s3:::${var.s3_jenkins_backup}"
        },
        {
            "Effect": "Allow",
            "Action": [
                "s3:GetObject",
                "s3:HeadObject",
                "s3:PutObject"
            ],
            "Resource": "arn:aws:s3:::${var.s3_jenkins_backup}/*"
        }
    ]
} 
EOF
}

resource "aws_iam_role" "jenkins_instance_role" {
  name = "jenkins_instance_role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF

  tags = {
    Name = var.jenkins_tf_tags
  }
}

