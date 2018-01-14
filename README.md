# dotfiles
UNIX conf files and other configs for a new system.

To install just run `make install` in this directory.

## Other configs

To set the correct OpenVPN SELinux context for OpenVPN certificates:

```bash
semanage fcontext -a -t home_cert_t "/path/to/certificates(/.*)?"
restorecon -R /path/to/certificates
```


