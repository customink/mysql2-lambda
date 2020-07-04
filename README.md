
# Lamby MySQL Layer

Installs dependencies for [customink/foundry](https://github.com/customink/foundry) on Lambda.

## Usage

* Clone or fork this repository.
* Make sure you have Docker or AWS CLI installed.
* Run `./bin/deploy` or `./bin/deploy-${stage}` scripts.

From there you simply use the arn in your AWS SAM `template.yaml` file.

## Dependencies

...

## Layer Size

In `/opt/lib64/mysql`

```
lrwxrwxrwx 1 root      17 Jul  2 00:49 libmysqlclient_r.so -> libmysqlclient.so
lrwxrwxrwx 1 root      20 Jul  2 00:49 libmysqlclient.so -> libmysqlclient.so.18
lrwxrwxrwx 1 root      24 Jul  2 00:49 libmysqlclient.so.18 -> libmysqlclient.so.18.0.0
-rwxr-xr-x 1 root 2983624 Dec  3  2018 libmysqlclient.so.18.0.0
```


## Methodology

We used the `lambci/lambda:build-ruby2.5` Docker image from the [docker-lambda](https://github.com/lambci/docker-lambda) project.
