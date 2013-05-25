mpherg's dotfiles
=================

These are my "dotfiles," or the private files that go into a user's home
directory that set up a shell environment.


A Note About SSH Private Keys
-----------------------------

`ssh-keygen`'s default behavior for encrypting SSH private keys has some
weaknesses. Here's how the AES key is derived from the password:

1. Append the first 8 bytes of the initialization vector to the passphrase,
   thus creating a salt.
2. Compute the MD5 hash one time of the resulting string.

This is weak for at least two reasons:

1. The digest algorithm is hard-coded to MD5. This could be a problem if MD5
   turns out to be insecure. Already there is some evidence to suggest this
   outcome.
2. The hash function is applied only once. Since MD5 and AES are both fast, a
   short passphrase is easy to break with brute force.

### Upgrade To Better Protection ###

Read [Martin Kleppmann's description][1] to understand the details of what's
going on under the covers:

    $ mv ~/.ssh/id_rsa ~/.ssh/id_rsa.old
    $ openssl pkcs8 -topk8 -v2 aes-256-cbc -in ~/.ssh/id_rsa.old -out ~/.ssh/id_rsa
    $ chmod 600 ~/.ssh/id_rsa
    $ rm ~/.ssh/id_rsa.old

You can replace `aes-256-cbc` with any of the ciphers listed when executing
the command `openssl list-cipher-commands`.


Thanks
------

[Zach Holman][2] for the [installer][3] and other goodies.

[1]: http://martin.kleppmann.com/2013/05/24/improving-security-of-ssh-private-keys.html
[2]: https://github.com/holman
[3]: https://github.com/holman/dotfiles/blob/master/script/bootstrap
