# sks-api

Simple API for searching public keys from email
===============================================


Routes
------

### GET /mail/'<email>'

This route returns a JSON with the following atributes:

- result
- data 

Subattributes of data:

- **algo**: algorithm 
- **public_key**: armored public key
- **revoked**: 0 for false, 1 for true
- **expires**: 0 for false, 1 for true
- **deleted**: 0 for false, 1 for true
- **id**: key id
- **created**: timestamp of the key creation
- **keylen**: key length

Example with curl:
```
$ curl -v http://127.0.0.1:3000/mail/superhomem@huskymail.com
* Hostname was NOT found in DNS cache
*   Trying 127.0.0.1...
* Connected to 127.0.0.1 (127.0.0.1) port 3000 (#0)
> GET /mail/superhomem@huskymail.com HTTP/1.1
> User-Agent: curl/7.37.1
> Host: 127.0.0.1:3000
> Accept: */*
> 
< HTTP/1.1 200 OK
* Server Mojolicious (Perl) is not blacklisted
< Server: Mojolicious (Perl)
< Content-Type: application/json;charset=UTF-8
< Date: Sat, 22 Aug 2015 21:05:41 GMT
< Content-Length: 3577
< Connection: keep-alive
< 
* Connection #0 to host 127.0.0.1 left intact
{
    "result": "success",
    "data": [{
        "algo": "1",
        "public_key": "-----BEGIN PGP PUBLIC KEY BLOCK-----\nVersion: SKS 1.1.4\nComment: Hostname: raxus.rnp.br\n\nmQINBFXYxsIBEAD8IelRRTlQ6h+nmiOQir\/6Mht7aO1jNyVrgkn7gbO0D6L3ZuADVglvEE+l\n027TDrhK5vJLQFINEpGJQH4vqW9Qn2ZGUQlNE7ZQt75JycSb5nUmS1AQYCii7BLcdbV1Xmeb\nqnwsfmQrmI1gEJVao4GS4q+gRSgagP4aSKXjCEDTtn9K47j1rjRV9RLAmsHb4IrSC48cTOhK\nKlMTpDLr8s726KM\/peeCLkR4gYwBo+lbq3SxJs459egA\/G75w+i9os6K9\/Fx8v7OOTxQ3z8U\n4dsxalfhSoXeDlAVMrVEW8tTsk9RQAuBlhuZ3hP7fzrVR12qFCUwBG+VDSaCGths8UwZvDgb\naPvIB8lOy+jhDhU\/\/KQT3QHj3FlYEf2ModG6fUZa5EesJWB1dJH5HNt7WO49qsZhXI1V6iTv\n6OPMKH2ZSDJgeTl7qWnn0cnhlf7coLy+OK758vDjunEqI886wn4UjHSoZ1PMsty0CtRDmMcE\nP4WfjHFjK5cQcW9RSdjgMLkCt4GeS09Vgm7TOv0rZwWWiOOMRAnWdy\/0A0KcCy9aOoWA2n5i\nvZZ98r8hDoDeDJ+H\/0JkCkk29mPSgcPRZ4yF9j+P6si43YY0acnKisUkso2kSx1g8NnwXkXa\nOOPUZAsYeGLiTLNsghezfw3ZnefaRuwSNlOsWhyuRqcuuEgBNwARAQABtDtTdXBlciBIb21l\nbSAoU3VwZXIgSG9tZW0gYm9sYWRvKSA8c3VwZXJob21lbUBodXNreW1haWwuY29tPokCOAQT\nAQIAIgUCVdjGwgIbAwYLCQgHAwIGFQgCCQoLBBYCAwECHgECF4AACgkQhbpU71yJ6jjuuw\/\/\nXCiVJ654TtrsbquqDWnGaijXJ5AY5lWj5ov2LE0UGRC8Cfd5DQJu7jmpkMuv3O8duIsmAnjM\nrXuPBB0jA9szZXZzIM7AmmOqZ9eI24j\/qeGk7r7K568f8PVZ1l46T2drKjHCMhcmBdOgV8yN\nPQS46eYVzR5wiy2sPu\/azw8uPjqz34ScNMdEQCJR4H1ouQG4Uzp2zHxHzgpUvNKcV454N54E\n8QOA3tExsyeIR6eIkQZfDdnMT13P5S+3\/d9\/Ok7DjlJnys2uc\/D3r+a1GUtZVC0RZC511k1M\nIHmYHS67nBW0XUwL2zbzWxb1waiUR732jD3K3xo030mibCHlQ9NMfzNdLClmez5WmtskDjDB\n\/uZLsydOP4xhhQeHqvexdt1D4fsXhIeBtgvnTx9gCR\/Tc5MKqfJ2rP1xxE0WqBxuRtN3+GDi\nhZ1\/WsomPsEXYVsYrVHkok0cbDOUIFLjGYwzHdJ9yeh7IbpMS9lbBIbET6xl7LjPWjKkt6zM\nTTJCc2YPNUlUjNiJKH1kA\/jrKDMJKKaPH7TJdsAEv9OdFfi\/VjIyQc3XKIlD+hGKsen975Q4\nJuPJG4jzv25hjkRh\/WOfFOoUwLoRqQLaDnD9ck4E6KnSo\/7RVNFwDJbHOUxxC6SOqeFRlQ2L\nK5AUkUiU7sXAjdhEZhqdpx30vXaydA3Jemu5Ag0EVdjGwgEQAKnq1wMf\/y4kDM8TlqWg5HWi\nIH2YHqG9jXec4v7h463KqasbXUA1H\/\/oJ98x6zMonrUN4kvOUQTbJ4joFMwyaCINwUvbAK\/m\nK8ekLAF8qV0OWXAl9ZPyMTLURJDTPVDFxxurs39mMUMzJDENBj+47H+txRj3c0Pdhl+y\/4pI\nuPqaiiIlXReCPn6Ko3jZLxxhaFQcoSrQqCd96cOPoZTUcYx\/K1BVyUreZhRKUmvAR2NbtE3u\ntQ2q3Jx3PZlWVMgy5+CYIL4TEU+CslXcXl3aMh7\/6pgCamZI1xQ4XazGeNQjl8\/akoCCYlvw\n3rtOanlyGlEWOBeXEMu0+\/laiY6CoWa+MYaPl2m\/poMKEIWiqmABUXbvATNA6CH1AqKsAlKd\nncQvPQgK973hd48oYhsfkvTIN3Fozh0cK6E2mWbfWQDjp9HZ5L44OAlrr7mLDXibQpB+tNoy\n\/KIojSPGuWWvnLusTYBGOMNIP05gWOpOg55l1MRYqLyNQ5XaOA2LQ5fojKSADjeVVBwlpGTF\n8AZjZ8VjX2Tr\/fLj2YoErTHNEAFk6z70lVCo\/DIdeTX+oZJQOPOjiHwAFzjb5C3XrGJ5+xEv\n92gpEonSrL6FrY8jcpfkmysl9vX+1GsGmUe8yk4VipUYEKcqsgIPq1B2KY8AZs0nYQ1zy+FG\n6Yv1N+dZQgA1ABEBAAGJAh8EGAECAAkFAlXYxsICGwwACgkQhbpU71yJ6ji5aA\/+IZUS6Mci\nJZI\/fRDTc8xA\/by0vqsVT5gfrOylvtFAzn5sNYeSjNKgMZMkaliSTZze8Mzvull90\/0ixMrK\n6KvkFySGN1tyjyUyRH8+KGeCjexogsOmQ8qBLGNZu+5O6OV93mxwb\/zkG2voczDb0Z1Z6LfU\nq6UuD51dFKUkuUYTMn0102mTFzl\/Ox+8Qor\/v5lMQmWe+RcyvF7oxwKSYIW+FXVCfrQx3ma8\nWZ5EGlrTsJreJYPFW9mdTB0CpSzmi\/cJEY7Bf4W6qoS\/avIUgZBpwKE9U68rFdCiT7agc2K3\nBAHp738JUlW7\/zNt03qcg4FuqmHiCywY63detXNaaPYVxqPK\/edKsY+OP5Iw+51phUmkWNWP\nh8lItBa6eUCA672lrVZs4SjiliDuIIpKume0HjlD14Gjpe+BzUBGWn5GBH8hler40owjYsbi\n9usZqcMN6z61p3TV5ZgHwpuhiA7jx+H1W25ZlpPIAvbjpsxsFDPlJZ1WE8AHMxuYSsOoI7ZT\n7vQ7SiSnXJ9G0PIsUYMSxeNFyG4t9tvqNCJNb\/AlBL\/NW1vLQ3mzXzHteZuEd\/8EwgJWXmWi\nNoPM+4\/uY4a7JuUQoUK+8xizdepfM8SuyHyc9ACnTUjNAUpk0E+4aRTyM\/9nv3ircdyrLy96\nNzUblyX9UXJirG\/YzDG5tEEnUxI=\n=HUwn\n-----END PGP PUBLIC KEY BLOCK-----",
        "revoked": 0,
        "id": "5C89EA38",
        "uids": [{
            "deleted": 0,
            "expired": 0,
            "expires": null,
            "ok": 1,
            "revoked": 0,
            "created": 1440270018,
            "uid": "Super Homem (Super Homem bolado) <superhomem@huskymail.com>"
        }],
        "created": 1440270018,
        "keylen": "4096",
        "ok": 1,
        "expires": null,
        "expired": 0,
        "deleted": 0
    }]
}
```

Installing and running
----------------------

Using cpanm:

```
cd sks-api/src
cpanm --installdeps .
morbo sks-api.pl 
```

TODO
----

- Return the subattribute of 'data' with information about signers.

