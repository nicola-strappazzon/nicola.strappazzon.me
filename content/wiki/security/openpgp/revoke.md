+++
date = '2025-05-09T10:56:29+02:00'
draft = false
title = 'Revoke'
tags = ["bash", "security", "yubikey", "openpgp"]
+++

$ gpg --output revoke.asc --gen-revoke nicola@strappazzon.me

sec  rsa4096/8E97CAEEEE861364 2024-02-17 Nicola Strappazzon <nicola@strappazzon.me>

Create a revocation certificate for this key? (y/N) y
Please select the reason for the revocation:
  0 = No reason specified
  1 = Key has been compromised
  2 = Key is superseded
  3 = Key is no longer used
  Q = Cancel
(Probably you want to select 1 here)
Your decision? 0
Enter an optional description; end it with an empty line:
> This is a backup revocation certificate in case the key has been compromised.
>
Reason for revocation: No reason specified
This is a backup revocation certificate in case the key has been compromised.
Is this okay? (y/N) y
ASCII armored output forced.
File 'revoke.asc' exists. Overwrite? (y/N) y
Revocation certificate created.
