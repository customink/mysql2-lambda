# Mysql2 Lambda Gem

<a href="https://github.com/customink/lamby"><img src="https://user-images.githubusercontent.com/2381/59363668-89edeb80-8d03-11e9-9985-2ce14361b7e3.png" alt="Lamby: Simple Rails & AWS Lambda Integration using Rack." align="right" width="300" /></a>Very simple [Mysql2](https://github.com/brianmario/mysql2) gem precompiled for Amazon Linux 1 & 2 (Ruby 2.5 & 2.7) with statically linked `libmysqlclient` ready for any AWS Lambda usage, including Rails.

```ruby
gem 'mysql2-lambda'
```

Part of a suite of open source projects from **[Lamby: Simple Rails & AWS Lambda Integration using Rack.](https://github.com/customink/lamby)** Details include:

- Tested on Ruby 2.5.x & 2.7.x
- Small Size! Only 5 Megabytes. No Lambda Layers needed!
- Works with any MySQL connection. Including RDS Proxy.

## Methodology

We used the `lambci/lambda:build-ruby2.5` Docker image from the [docker-lambda](https://github.com/lambci/docker-lambda) project to build the MySQL Connector/C's `libmysqlclient`. From there we ensure the Mysql2 gem statically includes that library. The resulting packaged gem and `mysql2.so` file looks something like this.

```shell
$ ldd mysql2.so
  linux-vdso.so.1 =>  (0x00007ffcb15d4000)
  libstdc++.so.6 => /usr/lib64/libstdc++.so.6 (0x00007fa8ebd21000)
  librt.so.1 => /lib64/librt.so.1 (0x00007fa8ebb19000)
  libpthread.so.0 => /lib64/libpthread.so.0 (0x00007fa8eb8fd000)
  libgmp.so.10 => /usr/lib64/libgmp.so.10 (0x00007fa8eb687000)
  libdl.so.2 => /lib64/libdl.so.2 (0x00007fa8eb483000)
  libcrypt.so.1 => /lib64/libcrypt.so.1 (0x00007fa8eb24c000)
  libm.so.6 => /lib64/libm.so.6 (0x00007fa8eaf4a000)
  libc.so.6 => /lib64/libc.so.6 (0x00007fa8eab7c000)
  libgcc_s.so.1 => /lib64/libgcc_s.so.1 (0x00007fa8ea966000)
  /lib64/ld-linux-x86-64.so.2 (0x00007fa8ec72e000)
  libfreebl3.so => /lib64/libfreebl3.so (0x00007fa8ea764000)
```

## Development

Clone or fork this repository, make sure you have Docker installed, then run the following commands.

```shell
./bin/setup
./bin/build
```

You will now have a packaged gem in the root of your project.

## License

Thanks to all the contributors of the `Mysql2` (https://github.com/brianmario/mysql2) gem. The license here is the same as that. MIT.

## Code of Conduct

Everyone interacting in the Mysql2 Lambda project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/customink/mysql2-lambda/blob/master/CODE_OF_CONDUCT.md).
