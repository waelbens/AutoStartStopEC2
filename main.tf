# Lambda function which stop Jenkins instance

resource "aws_lambda_function" "StopJenkinsInstance" {
  filename         = "../functions/StopJenkinsInstance.zip"
  function_name    = "StopJenkinsInstance"
  role             = "${aws_iam_role.StopJenkinsInstance.arn}"
  handler          = "StopJenkinsInstance.handler"
  timeout          = "5"
  runtime          = "nodejs6.10"
  source_code_hash = "${base64sha256(file("functions/StopJenkinsInstance.zip"))}"
}

resource "aws_iam_role" "StopJenkinsInstance" {
  name               = "StopJenkinsInstance-${var.archi}"
  assume_role_policy = "${data.aws_iam_policy_document.StopJenkinsInstance.json}"
}

data "aws_iam_policy_document" "StopJenkinsInstance" {
  statement {
    actions = [ "sts:AssumeRole" ]
    principals {
      type = "Service"
      identifiers = ["lambda.amazonaws.com", "ec2.amazonaws.com"]
    }
  }
}


resource "aws_iam_role_policy" "StopJenkinsInstance" {
  name   = "StopJenkinsInstance-${var.archi}"
  role   = "${aws_iam_role.StopJenkinsInstance.id}"
  policy = "${data.aws_iam_policy_document.StopJenkinsInstance.json}"
}

resource "aws_iam_role_policy" "StopJenkinsInstance-policy" {
  name   = "StopJenkinsInstance-policy-${var.archi}"
  role   = "${aws_iam_role.StopJenkinsInstance.id}"
  policy = "${data.aws_iam_policy_document.StopJenkinsInstance-policy.json}"
}

data "aws_iam_policy_document" "StopJenkinsInstance-policy" {
  statement {
    effect    = "Allow"
    actions   = [
      "ec2:*",
    ]
    resources = [
      "*",
    ]
  }
}


# Lambda function which start Jenkins instance

resource "aws_lambda_function" "StartJenkinsInstance" {
  filename         = "../functions/StartJenkinsInstance.zip"
  function_name    = "StartJenkinsInstance"
  role             = "${aws_iam_role.StartJenkinsInstance.arn}"
  handler          = "StartJenkinsInstance.handler"
  timeout          = "5"
  runtime          = "nodejs6.10"
  source_code_hash = "${base64sha256(file("functions/StartJenkinsInstance.zip"))}"
}

resource "aws_iam_role" "StartJenkinsInstance" {
  name               = "StartJenkinsInstance-${var.archi}"
  assume_role_policy = "${data.aws_iam_policy_document.StartJenkinsInstance.json}"
}

data "aws_iam_policy_document" "StartJenkinsInstance" {
  statement {
    actions = [ "sts:AssumeRole" ]
    principals {
      type = "Service"
      identifiers = ["lambda.amazonaws.com", "ec2.amazonaws.com"]
    }
  }
}


resource "aws_iam_role_policy" "StartJenkinsInstance" {
  name   = "StartJenkinsInstance-${var.archi}"
  role   = "${aws_iam_role.StartJenkinsInstance.id}"
  policy = "${data.aws_iam_policy_document.StartJenkinsInstance.json}"
}

resource "aws_iam_role_policy" "StartJenkinsInstance-policy" {
  name   = "StartJenkinsInstance-policy-${var.archi}"
  role   = "${aws_iam_role.StartJenkinsInstance.id}"
  policy = "${data.aws_iam_policy_document.StartJenkinsInstance-policy.json}"
}

data "aws_iam_policy_document" "StartJenkinsInstance-policy" {
  statement {
    effect    = "Allow"
    actions   = [
      "ec2:*",
    ]
    resources = [
      "*",
    ]
  }
}

