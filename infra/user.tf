//resource "aws_iam_user" "raaz" {
//  name = "raaz_user"
//}
//
//resource "aws_iam_access_key" "raaz" {
//  user = "${aws_iam_user.raaz.name}"
//}
//
//resource "aws_iam_user_policy" "raaz_role" {
//  name = "test"
//  user = "${aws_iam_user.raaz.name}"
//
//  policy = <<EOF
//{
//  "Version": "2012-10-17",
//  "Statement": [
//    {
//      "Effect": "Allow",
//      "Action": [
//        "s3:PutObject",
//        "s3:GetObject",
//        "s3:DeleteObject"
//      ],
//      "Resource": ["arn:aws:s3:::${aws_s3_bucket.raaz.bucket}/*"]
//    },
//    {
//      "Effect": "Allow",
//      "Action": "s3:ListAllMyBuckets",
//      "Resource": "*",
//      "Condition": {}
//    }
//  ]
//}
//EOF
//}