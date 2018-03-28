---
layout: post
title: "Using Different SSH Keys for Different Hosts"
tags: [git, ssh]
---

It's possible to configure SSH to use different RSA keys for different hosts.
On this short post I'll show how to set it up so git uses the right key for each repository.

As a guiding example for this post, let's assume you have a default key.
This is the key you use for your repositories in GitHub and perhaps some other websites.
You've just got hired by Vandelay Industries, a company that uses a self-hosted Bitbucket server.
You don't wish to mix your personal stuff with the company's stuff, so you create a new key:

```shell
$ ssh-keygen -t rsa -b 4096 -f ~/.ssh/vandelayid -C "gcostanza@vandelay.com"
```

Now, edit the `~/.ssh/config` file and associate the new key with the company's hostname.
If this file doesn't exist, create it.

```config
Host vandelay
    HostName bitbucket.vandelay.com
    IdentityFile ~/.ssh/vandelayid
    IdentitiesOnly yes
```

That's it.
Now, whenever you clone/pull/push from a repository in `bitbucket.vandelay.com`, git will use the correct key for authentication.
